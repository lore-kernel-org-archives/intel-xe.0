Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBAFEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 13:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CBE10E042;
	Wed, 28 Jun 2023 13:26:35 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B56810E042
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687958794; x=1719494794;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FbfHtVHn2aM7LsH5+otz7jo0E65P+UsH7Tm9ClhY7GM=;
 b=JO2TcEaaZUjWPQj+EJXy78sqJmAj6zF7e7TvmGib7j4cz/PZt+Q6nS5N
 wuG/98XxPBrNz8oz9yYZDruKnfFlKXzG2N+WkpVc9vGO+AdK0vTp5fNZM
 EJqEenviFErq0WXcdcgKg67/ZmGG25D4cjHENg2HRkw5ebzG8J72CNl/d
 HPP/VSKwU/cShtJYMUN73J+x8r7TCfut2jwtH0Y5RGEb47sZ8DDGBTitW
 skS0skETuWMAuIoQ7E17PxGmxohCe/EUFi4UQCrusMAsFf7FoDrmRF+08
 eBoPc08GIEvhFURkMtoT9YkwiRuqSvXtdsTfNSUmiA8+c8NhKINLrr592 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="346604265"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="346604265"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 06:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="720242450"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="720242450"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jun 2023 06:26:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 06:26:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 06:26:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 06:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDYYTuC8HOzVbVMRA2BKviBtbPpUaegCq4yfI+wMyocKUQSaqFUtbh9tMZ6PQdd75VZHkKcNdBVepAj766U8GzpESF0RjYiSEdAVoBJUdNAxnyZPvVWTqpgpY+c3ITIj3WaeWCYaFsGoBXG7LDcd+2qBzZ35LyqKwbYBtULhcBH26EywKtlbzHW71LEn6kzy1Qfv/wqMturt4SQANuRCqZbQdtVlgH6G84wxuzDSy469m9A8GzX+TJi4+WUpIGyLmnKRu3DlJhtgQ14BeX1zKIpq+hq/qlQiJzWp/kgGDowm0dBWbP4pAKdmaiI1RKl/lKrVS0k7UcNDQmt8sAjKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mf2u/PV0d7oasjt6dEFEjoCAsgfVxQrZLtX+0UcACb0=;
 b=gpaLiKGRH+uVipF4LnlzuE6w7qnapnwU8uJ5GRhTRybaTa/m7u3p8oc6oZ1HzkHBCg2qe2K/evEQb2ERt/XEuPQWXN7cgozLDlJISJ1hhaMfa8hC+mUdmGopoHOVhjoVef8kydzkGOgiuCQLOOgWtw/QmtL1d1TyRujNE3V6XhswsBbqYWEPC80avF5jAkUq4UJ5GVShJOWE3scuPWE0pAinJTcbdV3fPmZU6VrA4Aw4IDC14viUa5xcIZtTtPbxWLDyFydOxLX1b4l6T+55b8Ld1fgl5m7w905WsnS4w0v3D8hdz1R8LDWPa5RF8w7A0fWNke1cRptWFR9bSkut1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 13:26:30 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d%5]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 13:26:30 +0000
