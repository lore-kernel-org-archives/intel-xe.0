Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EE1C00A8F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 23:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFCC10E2A2;
	Mon, 23 Oct 2023 23:03:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66F710E2A2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 23:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698102188; x=1729638188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vo8Ep7Xo6U2QnlgmK6lANvtoXG2Et+vxWdiLYE9whwo=;
 b=lH8ewXhlidraVC+Rd9vlrb2skXF/xSJIwkYzzEygBa69SmWKJ59LU5+8
 TCmxDetajIlq9LLhrQhwpiTBFHm2mu2O2JjM2HcvNST79a9UFjIm4oL0I
 Vav6S68BIv0lCOLonOQR8HNDSP8dgdnxVV3VeXirc5eiCPkpsc11XAxSX
 IzX6ZUJR8jUMjgFi78GIyjRQ+g7yaAdHM4FmV1V69ilYqaKDEEyUL3fYO
 LFtk9OViao2cx/RmJq9PBP73b6F8Uk5M3xWUUgQcHG+d2s+kaxKEEm3gt
 Jbp0OPuzAaSgjoi4h5DMwa83JP2xWUFS+1+ftY3A3gtEmYL3SLyhT6ORT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="372011042"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="372011042"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 16:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="787591068"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="787591068"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2023 16:03:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 16:03:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 23 Oct 2023 16:03:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 23 Oct 2023 16:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bmgjxyp9zs8HrmqqzL9Oz+mekaqnBGuP7cTrlF3aUSDu16OCvtqOJnnQSUUvFgOvjwULneknFoIEiEjWtkOFu/Q99cVxqZ1Jc6Lw4H2m2cTOMSjBjJIK4N4QxJCSgu+FldoJ4AJLmGHdoayGao1CbihD7fSCwQaEVlQHiVD1ycdiMJ0boOXJ5cl8SQE48fjsQgR/w0vLReNfgHk+m+XA9vAtkRYfPzCPBRZpJsudv1v31ZdAPjoA4ZRDcrM5alCeVE9Cn2u/WUakJaifS/Mg0C+rt/ubBQ4O2GmKp488UktXJOXXmErSVF1EuNQhzXMdWVVKTD0eG2bR+CM6FpFLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txQrdk4rE+DH3pYNoKI9G0Wk0h7kPtfyVFMfA30NwfY=;
 b=E1rQS8rNB8wFFYKyuESSZ9blCWf3VUjzb/wqGj2YOuDddKWJ1N2NzdZ91Db3zAi06AfCNBR6/yablAgUG661AQ9S+SKfT7i094j0K+XZuZWFSdHAy+AOf/12xS4geoIzz11K/QNwxH1UhGOdYOPXtT0FRmIi+xdJs0NSHh8t7UprRlZSN5ZJo8+xcNKyLAotNRntydmYE5lkYlKYdyMJf3n9tYSzf4YpIdAbE6wrgHH/D2cZJblVhc2IhVAvaAi53o+N5rpqoCUsrTPrG0PdavxmXtU7YumC4xyOO+YIboyfJmnwLRkTChm5vSzRR3QVNcRENWNmcUoUo1iRzxQHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MN2PR11MB4727.namprd11.prod.outlook.com (2603:10b6:208:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 23:03:04 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%6]) with mapi id 15.20.6907.028; Mon, 23 Oct 2023
 23:03:04 +0000
Date: Mon, 23 Oct 2023 16:02:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <ZTb7nVm/8nLOYiaB@unerlige-ril>
References: <20230919161049.2307855-20-ashutosh.dixit@intel.com>
 <340b766e-23ae-4a7a-9633-a2d7d1b97752@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <340b766e-23ae-4a7a-9633-a2d7d1b97752@intel.com>
X-ClientProxiedBy: MW2PR16CA0067.namprd16.prod.outlook.com
 (2603:10b6:907:1::44) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MN2PR11MB4727:EE_
