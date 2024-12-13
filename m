Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18480E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 18:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C943910E44F;
	Fri, 13 Dec 2024 18:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mz0BE6YX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D6410E44F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734115364; x=1765651364;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rFWmPmRLWsUJ7IKoz7mUis9aA2HuWsIFF2QZzFcqJIE=;
 b=Mz0BE6YXRvuhI8YWDxWsyaWHZUhFea0yX/pZT+ie/huhEw4AYQGXTjzu
 lWT1RGKaeZxJUmFlo7NoboL3WzZIcbcNb86ss25VbmYKh+r5FH3yqzqTX
 Z/mAns3ZA11JtH1HsrPyCRqo48wFy/pmDtMDG6GJFCtQw6kX9PTmurK7k
 +WfqyJNjLZL2cxmeDLDFN3X+a8wEH45rZQTGazlOuM/8GxBNNFDlX8uRf
 ge4wxPU/vIKVXcCqxP8r1rlW1fCeC2xKc3SoYi20OI9lAm/z69AbOAreb
 XA7/oQj5nU8swtQU7zhS4vuc6d94WUgjQisVJDUPE/6zNTK1CG3K4TcSF w==;
X-CSE-ConnectionGUID: gy3KnQH3QHOUJQ963PiRdQ==
X-CSE-MsgGUID: OCJvtuzAQz24gYdClbLjVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45186594"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="45186594"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 10:42:42 -0800
X-CSE-ConnectionGUID: sG4ULaKaTm66TzJOdJXmJw==
X-CSE-MsgGUID: ESNqi5utRjmMFAuUj0X9tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119870989"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 10:42:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 10:42:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 10:42:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 10:42:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXoa7v/DS/oAKm4g7ko+vVJUvGBi+56lY1jSotZ/hNk15GvFMGvB9KF3XAOfJDGjIuMh2QseG3YX+pYp4shinApIcDpd11O4rVfNQjBXaSHdr0J+nW1YnqBweBFWk2tAKBXr5gTZQybfoSu0ZbCPjXv1psmU3uMkSdSKx5jprBavb+EXEtaiUNOS7vMZYM0k6qq9FGKCFWqLruFhL8CyvP8mxkE4Y2n+2hFvyb08R1a6ULCFRdwnEOeOiWmsBIViz1u/eOV92I4MEcg9hZzZ8qyOHLwoUSkbeCG4eDTlef9syFjOBiiZ8vjanyab4O2KyWlzip66NUEB4m7Ey23kig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqIvfTWZIhKcSJO47BURPHuL1N12AzAy6c/F7RHGpAk=;
 b=pWVUjz1hNGWMhD8QkTgEtQLtVH5B9dD8oc4xa2k7pGzDNb5Ztn6e/d6EZljMFUCkFXzBiKExJUZfIjT/6Uy+zvBOdSTqHfXnmZ8j8Eo2dD8G+imFpbmReEEnYgggnbSnpsG/hxOf5uJe8rPqQGlqqF9PUZWmzBOjhcbBFzmpoqdk+ZfCJt71mjO3e8Thog/Mn2T4JrCJyD2tKUNQBmryBfcqNln/YsyPJiuURPXs7SSZ+D8QxtALQw/YxZDrzENZHTMLasdDFGT2yqLjgA1q8DBg0RLbn6KVOTOFhUFThULtGV3Jmd/BcZY3nf4f32lGJMqb4EyJ7T5FWybWhLwBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 18:42:34 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 18:42:34 +0000
Date: Fri, 13 Dec 2024 13:42:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dani Liberman <dliberman@habana.ai>,
 Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [CI 4/4] drm/xe/uapi: Support requesting unique MSI-X for exec
 queue
Message-ID: <Z1yAFtqjJO89T_C_@intel.com>
References: <20241213070353.1511-1-ilia.levi@intel.com>
 <20241213070353.1511-5-ilia.levi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213070353.1511-5-ilia.levi@intel.com>
