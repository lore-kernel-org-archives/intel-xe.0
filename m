Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D1CC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 01:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1D610E6A5;
	Thu, 30 Nov 2023 01:28:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA1F10E6A0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 01:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701307724; x=1732843724;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iF2M++o7J48d3Y7HVQqeYDOugphcSe/ijAWcXms8EaQ=;
 b=EMlhLYfAvtKxNVrWACpxS9em+pGED8xkW8zy0BpEXWjv2DBc+lMqe+MD
 eXMOoLr/nTaR6oETFeaAyDpR9phhuKD/UMMFQYCTSAMUDCFjQkC53ostr
 wMsZKqwyr8xTwR8FqGrYZ5jCD3gUo6dz0SBESLaPpMnFVPWm1fsDOthwt
 Kb33VvCdnAJpYWottpCCo6Bm3pEwiaoNAv8CnD2kW7dCRgR5jXb644KGv
 K++jvzddpUZpE5dH/eOHdSYmVOngIyKHnoCfFwHLCGbB9CD4V0aZikWTb
 8vyqTGokVxn2I6B3+w9iVoWUwTStlGUmCHJjLWAsv2VQ3XFJwNLvCoZed Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="6466081"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="6466081"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 17:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="10581641"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 17:28:43 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:28:42 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:28:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 17:28:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 17:28:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SopjmQoax+9eNfVkIbC9R5+wlAc3djDIi1s0Cc/JUXmgIMOgiwSy9xAkJ0LA8dzhacnIB+uDGljFo9dJyWmqce2vOfU/Up4WkWwMs5FDpAzyEtY00G6qUlsy1prPCUcD6cI1Fh1hCoAPPtYWEv0OtC50oUn2c1IIT766lX3Hh+D8CHo9798tDJyqYzRNMh85RmV5KBfHFW/JqFn+F0J+HLIh2adIq2iBCh92VZCgpLWbd28MnfMSTrAde4pQfEZXzYD+nOjlqPKKVFYUsyQS7vit20ummx5w857vMQA+ngmg6p0ciV1+DvJgtvLsHJjH3csKP7wYarJtvTNo77flIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzPP+iM2tV5ZsG3TFgcfY7dY+xRM7DOQ9+/UZQ5B9/8=;
 b=b7Mt4uN9Hn5q5H5RjVYyfbP73dLJhaO/ixCLR2EZp72bJplakgtkTTP76jOrILzqTDQKHMjwjk8RwcpYAVHDGZgqZPeICTJCTQ+cs8uGGRViUzsBZIG+vgWlCL71uJM7gHihGNXxPQp7y4a2lonVm5V80rKjhukkIuezr1JqBUGq1ftTbcGnOtUsxoND3ICftsQLj6gDJ66oxhfV94Nk6/oiuwPqH5t+EqgTorfPVT0gURxN8Gs9LwNAM8ycPxrOYgsolmUzx5VxpHj70WzmXMS4grYwdek3dIr91jJaZaUlzGXXdjGp2wuUKhS2OPhIoqkba+JaeRy7hzgFTpgIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8299.namprd11.prod.outlook.com (2603:10b6:a03:53f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 01:28:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 01:28:38 +0000
Date: Wed, 29 Nov 2023 18:27:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZWeCdUjwHf7WpGHU@DUT025-TGLU.fm.intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
 <20231129223508.1189461-15-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129223508.1189461-15-michal.winiarski@intel.com>
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 267a7eef-363b-4e5a-21fa-08dbf143adea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UwjhceiQskydHB8K9/7XU7KJKv7TSeIrYLR7SK9OkZ1p4yfJGMVMn4RPkW8BSEh44K3KsIC+SbxBmEwqZiMt2zf/OXWErLgeWz/FTzg437YLgEsAx/F2x0Z3zsCSeHTeS5Fyql/DxZmhbiJR7w3b74AKX00EJOAQ5E73WRCv5Alpwvy6QkdhiDy52ognVQZyNGxR7WEIhzrTu17KLYtY5WTxN6wDOS+9+fVmVtanDJLeRsqXmC6T6eYpXy9vrjiN5nYf10Ngp5Cqb3FC9xewSeRSmSYDqI8RzADrPe1gAHRGUaeVQa280iLuRB1R8otmB4l0Is9GM9hRXKhrDdOY2cRTFWoKTMoBqAhm/sFLBPWc/7Ue1Cqh4vUqxj1HYKrh3D9h/lsSa6nya06x/iYKpDU8ou3ydMRky248QGeIeiDk1O31l+MRS6mE5z+xhfXQUxY3pQoqnlX6Kf1XW8+Km4UFcAbuNvYuOiGyarmkx1OEaJjwpogHgeCBId4A7L+xZFkpZjOyfNHEAkQOjVsQost5yuctB+YmGpyMiYUR0eucRJ9I2qxIy6TZNXenjiJBUFWxS+fETjJ0OlD3vierpu4RqMq55QPyAwee2WKiMJVGdptI3EQRaT2BA42DiK8uoU0jpvV27hPdPERqr6xEcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(202311291699003)(478600001)(6486002)(6666004)(26005)(6506007)(6512007)(82960400001)(38100700002)(86362001)(5660300002)(54906003)(66946007)(66556008)(41300700001)(6636002)(66476007)(44832011)(2906002)(30864003)(83380400001)(6862004)(4326008)(8936002)(8676002)(316002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHAzd3JEMDZ6TEt0NG11WkZqNUx1Zk1hdWZweDBjb255d1VYbjB2R0VKZzEv?=
 =?utf-8?B?anlGalVzOS84T2xvT1UrWDVuTEtLL0Fyb21ySEhsNlEvZ1BSZnk5aXdjQVZS?=
 =?utf-8?B?VDh6bmZNZTJYVGk0LzJjbTBjZ0JoQUJ0YzBSTWlSYm8vTmRGOG44Z3BwbGdU?=
 =?utf-8?B?RURybVo4cmFrc0lJM1dNeDBsRVJkWGFzVTduVjBlR2J5d2x0a09pZVBHQ3JL?=
 =?utf-8?B?Y2c0cTRvU21BazcxRndqS0tBSW5lLzVSMjkxVXRwS1BXVDIyWEtyQ0ZlQmhV?=
 =?utf-8?B?MEgxZ29GUE92NUY5Z2NkTWF6U3o4NENoRzBZVGh2Qk13QzI5eURWeFB4a0ZN?=
 =?utf-8?B?dnN0RFlNRWgxekt3Y3N4YUZaS1pKUXVqcDlVazI5VGE2M3EyVVVrSDVYcGZD?=
 =?utf-8?B?eUk4aGxtZ2EzTjNpbmZoRnB2OU83L2NiUmJ6UUs2L3cyQmROc0hZaGVCQ0JL?=
 =?utf-8?B?MzMyNVZWT0tJRXluQ2RaajJnNWNaUkwzUHpWYmxtbXBTdXdmMzhiUFlCVCtX?=
 =?utf-8?B?NUpoRWlIWkxpczlwcDdIYzliTGRKNVVVZXd6VnE2SEtydzZ2MzRQclBlSUY0?=
 =?utf-8?B?NllEQ1VoYm5OWTJZUzBOcWdnNGV2dDgrV09SQndOWm0yTGUvVTlkaWo2ZXRE?=
 =?utf-8?B?WmNxY2crSzhIS0lmem9HK2dpQ2NzNDB0UTVXRld0UVhGeC9XNTkyNlZoZ2g1?=
 =?utf-8?B?Sm1GemZwS0gwZk5YQlJ1Z0wyam82eFpJS05IV0tmaW9NMXNsR3JzUGNrQXlu?=
 =?utf-8?B?R3RHY3E5MjN1czFZWFN3cTF6eHVYbXl3S210RWpUbEIrQnR4N0VGTGl0QTdq?=
 =?utf-8?B?YWpJdlRsTCtoY1k1NmJrK2c5UUlvWkJHdi9IcU04YjFlZnBGZHRQcXB5MGhE?=
 =?utf-8?B?Z1ZkQUNWaG0vQzhUOXhsM0hLVU1VanhWbmpOVUxBUmZBZ1czZk41UUpKYTA0?=
 =?utf-8?B?YUxRTHZRQ2wxZGR6R3F3N0h4THRyQ3UvVDhIaDRYZEd0TnJLWUNvRExZdVBH?=
 =?utf-8?B?bFF3TS9INEs3Nk9oM2JiZWxXNGoxS2IvTGI5WmprNnp2YS8rSE1aYUNWNGVx?=
 =?utf-8?B?Mm00WER1M1JSU0RYVDZ5ckdoRW92VzRudXlpLzJxSDI5WVlGanpBcVVvUUkx?=
 =?utf-8?B?eTVRcVAvZVRvV0RaZWh2ZEJHZFl5bjlpOWE0azNOWlZ4RWVMUTd2bTZJU1Rz?=
 =?utf-8?B?S0RWNWlyYkVkWXpFazUrSEd0Y3NQakJ6bEx3d3RRVzJ6VlU1a1JtRjdhckF2?=
 =?utf-8?B?bkphUlVBeHdpSUE0YUNXSDNvd05UUElXUW1JMWF1TzZPanVHYmYzS0Y4bmpJ?=
 =?utf-8?B?RUxUcEZiejBWQk1wZ28yVGVaazEzbHhoOXd3bXR6K296ME0zaEVQS296dTlV?=
 =?utf-8?B?V2I2WHpKUzR5VlZDTVR6TzhMQmNwazl6RExYUkxkWGg4Q1ZuNVdvK3RNV0Fw?=
 =?utf-8?B?RHF4bk0vbTZzZXJ6UHRhSk9SdS9EeVJsbjkrSmN5VVllSHBBYVZyYW9jckNv?=
 =?utf-8?B?Y2R2aCtwM3NFdlJKME5wSVllK0dBeXd6Z2FYUzJLaDNCeTBCKzh6KzdGR2Jj?=
 =?utf-8?B?UjlOMmVKNy9GdUJ3Q01UY2l5YVVUQ2hRdENGRmlLTlVKQ0NUaXRYRzVKU2RZ?=
 =?utf-8?B?akNkUmNEZFpsZjdPajJQYmNTOWtUMDNBcExYbUpUb1N1VEFjNVQwL1JnMlZ0?=
 =?utf-8?B?L3JlMG1hbk9LQk5VOWdvQWZaYzl4anFidWhKQWYxUThMSzdraDNHakpMZzht?=
 =?utf-8?B?K2EvbjdIV2oyNVExVW5ucXdwcEJycjIrelR1TTByK0krdThYcXRaVlVlYkVj?=
 =?utf-8?B?UWc1ZEJtaDkxYWUxNXgwM1RJYkFsKzBDbWRPSGYwcTNyZi8xOHJJM0JoU3JC?=
 =?utf-8?B?ZzZNQVB1ZUl1OFdqMEVHdkpFU3d6N1ZBSU8rdUhlbnJzOWZRZmxqK0pFdGJB?=
 =?utf-8?B?MGEwUWIzdk5tYXlUckpFRy9UYjRDU2R3MlFjREt4dDBYd1Zub2xrQy94MXJ5?=
 =?utf-8?B?WEpWNXpwNkRsbEVwTTBxSmt6NWNCRnRTZzEvUEkvYm1oOXhaNlNzS3MrWndZ?=
 =?utf-8?B?NXp6a3F3UXFpSVR3eHl5aG5MNjdSR2dYWVBRVXdjeC9tbEM2dHV2RkdxSVJV?=
 =?utf-8?B?MjNYNGQ5K0hKc2IrblpvOGt5RmdJYXdqSkVQcGkyZ3gzT1VRbUkwdFM0aWdE?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 267a7eef-363b-4e5a-21fa-08dbf143adea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 01:28:38.7178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBLIIiYmpd3tT8LdsknFIwXvFI9mn4FOQ/Az9bBCNv3Xeuhj2qSJRR5wxljQxRPmFdfjbjDcmShzB3CT6KNnXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8299
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 14/23] drm/xe: Add a helper for DRM
 device-lifetime BO create
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 11:34:59PM +0100, Michał Winiarski wrote:
> A helper for managed BO allocations makes it possible to remove specific
> "fini" actions and will simplify the following patches adding ability to
> execute a release action for specific BO directly.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
> v4 -> v5:
> - Check for error in managed create from data (Michał Wajdeczko)
> 
>  drivers/gpu/drm/xe/xe_bo.c           | 36 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h           |  4 ++++
>  drivers/gpu/drm/xe/xe_ggtt.c         |  6 +----
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 20 +++-------------
>  drivers/gpu/drm/xe/xe_guc_ct.c       |  8 +++----
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c | 18 +++-----------
>  drivers/gpu/drm/xe/xe_guc_log.c      | 19 +++------------
>  drivers/gpu/drm/xe/xe_guc_pc.c       |  9 +++----
>  drivers/gpu/drm/xe/xe_hw_engine.c    |  8 +++----
>  drivers/gpu/drm/xe/xe_uc_fw.c        |  9 ++++---
>  10 files changed, 63 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d59501ffc22ae..1a7fe62de8122 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -9,6 +9,7 @@
>  
>  #include <drm/drm_drv.h>
>  #include <drm/drm_gem_ttm_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_tt.h>
> @@ -1530,6 +1531,41 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  	return bo;
>  }
>  
> +static void __xe_bo_release(struct drm_device *drm, void *arg)