X-MS-Office365-Filtering-Correlation-Id: 40830df9-8383-4333-9784-08dbd41c3622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XWo3wsyGrCsIVJJXyEj18S9eyZhnPkpaWOVquerWvGEpYlQpZ2FfR/jcK4+ssgjP9dnZ8iLlAM2z/Ci8V0WGQQiapcP3HQbmYwkl/xLibIR10w+qpsNqPb0cN3R78AfSS6ghZzzsMAlePVgNBAljXN24PgOwctCjbJWEHn8GJWuhGc0hWHdY8081vXWq+pxSgNtVc/vUaNl2glHyrNp9uVJ+2x0lgbbKZv4nnRV9ySiglY2f99k3u8D/S7/X7TTCQS2RgufJqzzWJudhVuQ+r7Rh9AH0YpNqyFO0sB+Jwk5TNRIUPshLAnjeRdmM5+W1UFBJoowFT560X2IRs1bcQyy6LyDdzZoRgMp+n3aKYwgWIj6sDlwCLVJIIlOD+XhKVPvc/sQvr95ydyD1pRf7GW+7JczE61AxMZOOX9556QjGLMJdonm8ENIU5W3zuesg9cIax/mF6rHYFioikA64xpejbOftwghGvgMq+5tzp3gi44MbGLERN9zHw9MKgaxSDhLh66nvQdkI1VU1+Pfm2cKDu/A7mbm7f+68g1aXfzkPv5fpzKO72TvcsXsUvCCD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(33716001)(8676002)(66899024)(2906002)(4326008)(6862004)(83380400001)(82960400001)(38100700002)(26005)(8936002)(9686003)(6486002)(5660300002)(6666004)(6636002)(6506007)(316002)(478600001)(6512007)(66476007)(86362001)(41300700001)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXM1QUNkZmZwSVZ6ZlpaVkg4Qzd3Wm41N204VUprb29iWGQ0aU53U054bVll?=
 =?utf-8?B?RjY5Wm1qcFR6R2xpVGpKQ1NqVndad3hOdHcwNWNrU2ZIKzUzejQ0RmlSV0Ey?=
 =?utf-8?B?Q01uRFNuWnlnV3M0enpETDJjd3VqOHlGdDVnV2FlUi8zT3Q1TDVxTjVtV2lN?=
 =?utf-8?B?TjVxV3E3elhtdUd3enNHRXlSRmpHZHU1dnJmS0dMZmF2Q284NnNrdWxYR010?=
 =?utf-8?B?WWw2aGRDelUyR1BRN2pWbFNWRndNdUM5MWFsUEZ2NThBNEI5cXRiSWIra2Mr?=
 =?utf-8?B?dXFCWFBRLzVKVFBpV0NkMDBVdnMxYi9idE8xRkVVclNZRVUvb1pNSHc2Zndm?=
 =?utf-8?B?QmZLamFxR01yYWpEb0RkTjRmT3hGTDFPbXAwUnlvNHppUE43T0QvbU9VamhE?=
 =?utf-8?B?UVlFbGNjWm9oYS80Y0w2KzFzWjRMZFU5bk1zdFd2Mk1LNjE4TllGRHY1MC9J?=
 =?utf-8?B?UytyOWp2dVU3Vm5QTGNGSkJyVXpyK1g3NTRIQUZyaEJ2aUVxOVdkdDlEWnRl?=
 =?utf-8?B?L2FCc0xLS2tLNDVyL1E4aW1jb2psOWNHWVB4ZUR2ZUdORnR6MlVlSzNKMkhj?=
 =?utf-8?B?TGF0Uzd2OTltQWMzQnQ5MXpSSGxlOVhYa1RmenU1ZGF2U2ZncldUVS9hRnZ1?=
 =?utf-8?B?c2E3RnV6eWFZNGRvbmpYdEJlRi91elVNdFQzUW9RSkFYMHRNQjFGQ213OURQ?=
 =?utf-8?B?ZlQ1TVQzWFVsLzZMQ2oyTDVIUkp6eWs0S1dCcGVTb0REUTN5THlYMjBKRUw4?=
 =?utf-8?B?bGpIa1V1RXVkWU4wejFiSWlTM2kwb0ZlREtoeEFhSzVQd2Ria2NwenhHdUV1?=
 =?utf-8?B?ekxiMVJKN0Z1dmM5SCtnalduSlptMWRUa2tMVVZwNVAvc2pBM0ErbVMyNjVQ?=
 =?utf-8?B?b2ZRMVVMd0hqV0xXZW5Qc045ZmZBZUJWTWZXeldLRW5UT0R4dXkvK0tYRHVu?=
 =?utf-8?B?MWhweXdsVjlQTmVRZTNjdnR4Sm42cks1eVZka1lsUDRnazlYL3Z5NFgxbEFS?=
 =?utf-8?B?MEliS0gybGpJMEg1NkhhWEZZTUxMWE9IQ1JGQkVkMldkZ0haNG9XTWk4NzZh?=
 =?utf-8?B?SUhpRTJNd1BmOXlWYTZBbHhMOUZ0RUQ3R1NrbmZBS0FwK3d2N1JMZUdLL0F1?=
 =?utf-8?B?OEFuekNNNlQ3bFFiZ29nbjNkTmQ1U3h3T3ZMLy9UMGpid0xISEdwWFhpTXUr?=
 =?utf-8?B?b3ZNYS95aXArZDYwd3F0QlUyeU55bHlXVHN4V1Y2OGI3L0pMTFNyVnhoSUFx?=
 =?utf-8?B?NnVVcWJad1hHV1FETEFEZXA4SS95SmE1L0tRdThuU1pxajlRNDV6azdqNUtl?=
 =?utf-8?B?eU83eERaUys2dVpRUFFReUMyTXp5NXZDajBTUzZmL043K25TUFQ5bWJkb2VM?=
 =?utf-8?B?TTRNYUEzd3NDNGZUbW5zRXUraVRhdjFNcjhPVEZ0QVhBcEFWUlBVKysydXIx?=
 =?utf-8?B?OUxJdm1OSzBUNmhZZmV2d3U4cUsrNXNoM080ZUwvUklRaDhaeHpTcTUybGx3?=
 =?utf-8?B?NkdUemNDWHRNYms3SmZiOWlCbG1iMWY4RXk0d0FrT1ZsVDE2RnJUTXZoTUZF?=
 =?utf-8?B?YllJN25mUkVJUVRMOFphQXNDc2VLSk5xMjA3Q1RmYVlhRU93ZWRHMkkrNVpI?=
 =?utf-8?B?cU1zRDJ5eDVuNWFFenhKV3ZuNE9jWDRSWHg5ZlB5ZTdUdkFGbUN6WTR6SDlP?=
 =?utf-8?B?STB6cUJjSXdMM0ZVZjg3S3N2T0pWTGJSb3h2RlMrd2d2cXJDbUZ6UjEvRWZv?=
 =?utf-8?B?YS9PQXczcEtKS3g2TWJaam9PRURpSGNJbUZuT3pvRWFaV28zdnpFRTNMUDMx?=
 =?utf-8?B?VzJoa1M5NzZKdy90dm9QcEszaGhrM05kOUs0bkh0eTV1NjF1Z2ROK0tzMzB4?=
 =?utf-8?B?ajVsL1lHbUFRU0FpZFpzRWJaSGhBUWdzUmsrR0dlRndRSjhiUTUwNzV6L01Z?=
 =?utf-8?B?blhzeDJwdVBpTWh6ZjBMbVVCb0tIaituWjg4UVBobnNkVWttNDhqdTduSHVU?=
 =?utf-8?B?dlVOdTV0RnMwem1YL1F4NStpdG52c2ZFUXpUeTN1Q1JtYi9rVnhUNFd3Zm0z?=
 =?utf-8?B?dmcydWEvWkNSdlBkeXgvNVZ6VUw4RlVOZmZwaElDeGdoVjNpdXg2OFlZeW1q?=
 =?utf-8?B?SHV5SGFXencwN2dPTnhFZ1V2VXZxTEJpeXcyMVdIdlJIVXkrZWcyUmxpNXV1?=
 =?utf-8?Q?c1t2f7gA9Wq+MmqbiYtWlC8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40830df9-8383-4333-9784-08dbd41c3622
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 23:03:04.1886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8TPP1IRe30CY16BhgOiDaldfJgoh/QdkXSlcl3FkCCVY2MnWVKVPI4BLuQgEKHJJPM4I1putMXnC8M5zR3dTFqw6XTMOIuTrKX8tfSNt74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4727
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [19/21] drm/xe/uapi: Drop OA_IOCTL_VERSION
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