X-ClientProxiedBy: MW4PR04CA0368.namprd04.prod.outlook.com
 (2603:10b6:303:81::13) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: b6dc5947-354b-4085-52a2-08dd1ba5e83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yCyOQM61/Y5s1Wu23lcrd+iwrDnsmQ7arz3JOHrbQSidDmjG/V0oN3NgkL?=
 =?iso-8859-1?Q?s3Y1zsQZBlLwc24+9mevnaVEwic6klcRKgC30l+8Ia/mU/v4bKKtoySxGz?=
 =?iso-8859-1?Q?qLM20+ByxYOJ2M9iF1wG5zq/b14LJJpcPMG5gA5P2CcvmciRaunA9GEg0g?=
 =?iso-8859-1?Q?dwfK7D0fvbqbQQbDdHm825zke9oARD+RZVHo6hRbZ+SY7KKwTRCPWte5f5?=
 =?iso-8859-1?Q?IwaOWlEABXBGh70Tiw/4K6ARDACutmkYb0FyskiKItRrkfxPjAg/088s4K?=
 =?iso-8859-1?Q?KhUxhUDfvVk5uusQOmsg8WlIuUxAmRCZ5pD7tDaiJ9CYRd6yUyGZb7pojO?=
 =?iso-8859-1?Q?5hVtyDmJTGs48KjbqomuVdX4J0lhggh151dwwJ3YNQ90BGPJMla+re+UJC?=
 =?iso-8859-1?Q?og6p7h/zUyEaM6zvFEByN/DqKhidDXSBUMRI0/W8dezjzgeLhnwQTviI1X?=
 =?iso-8859-1?Q?1wWrbyWYrIgIg4sIsHFqcLoOz1LEVYkYOEKbh1RYmI/zZNhN9IT7MalnvO?=
 =?iso-8859-1?Q?MQTgefPcRzhsTNPq7TfBkq5FPg7zrOEp8dguMDy7BKToAp2SG331ZRwEbl?=
 =?iso-8859-1?Q?WMLinKTcIvK1qwbOH9T6PaUhGqiV0FJRkq4T6ANgt9bIdd4Gj1SkJaUEAW?=
 =?iso-8859-1?Q?D3M5t4mfHJ1zkVfCASAXhRm0VkAF3m/WXOvtuqaPp85FYE5iCrknFTTPzC?=
 =?iso-8859-1?Q?ygi7Qz2hpZ5TX8/GbjiKCNajj0kbwqwbyB51owAUlFEDl+EXAMg/S03EoB?=
 =?iso-8859-1?Q?W0zHXdEhUCz5apjKSbSSm3zcWbzFiCuPyzpScV8nfGDd1160Qvi7VTLbRV?=
 =?iso-8859-1?Q?39a3NiosetPah6aXl5nD2HLppXah2w71z2DqRTTEonmJ2gXmFIU4BAEVQf?=
 =?iso-8859-1?Q?J86SH8pJNMLV4g9aImx9Bq9CstCaBftEJyuS4KK0X1lXxTSmhpDs34Mtcc?=
 =?iso-8859-1?Q?pU2abRh6rcBjR2ilUoUECM95PkRmxnU8NyvllLe7v92z8lCcDPFZ2rXjGV?=
 =?iso-8859-1?Q?J7EAFpkhvKQJdE0eBRppEhwy0gc9fSq0HL+Lt0QPc2PVBU6BjVW+xVHQQ9?=
 =?iso-8859-1?Q?drIUOfZAQtizDBdFZAGt+Eqb7JTfA6X3DsqBjwoa0ozSyXGcgX0Y/dPDp2?=
 =?iso-8859-1?Q?fbLS5PnoZ/5M9hDAebmvb4vI/UMAu4wnImlkHipmxL5nke1T2fWBKbTVnd?=
 =?iso-8859-1?Q?w9ctMuJRl+zuPmmwY5xJtQr3QUeVg84K8hU6CLFAzzkN2znGv1xZ+hMh1v?=
 =?iso-8859-1?Q?HFPO44lItcchN2VUFsIZWBsAttl5yc7F4AGXZukywcPtXphX1w1i/Xw/Xe?=
 =?iso-8859-1?Q?u0Us1T0PkoZWArhHp+591aaSBbZlBCEiXRAxi0+mipbCsJ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hSkzEasYcgyJCyvWw7zgByu017CBh8JXmWu80YQ58G+/Rwi/mPvpI5zesQ?=
 =?iso-8859-1?Q?PvJOsGubC4WCCSKwdXEqcJN42zqlByQQJgWvd6n+Y5esNsNEH1L2pIOyf9?=
 =?iso-8859-1?Q?IpJYCfe9lEDWvvXvEt+ioA1JDyPPQ/ap+wTbO7/Ki1FlJW5A3+t1DWSPXY?=
 =?iso-8859-1?Q?FDH2ABOpJ4hSSlweCsN34X9qtQDnF9v5zjPOeTaYbnjLHqd6C40ReAdx5u?=
 =?iso-8859-1?Q?qXhGeshSZmYTPxnga86nMBNoL3ZQyjqF2Qq/vhekOdVwVU6Li8nM8LhL1O?=
 =?iso-8859-1?Q?z0/MLT689A2SU4U/GfQB6wCEaBT2tUymnTNsQRSYn4+6Bx2PWv50NUJeOd?=
 =?iso-8859-1?Q?wPkHaToNhiSfWkQIsEKmNnVQbwQwYRRs4tYoRLG1/sBlrbg2miUvcT2hn5?=
 =?iso-8859-1?Q?/PkWCIzCvOKASPIcpTFQcQWASifU85G0k/eiHqo1Wz8FoQQ2/18Skg7Vqr?=
 =?iso-8859-1?Q?6x3XXPNLJUzRPkXfBnZXsTcippe1DumCidwrF5WfQ9ikxbz9WpDYTG5L57?=
 =?iso-8859-1?Q?VftcbCflg9pKnLwaTFu9F3ctDxDHCA+rvYrAiz63UAIuUwp9BOAV3dYmRW?=
 =?iso-8859-1?Q?5y7H/mCwgT6DUeBLWI5C2rbHH3ewtcXdz9kzdK+83MwabBbMGIsiQvZI/G?=
 =?iso-8859-1?Q?dsVaQ28KskzAQxNUpVclXpUdN4j2ATnp771EHxK6UMCwImzs649hUpp4m6?=
 =?iso-8859-1?Q?CE2wyAx5gGHen5iXIbXO5bniRs5u+5X6GrFCt3ctp/h2JkNB99faJWwQ7W?=
 =?iso-8859-1?Q?PX5URbrmI4fKRg9mSN9ArVmV+tnm+iD57OE9J2SGkOUkN/1hMq2yF6YrFx?=
 =?iso-8859-1?Q?LNyTv9m7mLBahi3CSQFj14+77Xo0T8CC8GYj5/7cs4DleqLYFoqhRzh/7V?=
 =?iso-8859-1?Q?FRwz113IX4BuPFIGhEDhxykUXMB51p7kJoAPt2yNts0ZllILuQ7OaWH7da?=
 =?iso-8859-1?Q?ArRBvelBkEXYwkSEEHJGvnSjkjX5aKz1ThotYzDQWI7IYuKMO5FWoDQk48?=
 =?iso-8859-1?Q?hUlHF028Jnj2ejyRZG7gfYC4uzl6KIs6Kl8NVsrdABYVoPu6lag4t4wUtP?=
 =?iso-8859-1?Q?z/t/umXsx9n0OboUBpWNFgDFoz5By+DugROxQvVABQ+agjXBaACoM26fxn?=
 =?iso-8859-1?Q?Qb/sw7QNKtYdclW6Av/R6UGOK+RoYyNsK4eMgDUQEsv+zCsjTW6mUuVSth?=
 =?iso-8859-1?Q?N5VlPSmLorBD9CUQxSAAGeopcFwEL9h8UWx0nLHC0JrG7N8koj+FKo/R9q?=
 =?iso-8859-1?Q?yajWikn4M24XZGtotpX6273qB/G9HsnfwdxR1S0HGyvZEMoNU+TV8vkK8p?=
 =?iso-8859-1?Q?amr6rRBlFv83ppXO0s4eKxvG5Z7i09AmefTec+eT7Lg9mrUV20gSIiLTnt?=
 =?iso-8859-1?Q?izn0td7FogUROO6bFNYvdBdDQcwIT74ITIQhAuLh3MX8o+ZlhFfm34yC9v?=
 =?iso-8859-1?Q?s7t2SZgE+7HAjqMBG1ExDg6KLhpbzKp7rVcBKuQEXoPdQK4I4TI46NHrkX?=
 =?iso-8859-1?Q?I93wTiePSm+xFyQxBBeyM7EuZjNR3KyDIYv56TipGq5aMyNMIcqDaM3raJ?=
 =?iso-8859-1?Q?JPMcah+Tv0wTjUCbRTrqNUD2a1IZuxFMhELAkWOmpPDxIh+u5ErUHmzDac?=
 =?iso-8859-1?Q?SQ7F6/sVn8o884895CO4U6+fYbPU8tZTAqi53QWxHk9a5Q5WrOIBAnlw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dc5947-354b-4085-52a2-08dd1ba5e83c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 18:42:34.1744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCgFSqDfskfDgsek/wJkPmqoYyn+SyKmG6ru0m1fxnHO019kC1/bb5cCtf4QjKbtxY9yT/oz7qAPZnxRB6YPwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2024 at 09:03:53AM +0200, Ilia Levi wrote:
> From: Dani Liberman <dliberman@habana.ai>
> 
> Unique MSI-X per exec queue will improve the performance of the
> IRQ handler. In case no MSI-X is available, the uAPI will return
> -EBUSY error and the user would be able to execute the uAPI again
> without the flag (fallback to default MSI-X).

Patches 1, 2 and 3 pushed to drm-xe-next. This patch here is on
hold while we don't have the open source userspace for that ready

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

Thanks,
Rodrigo.

> 
> Co-developed-by: Ilia Levi <ilia.levi@intel.com>
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Signed-off-by: Dani Liberman <dliberman@habana.ai>
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 57 +++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>  drivers/gpu/drm/xe/xe_irq.c              | 18 ++++++++
>  drivers/gpu/drm/xe/xe_irq.h              |  1 +
>  include/uapi/drm/xe_drm.h                |  8 +++-
>  5 files changed, 80 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 9c94be571900..35ef75f9919f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -12,6 +12,7 @@
>  #include <uapi/drm/xe_drm.h>
>  
>  #include "xe_device.h"
> +#include "xe_drv.h"
>  #include "xe_gt.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
> @@ -35,8 +36,46 @@ enum xe_exec_queue_sched_prop {
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>  				      u64 extensions, int ext_number);
>  
> +static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q, bool unique_msix)
> +{
> +	u16 msix;
> +	int err;
> +
> +	if (!xe_device_has_msix(xe))
> +		return 0;
> +
> +	if (!unique_msix) {
> +		q->msix_vec = XE_IRQ_DEFAULT_MSIX;
> +		return 0;
> +	}
> +
> +	err = xe_irq_msix_request_irq(xe, xe_irq_msix_hwe_handler, q,
> +				      DRIVER_NAME "-exec-queue", true, &msix);
> +	if (err < 0) {
> +		drm_dbg(&xe->drm, "Can't allocate unique MSI-X to exec queue (%d)\n", err);
> +		return err;
> +	}
> +
> +	q->msix_vec = msix;
> +
> +	return 0;
> +}
> +
> +static void xe_exec_queue_msix_fini(struct xe_exec_queue *q)
> +{
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +
> +	if (!xe_device_has_msix(xe))
> +		return;
> +
> +	if (q->msix_vec && q->msix_vec != XE_IRQ_DEFAULT_MSIX)
> +		xe_irq_msix_free_irq(xe, q->msix_vec);
> +}
> +
>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  {
> +	xe_exec_queue_msix_fini(q);
> +
>  	if (q->vm)
>  		xe_vm_put(q->vm);
>  
> @@ -69,7 +108,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->gt = gt;
>  	q->class = hwe->class;
>  	q->width = width;
> -	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
> +	err = xe_exec_queue_msix_init(xe, q, flags & EXEC_QUEUE_FLAG_UNIQUE_MSIX);
> +	if (err) {
> +		kfree(q);
> +		return ERR_PTR(err);
> +	}
> +
>  	q->logical_mask = logical_mask;
>  	q->fence_irq = &gt->fence_irq[hwe->class];
>  	q->ring_ops = gt->ring_ops[hwe->class];
> @@ -547,13 +591,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	struct xe_gt *gt;
>  	struct xe_tile *tile;
>  	struct xe_exec_queue *q = NULL;
> +	u32 flags = 0;
>  	u32 logical_mask;
>  	u32 id;
>  	u32 len;
>  	int err;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags) ||
> -	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	len = args->width * args->num_placements;
> @@ -569,6 +613,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
>  		return -EINVAL;
>  
> +	if (args->flags & DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT)
> +		flags |= EXEC_QUEUE_FLAG_UNIQUE_MSIX;
> +
>  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		if (XE_IOCTL_DBG(xe, args->width != 1) ||
>  		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> @@ -577,8 +624,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  
>  		for_each_tile(tile, xe, id) {
>  			struct xe_exec_queue *new;
> -			u32 flags = EXEC_QUEUE_FLAG_VM;
>  
> +			flags |= EXEC_QUEUE_FLAG_VM;
>  			if (id)
>  				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>  
> @@ -625,7 +672,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
> -					 args->width, hwe, 0,
> +					 args->width, hwe, flags,
>  					 args->extensions);
>  		up_read(&vm->lock);
>  		xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index eec8f9935a58..6e419b572000 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -85,6 +85,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>  /* kernel exec_queue only, set priority to highest level */
>  #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> +/* queue with unique msix interrupt */
> +#define EXEC_QUEUE_FLAG_UNIQUE_MSIX		BIT(5)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 32f5a67a917b..52829771c89b 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -14,6 +14,7 @@
>  #include "regs/xe_irq_regs.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
> +#include "xe_exec_queue_types.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> @@ -880,6 +881,23 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> +/*
> + * In MSI-X mode command streamers raise an interrupt only as a result of
> + * MI_USER_INTERRUPT and MI_FLUSH_DW_NOTIFY commands.
> + */
> +irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg)
> +{
> +	struct xe_exec_queue *q = arg;
> +	struct xe_tile *tile = gt_to_tile(q->hwe->gt);
> +
> +	if (!atomic_read(&tile->xe->irq.enabled))
> +		return IRQ_NONE;
> +
> +	xe_memirq_hwe_handler(&tile->memirq, q->hwe);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int xe_irq_msix_alloc_vector(struct xe_device *xe, void *irq_buf,
>  				    bool dynamic_msix, u16 *msix)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> index a28bd577ba52..47058e2d9d36 100644
> --- a/drivers/gpu/drm/xe/xe_irq.h
> +++ b/drivers/gpu/drm/xe/xe_irq.h
> @@ -19,6 +19,7 @@ int xe_irq_install(struct xe_device *xe);
>  void xe_irq_suspend(struct xe_device *xe);
>  void xe_irq_resume(struct xe_device *xe);
>  void xe_irq_enable_hwe(struct xe_gt *gt);
> +irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg);
>  int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
>  			    const char *name, bool dynamic_msix, u16 *msix);
>  void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0383b52cbd86..d5e824355a5b 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1123,7 +1123,13 @@ struct drm_xe_exec_queue_create {
>  	/** @vm_id: VM to use for this exec queue */
>  	__u32 vm_id;
>  
> -	/** @flags: MBZ */
> +	/*
> +	 * When creating exec queue in MSIX platforms, the user can request a unique MSIX interrupt
> +	 * for the irq handler. If there is no available MSIX, -EBUSY will be returned.
> +	 */
> +#define	DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT (0x1 << 0)
> +
> +	/** @flags: create queue flags */
>  	__u32 flags;
>  
>  	/** @exec_queue_id: Returned exec queue ID */
> -- 
> 2.43.2
> 
