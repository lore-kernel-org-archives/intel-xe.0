Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09521C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 10:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A60D10E4CC;
	Tue,  5 Dec 2023 10:07:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002DD10E4CC
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701770859; x=1733306859;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h7xWJv2YwDQf1qnVDy3WQN06BfuRoxP/KZrS44mRBAw=;
 b=gAnWqZzSYNm1kp6z6COIInfZ6lpB12gufALGWuAl2uE1UfwTL7QZQt7Z
 8YBhKfWC21xgbVMyjcgwS4n6w9E+91jhcIWpTsR7qmEXu0OwaTOtuLOl+
 emYLG2kQoOi9DM1R9N0YXlW+vt+v/IWMlS57NX554QtwDihcYDFvc8/jz
 PKGMdGbp3twCTWLcyzw4izIIWkhD0Sp9r/OrhRAzYp1xQwg8Qgup7Zx97
 pCftJUy0QnDsAnbK/lRB3QRXkPiJh4Gai9jL2nNZJmuRI2rF9vGDLHxg/
 YbHGc5AZ2lrescNwJTl/sBtEUm2fld13w526koDAaVt0+/hLZSX9AvfBx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="480067496"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="480067496"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 02:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747172337"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="747172337"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 02:07:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 02:07:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 02:07:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 02:07:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 02:07:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQL/wASH5UR6BANLRHMp0Y4bwFrH47/NZ5mPd46veDjG7fQJteWdtvf7UD/zFLwjG2y3A4zFKfenO5WvQJiIzwAjm/AOlb654gLJl6uq914+nj61g3djltZLiE6uP4BSlRjd2NVqw8DO1HGWX56n/pQFiu0/EmrjOudYyUajew6Q//c1/QVBm3Vsx34OolOBMWqYzQBSq6tNZ3pVusj8gP1LvGhH1Gj/k1ReiAbLsdClhfaB4L6gYTRVZvFyd7DzsDnxqf9bHVBvnEcqm3gjJ5nen3n2IHgq3GFQa3nbeLNHDVd6M6mJI/iQy+k+4N2Ds0QtbpVFBiG3+tYPVwExLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4KLc9U2ay6ZYzxSvV/yYREfuCP6AyJGw2wAhD476ow=;
 b=C83+F1SG7YNruZr7wys7dHJfhrmfG5Y713YSx2wSzfSr0rl4473gEHTybyUrkayNK0MyyUXTSlqnOoTC+bNQ0ouOtMZT83W/mBURU5uR2pXABNTrG1NQE7ZBUlPgBWJCH5y+llAXHOnl9i45+oZWzDhviGRWMeuzJzos5TlO0NsyJ5Wg1vUYS5FlujhGp4+88b0NrSnkEc8SDg01vnmlHG3SVko/FLxXcR4Him0DWggzpVUGcM8nq2/Jf8jIMFeb+onV68O/zBTMdDNqzVx6ETmdUDhxzXQcmsll7fhd26wc/sPeYA3CwgiWi5cbOpeohGItwOBM8e9ZQ6Zg5zrO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.34; Tue, 5 Dec 2023 10:07:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 10:07:30 +0000