On Fri, Oct 20, 2023 at 10:36:37AM +0300, Lionel Landwerlin wrote:
>On 19/09/2023 19:10, Ashutosh Dixit wrote:
>>OA version was previously used to track which OA properties were introduced
>>at which version. However OA version is an outlier in that a similar
>>version is not used anywhere else in the kernel.
>>
>>For XE, we will track addition of new properties by means of
>>xe_user_extension. Userland can either maintain a mapping of OA properties
>>against the kernel version, or rely on return codes (e.g. ENOTSUPP) to
>>"discover" OA properties.
>
>
>As a userspace driver this terrible.
>
>You're making us write more code because we have to discover every 
>single piece of implementation tweaks ever made to the kernel driver.
>
>Yes OA version was an outlier in that it was better than the rest of 
>kernel API.
>
>By reading a single value we could make decisions about how to 
>communicate with the kernel driver.
>
>
>Having xe_user_extension here is not helping, we still have to fuzz 
>our way around the kernel to figure out what feature level is 
>available.

Hi Lionel, Ashutosh,

I don't want to change interfaces to make it more difficult for the 
UMDs. Do you think capabilities could help achieve what you want?  We 
could have a bitmask of feature availability and the bitmask could be 
part of the xe oa query.

If that's seen as an unnecessary uApi impact, then I am ok with version 
being returned in the oa info query.