Date: Wed, 28 Jun 2023 15:26:23 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZJw0_7x9uJ5D9pBk@fdugast-desk.home>
References: <20230628125146.72041-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628125146.72041-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY8PR11MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: d62b7690-0d49-46d1-9242-08db77db4840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4X+vH0doYSxBAlqohrQBwCbOq3KZlHMRLtn7udGnwCfe4ef0XCJvQMsdiFksrzZe9v64ZfxkAADhbwxC4Av304LaMZIsdY4Em6p4nLvuww3PnSoQevn7xJj2xOjgtuYJjf4/bHPFxoj66A6pxz1XSpm4RfeOW1QVRFulgbDwz6xBgtWG2KMeXC/C9F44GnqyS8E0kTI4MYhiSBUh3KnG0nb5izKsCIt7ri41fbY8l90HSIRUl+Z2exwhISyvworKdG6ttIZKP7ln0lct5yehhKWMvOlM6N2kWV/nX4yIOiQM9AR3M4yy9+UkILVcNS1JAlAlXAo3IFzS1sCHL8dDF0e63oOWLIHvSO7rJdDwG7e0rue98RhjmyGFORxVn8R4TeKsux5qKVjjGEiHKlIYivgCox6TSTDjWnjf7+ZcGexxiqgZONzODqaLTueygArmr5MI1BHnM9YIq2LM/4+XmreNH5lgzU7JLA91D/deuinmQF8hbhD4kF5atY9XHRUb7fY/CJyxFNraHOLxgLcoQ2RAP+PQbxDrBLCfS4/jO9b13LcNgv316yFZhRgaDsAWRJS+pbFmINNOLiyh5UF810pdGl8ajbGbrJla5ioExuU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(83380400001)(66574015)(86362001)(36756003)(38100700002)(82960400001)(5660300002)(36916002)(6486002)(41300700001)(316002)(8676002)(8936002)(478600001)(6666004)(66946007)(4326008)(6916009)(66476007)(66556008)(66899021)(186003)(26005)(6512007)(6506007)(9686003)(44832011)(25096002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XZA0qgrnd0RZ95XbfJoNfqkt5ys5Oso8DTcHnToXFnDyFiufS7xLCcBJYg?=
 =?iso-8859-1?Q?E1xqQVpITmjJhZBWtddANrrpKoFsge/icgfg2jbeP0zIi/WPTPD0sOj424?=
 =?iso-8859-1?Q?/b4n37Kp9LeSxCJXSE+xUmXdlTiq1lW5ykL+TxBw49ZrsAdG5WTCNT1gvl?=
 =?iso-8859-1?Q?IXyMUiRJXdBMPDKk2EtbzA7aiLzh9ggjctacLW8HS/ak7YsxHlT0oeUkvJ?=
 =?iso-8859-1?Q?o19WYWZiGjbpxJ08YwlvuvRdSr9WX4MK4YIReYBGUVMr3lNkaRv6UCmIo0?=
 =?iso-8859-1?Q?XOW438R2vS49XlU48KB5U0CaGJwCuUFNhfXriFPDNEYbKH5o6td97n4Dbd?=
 =?iso-8859-1?Q?MxxY68wHwoj6ZoB3ZdUiKP8fn2kQxqXiI/FMpBudWPU99w9xPYgpoJ6XSG?=
 =?iso-8859-1?Q?GAbtZN1YgFMBw//4NTT8ZABK77UJDC3K0cLEdAPZrKMymi9zPLmC1DHKRy?=
 =?iso-8859-1?Q?1xpZJbyKPAZDYovbRdUySpC9F4ZFFfSxk6rg1TtBlO0Rde2O3FR7kZuiEo?=
 =?iso-8859-1?Q?qVU3PfyyelAW9FjGWLC2rxH6W8bTDuXhrpDZPAXHdvf+Ljz0rybUAzAYZ3?=
 =?iso-8859-1?Q?P2IvMluyH2+O9RPN+Mf9rnqe13VsYDmcJIp13nna2q8Yu5PW/MAgqF8r94?=
 =?iso-8859-1?Q?ABJY6d+iyScK8+c4afL2mA78/5Sy2iawXKKmJGEy4Ffdh6R1zSlrPhPUp/?=
 =?iso-8859-1?Q?quppGsmXE9O8Qo+bODoEX2VDy+L7Yr0C9m94DVBq1MvITg8l+AOmr/Ij2m?=
 =?iso-8859-1?Q?9PrTNTRHoC4mH0f6306oRzAXVJMkR4hn9oX1eix0DvLB0q+kcRlKEm1ifp?=
 =?iso-8859-1?Q?thTTxxm6LsFZcv76qaBDZGWzhObw505oGgXaWo/aDYzoMIryvb6r+jZUDJ?=
 =?iso-8859-1?Q?SOGxMH4WGIW5mElTHZIIGwgqcAfngqN9Pq5odR6mg7NV5pBjzTN6r84DIn?=
 =?iso-8859-1?Q?UIUM9GkW4Ido5gZMgBY2rdu7vIG/4X071pW75ctTHoIjFSNXYBkBqu3grl?=
 =?iso-8859-1?Q?DGhmYMaNY53LDeBHYAqIk2R1WJ2UPyVCkytoHgj2twRuE6/Z9etotKUydH?=
 =?iso-8859-1?Q?USIX3J0Pj9rfyqhqtM9FqsAbkxgrT3wyZfekrzyUEXfN/mLKEgzX6aSWIk?=
 =?iso-8859-1?Q?QJHkHslCWEpabWS7g/HV8DBiH9wvnb4iS5qTQVoj2awnXwMxuj2md7ZRth?=
 =?iso-8859-1?Q?+MpLCMbt9NLmJzbWmgDxuTHNuQmQ9L8avKDGCbmxWSDjmVhwFpzvahYM+a?=
 =?iso-8859-1?Q?NmkpDULXU1ti2OxpE2w+B8JplMb2NGyWSWeGhZm73wtwIM4hRAVjoJ8gmg?=
 =?iso-8859-1?Q?Mt08R5o5uazF3siyV6Ur8H4eIt+bhYEC1U+XwE/xnWZrCT2Z5PtVXgcsLG?=
 =?iso-8859-1?Q?+5up2l11em4SDL+fDAkPRf6UBYR9R2e8D2vJ91/GyA+4250C7L/P8USY1y?=
 =?iso-8859-1?Q?t0A7J43pON5iu0eLo6XLmJGwQU+z5diUAxTX03YAnChPzJIg9eHkrfN1B6?=
 =?iso-8859-1?Q?9Ur8iE3qGsLbFmJF3Q5G2GmW1KnrD7KILr3pzIUmCxrNcukQZhl7rC4T8i?=
 =?iso-8859-1?Q?TDZbI2h6DE2ei8kBhDkLgJQWzHJMp22bPx4G0kbxiqXYlCMmXvZ2L9PBGF?=
 =?iso-8859-1?Q?C1aztj/FChFOOdwtveyhcu1OE/FZEArZzRzLchNLhAitSLlZrWWUmicQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d62b7690-0d49-46d1-9242-08db77db4840
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 13:26:29.8492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5guPbK+uPhunmHZn1VCwe/Sf7qv8ClXl6CxYHu11WaR+UE6oN9xvcbmEn9uTGbr80APgwXVUp4ebxAsw8jUivm9pLpXpZtZJwGNe6bamF6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] Documentation/gpu: Add a VM_BIND async
 draft document
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Jun 28, 2023 at 02:51:46PM +0200, Thomas Hellström wrote:
> Add a motivation for and description of asynchronous VM_BIND operation
> 
> v2:
> - Fix typos (Nirmoy Das)
> - Improve the description of a memory fence (Oak Zeng)
> - Add a reference to the document in the Xe RFC.
> - Add pointers to sample uAPI suggestions
> v3:
> - Address review comments (Danilo Krummrich)
> - Formatting fixes
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  Documentation/gpu/drm-vm-bind-async.rst | 150 ++++++++++++++++++++++++
>  Documentation/gpu/rfc/xe.rst            |   4 +-
>  2 files changed, 152 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> 
> diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
> new file mode 100644
> index 000000000000..8f9e2d5c8f0f
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-async.rst
> @@ -0,0 +1,150 @@
> +====================
> +Asynchronous VM_BIND
> +====================
> +
> +Nomenclature:
> +=============
> +
> +* ``VRAM``: On-device memory. Sometimes referred to as device local memory.
> +
> +* ``gpu_vm``: A GPU address space. Typically per process, but can be shared by
> +  multiple processes.
> +
> +* ``VM_BIND``: An operation or a list of operations to modify a gpu_vm using
> +  an IOCTL. The operations include mapping and unmapping system- or
> +  VRAM memory.
> +
> +* ``syncobj``: A container that abstracts synchronization objects. The
> +  synchronization objects can be either generic, like dma-fences or
> +  driver specific. A syncobj typically indicates the type of the
> +  underlying synchronization object.
> +
> +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
> +  for these before starting.
> +
> +* ``out-syncbj``: Argument to a VM_BIND_IOCTL, the VM_BIND operation
> +  signals these when the bind operation is complete.
> +
> +* ``memory fence``: A synchronization object, different from a dma-fence.
> +  A memory fence uses the value of a specified memory location to determine
> +  signaled status. A memory fence can be awaited and signaled by both
> +  the GPU and CPU. Memory fences are sometimes referred to as
> +  user-fences, and do not necessarily bey the dma-fence rule of

