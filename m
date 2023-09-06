Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273D3EE14BB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 17:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA2010E5F3;
	Wed,  6 Sep 2023 17:19:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDCB10E5F3
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694020748; x=1725556748;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fvj7l+GU5lPZ0q/czuSzdpFKr8Yw/ZlpO0XhBt1Sa9w=;
 b=Jgk95EHzx7VK8cl600bzXVjgFkR45LA63fn+6yeEw8BUYQATiUGyz1bo
 I6vDiH9/W4NrSoZVhdh+bb8KqyrCf2KasRoxWc7G+uTaEDlRUCyi2P5LQ
 T8+/roXfvGI890PHg/1Y+e5smNPzrphfrXBVFhnF5xs4bi7F6Kucn6pXp
 ejqrE3x3caJwJYQ7RDtSfw5Me7TNTyt4brYeRA/lePzofinB1pv0nb1Ox
 su5h1+zL8RtYQHggjoPvOkOTpjxzzHevgUv6Oib+FEkwBE+4D2ZOAJvsb
 CITKXdz/jcypeOv5j802TJDsmvLJX+iLr4GhJKzqUIJkYCbXI6PxH5DfM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357439766"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="357439766"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 10:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="744755757"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="744755757"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 10:19:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 10:19:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 10:19:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 10:19:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFNaEk94SikqDTlNk91CJ3KwLZEKEDtbWAgvwJYe0pz7UzwsqtSsPdmfF8qDAH42cEHGqELSEacnUGCs4F/RpXFWervqsAurSN/G0gMZsy691+NBHpC0eFz/oN43KXDsCfAZpzx3vekgtJRkUw6Guuluwe1B6BrxAIfWdCSKMzCB9B+eNZMH3hBbXw58vtGySEcwzw8h6KRlOcaGsAtYrxyr/SCBlardnMyuGoutenpAdteyicUgH+MmwYjAgyk6yIgKL33u+6wwupBzhi82L6vipESIbC6XCjbKlt3OoJP9c7KuiOgU7BNN5XBzO5QY7dTOHLjcZxheMIqnVk/prA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAJBLjdvrLyRX3L5v87DlqRLkKN8h8ExD8z1WoX6URk=;
 b=T5AmopNTO2Sb2TGgIl5RG4JzFsrSrBZZykz6eEhwKyYJUwiJ5JK7K6xCzxKZ5lVR4qJOWn3IobZfw+UmGv1ciEMgfeZmZlHKZih9ZjFW4DASqyVKNRmM82wagljMJ8kfPF7yF7k0+TicFpDiWybUil4J7Arqz2hb38DBgY6L0SAe/BFZqVOdWebE5Sm9DnmvvDj/pUOz3OvuEnFhlTgbK8CGcJADcY9ZX0BDtUgQ9LD0Eu2RTLYTD+W0tURahJq0C6aAZIYcPnaORbnlGb2D4zmXhWXbTXM5WAORyE4bsYmGXZHEMrFUavJNbM16ZLBerN25voYwMcti/XJwMHjSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6244.namprd11.prod.outlook.com (2603:10b6:208:3e6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 17:19:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 17:19:03 +0000
Date: Wed, 6 Sep 2023 13:18:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <ZPi0gnYZlMk6mD2d@intel.com>
References: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
 <20230904144644.3259148-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230904144644.3259148-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: 2243affe-3640-4816-089d-08dbaefd5dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m8hirRCk93IZnZcM0idtND9O7cN5ovrTTFPwM77bg+1ETG8qBjSGDzZmiNBxbtM3l//Uq39QyLnYkP6XNjMUeA+MWtNns19zy6IngU8ZN6zVaU9pXx8tFC9nCYPuabyPeHN0tVSyB2jzmKSoY94bKGTAOAgdkbKrw38lx+1xG9i0tCcS8rGC3BaysAzlk5Q3wn3PD4lHkmP1cjh7dNP3BlC+3b4TaYw8yHE2qdCzc0uG9psgVecicMe8RaA0fyopN5uFb4AGV1hMqzI8EpXHUDDjt4ma3bANnj0387qiOYlmiY9QkRIdzwH/jQqc6nFItP06n2MoVvY3k3igtD3j9LJByUgNuHXb65hbXhQTrBKrryPMYYZ5we62oIizNCKYkFMiIWjdwLVRVTmjNrmb6boE4OT1iCmFU40BaW0nq9k/a7zndlFwVNUupSsbHDjLDik9bfN7DcAg27FTLIcL7NdIUMmFg6IHhs8/YcS4N/ThrXe18C1D0spBOU8K1qnoRAeozJE8EUeS459H6l07s012ZUnAzksxt1HLIcMdWOqCD59Vzn2cFZ4278AkFMny
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(1800799009)(186009)(451199024)(2906002)(38100700002)(82960400001)(36756003)(86362001)(6486002)(6506007)(41300700001)(6512007)(66476007)(316002)(66556008)(66946007)(2616005)(6916009)(4326008)(8676002)(8936002)(54906003)(478600001)(6666004)(44832011)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uGUqon69zf141EwPeQjWhRDRf9NqKJkLKsCEfw3GUzDmHaSIj6EymbeA6HbF?=
 =?us-ascii?Q?mBfcnkwbzA7jWvqFP4Q5EOcWc61TTtF+M+WKpo3qti37JZ4L6E2EeLQaX+jE?=
 =?us-ascii?Q?UUZXmDvKWumxS97ynAMi9NBoO/o3Zf+/i50rPwee9UEc201flaAKC1HfQOCa?=
 =?us-ascii?Q?2wyuV5jAhO6UDVHZpjpIte8cG2s1UPxfh0gCLqUkq4zpHum71tj7H6lz1wIh?=
 =?us-ascii?Q?NVWgMzxDHoG6qzuZM7QC39/Nwx6dTaB+r+YCIhUa+fGyMzIjjoHafORo789B?=
 =?us-ascii?Q?coZ+nBRr74WbusvHxiqGc6HIDWbzZrtGLXZNcCP917HXPTxz2mAsGJV9kjH3?=
 =?us-ascii?Q?qrZRatU59IkRAC8TPrbyzoKVGZuTJFRmkNmgGHV4YtT7/VdAn3lIxBHESFut?=
 =?us-ascii?Q?1L94iC5uBJy2ard3nlNd+jPTt40HGjTxx5sUlhL+W03cJmoAV2tRVjXwZxvO?=
 =?us-ascii?Q?OYGZWLHxjau3DG76KYJ5DTowd3guUf6XHVA7YQ63EnZmVh9LwaKSDkLM7JUt?=
 =?us-ascii?Q?YGmTS4kIy2dR9oA/ZCaAfOY4ok6nSMGoOgGR7Ul+V9+55KPo/y8dz9Z+WO9S?=
 =?us-ascii?Q?s7HFFCf2Nx0jFxZ5dmziGgnxMubseaHJ3EPrwx4EjqGi4HH8Jv0IYwvzVv0P?=
 =?us-ascii?Q?6desOs/XcBGY0rbmm8yxVhxgmRvY7eXAVJu4A85LTO3kGfgfK9LFEceO3bXO?=
 =?us-ascii?Q?XnvRIbIe68SN2jBQMh1Wbyi2+L5w6WaoeAJZCtJ7f/0b5mUgWUhlMz/+RGtA?=
 =?us-ascii?Q?WuZWh6wkRqDAu7tE63BEJjMgTS6lXRS2KBEU6zDPLkTfY8C26GW7TzlqbepZ?=
 =?us-ascii?Q?U7nS4ZT5lP6b2nAWibCjrAw4ufxG3pV4ZtQFdXRpNKeSD6KmyFy9+ahDiZXf?=
 =?us-ascii?Q?VP/OWkQ5XrGnjop8W3uz2tRN4eLo8PSpYkG4ndxr4+cA+MrSKrzlDkdnKBbV?=
 =?us-ascii?Q?poGlOBGmmLYiLZ8t9CJuelgvN/rKSVKEqrwgR/NsoNYk4Z8szQBgmbKvUzsf?=
 =?us-ascii?Q?IzJQcl8t16aGZ9xW+BBZmep7W7q6X1SmUzHRHh8Y2bVctT6ZeAdm71NQ9BOb?=
 =?us-ascii?Q?HLp2a2tRIky5/EdiSEe6ietCgoth2FrzBy3ncfmYBtGCwGnGxjZWjNZU9LUH?=
 =?us-ascii?Q?rVXrLoFlRDWwxF3vzoxGn3r3BOpnFGhdSMBkaZmPX3eMULCxZb/gcPS7nIE4?=
 =?us-ascii?Q?T0XdznkOxdMV28OdjPHPY3lCSh3rYmQHZSpgdmwfj3iGxZQGDLGGZajNAQIc?=
 =?us-ascii?Q?QxiEPY3TnPTtWnzvq3rdM4EesnutStCGAZ1PIeRS8N/ZeaomCIK8ZZpb2nmn?=
 =?us-ascii?Q?J2aV8E57fphX0N1e8xAOs4Udy/wzoqFxCR+/nzD4q/kuCArRbbVdj3hl1tgE?=
 =?us-ascii?Q?8eO2tYYP1AZ3KOBjwUK92VcK15V15Dh/52E0+JAHotQrsnuK0BQ19iOkW8qq?=
 =?us-ascii?Q?N7Ljk7HGILfKJi6baN6FZN7D1Zev0UBcE5cx+i4kwu/iQzEDD8LYeXil3ODR?=
 =?us-ascii?Q?7hJt/0gYboDE32z8OsnRuC9XhtCbHY2Uy4ui49vdwIcrOX2+4Y6uXXaRTBB3?=
 =?us-ascii?Q?x7fDPEdtFxSlW7Eio500/WSq37Wh15F/m3xqfwqx8qCOuPJnCfU88zCTpTIf?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2243affe-3640-4816-089d-08dbaefd5dda
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 17:19:03.0293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9sqcGS/8E2XGvhfvU3mZCN3QNdrPER7leQXBNJ6Sd+D5bbu0PKm+cVhaI/m/4OK5CJeEUsZvksqyqocfpMcMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6244
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 05:46:44PM +0300, Mika Kuoppala wrote:
> The bind api is extensible but for a single bind op, there
> is not a mechanism to extend. Add extensions field to
> struct drm_xe_vm_bind_op.

But why would you want to extend the operation?
Except for the destroy ones, every ioctl itself is extensible.

So, DRM_IOCTL_XE_VM_BIND is extensible. Why would we need to get
prepared to extend the operations themselves? And if we extend
the operation, what to do with the extension at the ioctl level?
which one has precedence? how to organize that?

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9cc..5c6c86f5e5fc 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -552,6 +552,9 @@ struct drm_xe_vm_destroy {
>  };
>  
>  struct drm_xe_vm_bind_op {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
>  	/**
>  	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
>  	 */
> -- 
> 2.34.1
> 