My primary concerns with the version in i915 were

(1) version bumps would need documentation even when version bump did 
not have explicit uApi change. I couldn't find a good place in 
i915_drm.h to put such documentation. I think capabilities would be self 
documenting and it would be explicitly added to the uApi header.  

(2) sometimes before upstreaming a feature, we maintained an internal 
version for the feature that was using a different range of versions.  
This would cause some grief when rebasing since the versions need to be 
increasing in the order of commits. If we had a bitmask, we can manage 
it better since there is no need to have an increasing value.

Suggestions welcome.

Thanks,
Umesh


>
>-Lionel
>
>
>>
>>Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_oa.c    | 5 -----
>>  drivers/gpu/drm/xe/xe_oa.h    | 1 -
>>  drivers/gpu/drm/xe/xe_query.c | 1 -
>>  include/uapi/drm/xe_drm.h     | 3 +--
>>  4 files changed, 1 insertion(+), 9 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>>index 077698a0c5628..7cb900fc88f58 100644
>>--- a/drivers/gpu/drm/xe/xe_oa.c
>>+++ b/drivers/gpu/drm/xe/xe_oa.c
>>@@ -2331,11 +2331,6 @@ static struct ctl_table oa_ctl_table[] = {
>>  	{}
>>  };
>>-int xe_oa_ioctl_version(struct xe_device *xe)
>>-{
>>-	return 1;
>>-}
>>-
>>  int xe_oa_sysctl_register(void)
>>  {
>>  	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
>>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>>index cc6f64bc24ddf..c5a2745ab7cfe 100644
>>--- a/drivers/gpu/drm/xe/xe_oa.h
>>+++ b/drivers/gpu/drm/xe/xe_oa.h
>>@@ -12,7 +12,6 @@ int xe_oa_init(struct xe_device *xe);
>>  void xe_oa_fini(struct xe_device *xe);
>>  void xe_oa_register(struct xe_device *xe);
>>  void xe_oa_unregister(struct xe_device *xe);
>>-int xe_oa_ioctl_version(struct xe_device *xe);
>>  int xe_oa_sysctl_register(void);
>>  void xe_oa_sysctl_unregister(void);
>>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>index ad280bac9eed4..8246ce4e24ce5 100644
>>--- a/drivers/gpu/drm/xe/xe_query.c
>>+++ b/drivers/gpu/drm/xe/xe_query.c
>>@@ -202,7 +202,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>  		hweight_long(xe->info.mem_region_mask);
>>  	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
>>  		xe_exec_queue_device_get_max_priority(xe);
>>-	config->info[XE_QUERY_OA_IOCTL_VERSION] = xe_oa_ioctl_version(xe);
>>  	if (copy_to_user(query_ptr, config, size)) {
>>  		kfree(config);
>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>index 3b106bed42ea6..b0563cfc351ee 100644
>>--- a/include/uapi/drm/xe_drm.h
>>+++ b/include/uapi/drm/xe_drm.h
>>@@ -259,8 +259,7 @@ struct drm_xe_query_config {
>>  #define XE_QUERY_CONFIG_GT_COUNT		4
>>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
>>  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
>>-#define XE_QUERY_OA_IOCTL_VERSION		7
>>-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
>>+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
>>  	/** @info: array of elements containing the config info */
>>  	__u64 info[];
>>  };
>
>