Date: Tue, 5 Dec 2023 11:07:27 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <kcb33acrjx3nbx333ny5ogn7zasaq6xm7wpalm5phzitw4wgc7@fdk37qcmr4me>
References: <20231205095715.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231205095715.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5f2d05-785c-493f-57e8-08dbf579fdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yapQ2unpUdHvgSA9N60lg3BGk1C4K1Lt77aB4vZ4rbDdHiTDz3JqdGbpMub1IHD3G7wvE0tCXmpu1xRjWBbLye4P/V6R9aOZ+C1E/EY/tYgmm2S+jdG8+axbjBi54XzUDliKPrrZMuJCRVCaFZ1YMqUGe+/nnXouSLuOmnoDD2pRA+QDRkqUVcBmeei8qF8nZGEVD+ZHTQys8a3C+ePUg1ixDfVytmNfEEGR4qJXDEXvHRafRcnjQEGWeeft7tgCNXGoqz4i/FGZx59It3By8+zfmEYCmPs6gZTFZhjTOc+auAudlX7MFiYH5tLXeHKlkhhQvgcP5cCtTR580Qsr956wqvXEwm0cZxdjsmeQRBmBNvvOHd17jSj2UACMpIHlDUQDb1FCrKCv0ozORPmYYAZ42e+Ecu+xDUuGQwhRB1S+OEY/ij+KXeYFgCy9TA01M/MfQucidedfTMEbC4+EIBZ7OGzQxS5ULZMFC2l7daBxuUZ0hIgkGiMwxraTgn0TUtBhHUKnNFNe8xt9XzN5pr+Opsly1bHP47IhVgEt4tP6DB2NQPgyoWD/gkkdW/1Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(136003)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2906002)(33716001)(6666004)(4744005)(6486002)(478600001)(8936002)(8676002)(4326008)(6862004)(316002)(86362001)(66946007)(66556008)(66476007)(6636002)(5660300002)(26005)(82960400001)(83380400001)(41300700001)(38100700002)(9686003)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNwYXFZbGNMdGdtYzhvSE9sMXl4MWk5LzZCaUZidElrcG1yNkRNbkhjclcw?=
 =?utf-8?B?Yktxa3dCa0JVODNMOTc2NUhpMnVIcDRWNnRTK0grV0V5ZWs0dHE1Y3RVNWN4?=
 =?utf-8?B?dWVxM2hFaDN3anpnTjFmSC8vcFpTMWlBdDBiM0ZYc0VLWjJyc0xkRGhCYktB?=
 =?utf-8?B?L2NTNTJPNmxoalRKSXhWaDhWaDMwUXV2STVQTzZVUVl1ZXNkN0F1WURqcEF0?=
 =?utf-8?B?c0lsSDBidXY0OXlMaFRtUHNmbXo0b2pKVUh0R3VwRUFzUmVEU2dZQWliYTJY?=
 =?utf-8?B?N1F4MEhBb001WjN0QzEyU0k5dnpQRGFMRmVySXFYbzJWR1F0aGcvV2RRNnZM?=
 =?utf-8?B?M2N0QnVPQ1FOd3ZRL0lucUk4MW9NVENFMzdqa0lMU0tKamxtT21Pc2hvV1BC?=
 =?utf-8?B?REhWREQ5Smh1OW9tMko3OU9Ra2Zva2JNWjZBWmYydkxpNHRtRjljMzN0OWdl?=
 =?utf-8?B?cHk0UG50dnY1Uk1WbmtndEt4UTFNVFE5b2pwOUlyM1V5ak1DcWUrUG54MHNu?=
 =?utf-8?B?NUlualVoeGVVd3hwOHorbTVMT21WM2ZMRkdKYVVxNHBVWDdTdGcyU0RMbDQ3?=
 =?utf-8?B?WGZGV2gvTzcyTWxYZ2lNcHVNYytRVFNJRVVvL2N6OEdxdlUxK3pheENhYmFH?=
 =?utf-8?B?dkcrZWR3ZGFsZyt0ZkZsVFlPTU14Snc3am9xVUV0TlYyTVltVG9ldWhoV2R2?=
 =?utf-8?B?aVh6SXViUWhqenlEM0JNMnlYQnBPL2F4YkFEakJmUkJGdDA1Z2c3SmZIN0Vy?=
 =?utf-8?B?ZHFXM2lPcjRTeVRGM0VpVEtua3pra0luem5NUnY0MUk4WE1vYXpjTVI5UGZF?=
 =?utf-8?B?dUJ4VFRNdWdJU3VUYkgzdUtWUm1PUlV0WFR4cHlpZnNZWWlYKzdyemFnL2lI?=
 =?utf-8?B?OFEzNFo4WnlaM29XZWd3bXFzUGRuZzJoY05lK21RUi95NHI2QjcwbzlSR2Z0?=
 =?utf-8?B?ZHB0d3ZqTG96ZnhyNGFKWTlyWXdqOFlMUU9vUGpDcGNlN2ppMHJCRE82bHE0?=
 =?utf-8?B?ay9aTzlXWXQ5ckd4d3VDVis5ZVZmSG5LTmE3bEZyU0dXMEhMQ29QK3EvUUZy?=
 =?utf-8?B?dEpQbE1FWW5oWmFQMmM3RmVvNjZLSHVObjc5c01maGVtM29sclBpaldQUXNo?=
 =?utf-8?B?M2VtZ2xQdENaUnJhdkU0Qm1SSW1raUNPMmt4UHZkWFFZeDRwWXcrdm9Oalhs?=
 =?utf-8?B?eHhVcHIrZ014cHBwOHVaZHgwWlRnNldDcGx5ckVQc2RkWmdJUWFzSjEzbTIr?=
 =?utf-8?B?Uk1GQXZheitwWU80NWdUS2E4OFZhcDczK0Nwa1dRTzgrODBMbTk5U3JmQVBH?=
 =?utf-8?B?NUdVVlIzcDhXVWVqdlhTRmFraTIzY3Q5eEc4TDQvaW5LeDZmMFBYVFMydFEz?=
 =?utf-8?B?dXlvTHEwSDNnKzBaUWJwdDVXMHpjUUNvSHFzY0pzMjJzZGVLU0tRMmVSVnE2?=
 =?utf-8?B?SmR3WXJoM2NxK3pZUVUvaFVLMVNHajcvd0RvY0FjaHplQVRYZHYvTlJMSXhT?=
 =?utf-8?B?YjVSS3FLNlNvcGVuemo4TTBjMUtNSldYRUlnMDlHVHQzc2NUYlJwSXZ4M2c5?=
 =?utf-8?B?blBNTUN1Zi80TnhkS0w3S0FSU2FKY2ltcnIrV245a3JCTmtWSkgrNUhvYllJ?=
 =?utf-8?B?dldkNzJEOUZsKzJ2bjB1djBXcFNKVEhXTVdQU2ZUVG4yTVNmd3NKbzR1cE5r?=
 =?utf-8?B?Syt2WlNYRlJMVDZidzRGSEVGL1JpNWlEVllYL0dBTXIyeWZXNkJSTnNWUVQy?=
 =?utf-8?B?Q2tpbGw0bXJsWHc1LzJZMkhqb0piNmxIdURINjN5OVpxbUdlZmhQMXErV3BV?=
 =?utf-8?B?T2U3RnRydllOZURhV2RsZEhVTERuKzVNS0ZkajZBd0YxL21iVzdpY0pZSmN4?=
 =?utf-8?B?SnJCWEZYYXJBKzM1Z2MzM0dzZ3ljUkMxSkl0Mk90Z1dVZzY4N1JZTUd0UU5K?=
 =?utf-8?B?SUdUMlNrVjBhNldSVkN6eGpJVEJtRERsYnprQ2NWemtFT2ZOdXpid1pHQnUw?=
 =?utf-8?B?RTI3VHJYZUdlZjVYaDVlRVpXcEVPaVdMcTJyeW1BZ3J5b0pSZWRBZWtVRk50?=
 =?utf-8?B?eWpIWnVjTCtCNU1YbmtaMG9MYjAydWFhYzVmYjc0YUE5QTEwY1VaaHBEd2l2?=
 =?utf-8?B?MUMxMnVKS2EvRGNJVDlubTdDMDYrNjN2RzBxdUVLR0Iydy9hRThvT0QvKy9D?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5f2d05-785c-493f-57e8-08dbf579fdd2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 10:07:30.2804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WY2g3PZ6ri80JNSkfRVkoLY42VpZX8r9/ECg8fDgR7tnUBRDFrMG8+dtocbeQZGsTIxorBvjOMVfl+dPRG0Pd8jAvsPyhMJPb70Qi4pJur4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/uc: Store firmware binary in
 system-memory backed BO
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 09:57:15AM +0000, Francois Dugast wrote:
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 9abae65c6b23..f25c920ed8af 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -760,7 +760,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  	if (!fw)
>  		return 0;
>  
> -	err = uc_fw_copy(uc_fw, fw->data, fw->size,
> +	err = uc_fw_copy(uc_fw, fw->data, ALIGN(fw->size, PAGE_SIZE),
>  			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
>  
>  	uc_fw_release(fw);
> -- 
> 2.34.1
> 