Nit:
s/__xe_bo_release/__xe_bo_unpin_map_no_vm/

Either way:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +{
> +	xe_bo_unpin_map_no_vm(arg);
> +}
> +
> +struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> +					   size_t size, u32 flags)
> +{
> +	struct xe_bo *bo;
> +	int ret;
> +
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
> +	if (IS_ERR(bo))
> +		return bo;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, __xe_bo_release, bo);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return bo;
> +}
> +
> +struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> +					     const void *data, size_t size, u32 flags)
> +{
> +	struct xe_bo *bo = xe_managed_bo_create_pin_map(xe, tile, size, flags);
> +
> +	if (IS_ERR(bo))
> +		return bo;
> +
> +	xe_map_memcpy_to(xe, &bo->vmap, 0, data, size);
> +
> +	return bo;
> +}
> +
>  /*
>   * XXX: This is in the VM bind data path, likely should calculate this once and
>   * store, with a recalculation if the BO is moved.
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 77e723dd9102c..098ccab7fa1e8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -115,6 +115,10 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
>  struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  				     const void *data, size_t size,
>  				     enum ttm_bo_type type, u32 flags);
> +struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> +					   size_t size, u32 flags);
> +struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> +					     const void *data, size_t size, u32 flags);
>  
>  int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>  			      u32 bo_flags);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index fab3cc04882da..8dc783e9120d2 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -108,7 +108,6 @@ static void ggtt_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
>  
> -	xe_bo_unpin_map_no_vm(ggtt->scratch);
>  	ggtt->scratch = NULL;
>  }
>  
> @@ -225,10 +224,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>  	else
>  		flags |= XE_BO_CREATE_VRAM_IF_DGFX(ggtt->tile);
>  
> -	ggtt->scratch = xe_bo_create_pin_map(xe, ggtt->tile, NULL, XE_PAGE_SIZE,
> -					     ttm_bo_type_kernel,
> -					     flags);
> -
> +	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
>  	if (IS_ERR(ggtt->scratch)) {
>  		err = PTR_ERR(ggtt->scratch);
>  		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 88789826e7817..2f5ff090aa6bd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -202,13 +202,6 @@ static size_t guc_ads_size(struct xe_guc_ads *ads)
>  		guc_ads_private_data_size(ads);
>  }
>  
> -static void guc_ads_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_guc_ads *ads = arg;
> -
> -	xe_bo_unpin_map_no_vm(ads->bo);
> -}
> -
>  static bool needs_wa_1607983814(struct xe_device *xe)
>  {
>  	return GRAPHICS_VERx100(xe) < 1250;
> @@ -274,25 +267,18 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>  	struct xe_gt *gt = ads_to_gt(ads);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
> -	int err;
>  
>  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>  	ads->regset_size = calculate_regset_size(gt);
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
> -				  MAX_GOLDEN_LRC_SIZE,
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
>  	ads->bo = bo;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, guc_ads_fini, ads);
> -	if (err)
> -		return err;
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 6295d916e39f6..24a33fa36496a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -114,7 +114,6 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
>  	struct xe_guc_ct *ct = arg;
>  
>  	xa_destroy(&ct->fence_lookup);
> -	xe_bo_unpin_map_no_vm(ct->bo);
>  }
>  
>  static void g2h_worker_func(struct work_struct *w);
> @@ -148,10 +147,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  
>  	primelockdep(ct);
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index 98bb9bb307051..2a13a00917f8c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -48,13 +48,6 @@ static int guc_hwconfig_copy(struct xe_guc *guc)
>  	return 0;
>  }
>  
> -static void guc_hwconfig_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_guc *guc = arg;
> -
> -	xe_bo_unpin_map_no_vm(guc->hwconfig.bo);
> -}
> -
>  int xe_guc_hwconfig_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -84,19 +77,14 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
>  	if (!size)
>  		return -EINVAL;
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, PAGE_ALIGN(size),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  	guc->hwconfig.bo = bo;
>  	guc->hwconfig.size = size;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, guc_hwconfig_fini, guc);
> -	if (err)
> -		return err;
> -
>  	return guc_hwconfig_copy(guc);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 27c3827bfd054..bcd2f4d34081d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -77,24 +77,15 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  	}
>  }
>  
> -static void guc_log_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_guc_log *log = arg;
> -
> -	xe_bo_unpin_map_no_vm(log->bo);
> -}
> -
>  int xe_guc_log_init(struct xe_guc_log *log)
>  {
>  	struct xe_device *xe = log_to_xe(log);
>  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>  	struct xe_bo *bo;
> -	int err;
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> @@ -102,9 +93,5 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	log->bo = bo;
>  	log->level = xe_modparam.guc_log_level;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
> -	if (err)
> -		return err;
> -
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 1943893a3fd7d..d2605a684b1c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -964,7 +964,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
> -	xe_bo_unpin_map_no_vm(pc->bo);
>  	mutex_destroy(&pc->freq_lock);
>  }
>  
> @@ -986,11 +985,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  
>  	mutex_init(&pc->freq_lock);
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> -
> +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c52c26c395a7d..108ecbfe593ee 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -239,8 +239,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
>  		xe_execlist_port_destroy(hwe->exl_port);
>  	xe_lrc_finish(&hwe->kernel_lrc);
>  
> -	xe_bo_unpin_map_no_vm(hwe->hwsp);
> -
>  	hwe->gt = NULL;
>  }
>  
> @@ -428,9 +426,9 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>  	xe_reg_sr_apply_whitelist(hwe);
>  
> -	hwe->hwsp = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
> -					 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -					 XE_BO_CREATE_GGTT_BIT);
> +	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
> +						 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +						 XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(hwe->hwsp)) {
>  		err = PTR_ERR(hwe->hwsp);
>  		goto err_name;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e806e7b6ae424..8ad4bcabb8b5e 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -292,7 +292,6 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
>  	if (!xe_uc_fw_is_available(uc_fw))
>  		return;
>  
> -	xe_bo_unpin_map_no_vm(uc_fw->bo);
>  	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>  }
>  
> @@ -692,10 +691,9 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  			goto fail;
>  	}
>  
> -	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
> -				     ttm_bo_type_kernel,
> -				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				     XE_BO_CREATE_GGTT_BIT);
> +	obj = xe_managed_bo_create_from_data(xe, tile, fw->data, fw->size,
> +					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					     XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(obj)) {
>  		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
>  			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> @@ -726,6 +724,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
>  
>  	release_firmware(fw);		/* OK even if fw is NULL */
> +
>  	return err;
>  }
>  
> -- 
> 2.43.0
> 