s/bey/obey/

> +  signalling within a "reasonable amount of time". The kernel should
> +  thus avoid waiting for memory fences with locks held.
> +
> +* ``long-running workload``: A workload that may take more than the
> +  current stipulated dma-fence maximum signal delay to complete and
> +  which therefore needs to set the gpu_vm or the GPU execution context in
> +  a certain mode that disallows completion dma-fences.
> +
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected vmas, submits a gpu command batch and registers the

The document sometimes uses "GPU" and sometimes "gpu", maybe we can stick to
"GPU" everywhere?

> +  dma_fence representing the gpu command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +
> +* ``bind context``: A context identifier used for the VM_BIND
> +  operation. VM_BIND operations that use the same bind context can be
> +  assumed, where it matters, to complete in order of submission. No such
> +  assumptions can be made for VM_BIND operations using separate bind contexts.
> +
> +* ``UMD``: User-mode driver.
> +
> +* ``KMD``: Kernel-mode driver.
> +
> +
> +Synchronous / Asynchronous VM_BIND operation
> +============================================
> +
> +Synchronous VM_BIND
> +___________________
> +With Synchronous VM_BIND, the VM_BIND operations all complete before the
> +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
> +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
> +for example swapin or clearing, or even previous binds.

s/swapin/swapping/ ?

> +
> +Asynchronous VM_BIND
> +____________________
> +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
> +IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
> +before modifying the GPU page-tables, and signal the out-syncobjs when
> +the modification is done in the sense that the next exec function that
> +awaits for the out-syncobjs will see the change. Errors are reported
> +synchronously assuming that the asynchronous part of the job never errors.
> +In low-memory situations the implementation may block, performing the
> +VM_BIND synchronously, because there might not be enough memory
> +immediately available for preparing the asynchronous operation.
> +
> +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
> +the in-syncobjs needs to signal before the first operation starts to
> +execute, and the out-syncobjs signal after the last operation
> +completes. Operations in the operation list can be assumed, where it
> +matters, to complete in order.
> +
> +To aid in supporting user-space queues, the VM_BIND may take a bind context.
> +
> +The purpose of an Asynchronous VM_BIND operation is for user-mode
> +drivers to be able to pipeline interleaved gpu_vm modifications and
> +exec functions. For long-running workloads, such pipelining of a bind
> +operation is not allowed and any in-fences need to be awaited
> +synchronously.
> +
> +Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
> +select memory fences as out-fences since that gives greater flexibility for
> +the kernel mode driver to inject other  operations into the bind /

s/other  operations/other operations/ (extra white space)

Francois

> +unbind operations. Like for example inserting breakpoints into batch
> +buffers. The workload execution can then easily be pipelined behind
> +the bind completion using the memory out-fence as the signal condition
> +for a gpu semaphore embedded by UMD in the workload.
> +
> +Multi-operation VM_BIND IOCTL error handling and interrupts
> +===========================================================
> +
> +The VM_BIND operations of the IOCTL may error due to lack of resources
> +to complete and also due to interrupted waits. In both situations UMD
> +should preferably restart the IOCTL after taking suitable action. If
> +UMD has overcommitted a memory resource, an -ENOSPC error will be
> +returned, and UMD may then unbind resources that are not used at the
> +moment and restart the IOCTL. On -EINTR, UMD should simply restart the
> +IOCTL and on -ENOMEM user-space may either attempt to free known
> +system memory resources or abort the operation. If aborting as a
> +result of a failed operation in a list of operations, some operations
> +may still have completed, and to get back to a known state, user-space
> +should therefore attempt to unbind all virtual memory regions touched
> +by the failing IOCTL.
> +Unbind operations are guaranteed not to cause any errors due to
> +resource constraints.
> +In between a failed VM_BIND IOCTL and a successful restart there may
> +be implementation defined restrictions on the use of the gpu_vm. For a
> +description why, please see `KMD implementation details`_ under [error
> +state saving]_.
> +
> +Sample uAPI implementations
> +===========================
> +Suggested uAPI implementations at the moment of writing can be found for
> +the Nouveau driver `here
> +<https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6>`_.
> +and for the Xe driver `here
> +<https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
> +
> +KMD implementation details
> +==========================
> +
> +Open: When the VM_BIND IOCTL returns an error, some or even parts of
> +an operation may have been completed. If the IOCTL is restarted, in
> +order to know where to restart, the KMD can either put the gpu_vm in
> +an error state and save one instance of the needed restart state
> +internally. In this case, KMD needs to block further modifications of
> +the gpu_vm state that may cause additional failures requiring a
> +restart state save, until the error has been fully resolved. If the
> +uAPI instead defines a pointer to a UMD allocated cookie in the IOCTL
> +struct, it could also choose to store the restart state in that cookie.
> +
> +The restart state may, for example, be the number of successfully
> +completed operations.
> +
> +Easiest for UMD would of course be if KMD did a full unwind on error
> +so that no error state needs to be saved.
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index 2516fe141db6..0f062e1346d2 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
>  possible ways.
>  
>  As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
> -various flavors, error handling and a sample API should be documented here or in
> -a separate document pointed to by this document.
> +various flavors, error handling and sample API suggestions are documented in
> +Documentation/gpu/drm-vm-bind-async.rst
>  
>  Userptr integration and vm_bind
>  -------------------------------
> -- 
> 2.40.1
> 
