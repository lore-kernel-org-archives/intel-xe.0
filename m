Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F088CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 09:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A36910FC29;
	Wed, 14 Oct 2026 09:05:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E71F10FC29
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791968733; x=1823504733;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FufdWibgOLUtp353CcC3YpvX5AkHIOTGFdbWYP3SPhU=;
 b=WEyxB0ppEQS3BLawjk7x/BwGY1/jsSEx1Sd3SqAJrIJd7mhJ+v3nxaPz
 bg3UEkJnZlf4sS18ZrZ7nMM6O/XAljIPFlyZ4OhNEyo0zViQfeuMMl/Uh
 4ogTOJ27HmMZC5h2YfM80L1lzgkKhZVw83GfzlvpZJuefUVgrTNDmBwXz
 yuiRWMz5LWrdJz1/OtIghwZOt1HqquREOt628VJPjJN4sSxVhVYciRsmC
 5M2M1XX5rb0q+05G4SfcPpXupLh+TQE3pemXqHehYCe5V4garFwMlxJZR
 iN9XbQJ6ILM5BdkoH7Slz4/0p1p1uSuIEOXSQFHay5baG/qIpJi8QDtEj A==;
X-CSE-ConnectionGUID: xFFaxqIoS0ecX2O65/QqWQ==
X-CSE-MsgGUID: kNcRKkC7RL2O+7G+oQatPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="608221"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="608221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:05:33 -0700
X-CSE-ConnectionGUID: xtWPlpzMRXqD3epsYbGxww==
X-CSE-MsgGUID: wtyID0FpTvqA7LFG0EmzrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1728206"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:05:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:05:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 02:05:16 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:05:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zD5Bupn/wG1dbw3OP1al2z6UdMc8sXNNdZplBPVf1xW5PXCCJwoPbOewuqRlC1MVDBZheZd4Oi6wl+L2rHzKGXsA+qanxcab+FacfpNdVfiSNUG35E6sZHlTsBYO02etoRH4/G+1FI8v/4B6j1ekEkCC6hoz0X7Nf76SVbvkfrdFisn/SHRzlz1gRKBdsiINY2t4AA/PNSLrScJkYw/IYXDMHbJqBYUIRHncazkqE2dll+abv+gFpjQ0WGK84PUT69k4G4ldczkU6kvLXN+cqVGyqLE6wvT/PpO5UxPSAM1nQaOIZjfxihUrbwj9QW7sEfeaPAE6/9mHYMcJl+h+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JWBgMFkqHKOMg63xdGItBa9rG13nB+6F1Mrq1jPovE=;
 b=XYTctPZXUuSJLLXzW+Fzkp82z7TJ+D9DSozWFn9uoL3X1jvGe0qvlOEYwvVAreFwqQBcZXL/vVIqqkdr9jufeWvyZUMOgLE4bd+WTp+JoeYbr4v6bkmHiJP4sqxyQ5QDQ5Km07DsBFC47lgWa7CsDT1p610YuZFf9GKoRBZrq80U4+j9e3goAzSC88RlAfRpDqMOtSbM3W9itXGLrQsKISsZNwGXRxc62QpyllbYeQir9D9Lc09wQqvF5VhLl2EUWIPuGVlqyILXM2K2Y1bG2mRU1oeW7ZhyZUybRyrF/v2Rz7Ofsparoko0lspDCPIC4EkF9+/AXJ3K8UiOcOvOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW5PR11MB5929.namprd11.prod.outlook.com (2603:10b6:303:194::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 09:05:13 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 09:05:13 +0000
Message-ID: <e39f3188-3b33-4a0b-bcef-a3c47d2290da@intel.com>
Date: Wed, 14 Oct 2026 14:35:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] drm/xe/xe_ras: Report device memory errors using
 SIGID
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>,
 <pravalika.gurram@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-23-badal.nilawar@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261009104602.1075405-23-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0050.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW5PR11MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 020a244f-f615-4786-c49d-08df29d241d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|10067099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: TzeRIvlTJd/gtilKuS6XnlnPDKu1npaJ4hl+d2yAlF9C5ic2sRhcVGzezd1wfwkX7WFsyzwSSAq64vqPkRNJyYTNjrN6R9WQng36R5QN0rAMv5g2GIa+B1suIxEyEj+n8uSAqkBuhpfU2LozMq9xPOcoc+h0gk7SxhwWjN6Z1RqcBdTkbSLuC/j2uwnePCMZkvGkDs3IMipI+CEurhTgKL31CdRc+APua1dvU4xNs24yj6LLy4m8K/NAQaB4q2wBxIiHS140XcNWACmByI1zNOIYW+IxyZ96lG3NNIHZKjy8SKPlSmI7AySzd8kZw8sPPdEwAULpRh4fm4AkPuYvYuqNu7b2oRTQxrI/1r7QdQoaTCXUPwh7ZK9xSBHa/51JgWFy+OVjQ7odWR5jyecqdCUslV2A85tThHf3Tpqp8icH7XmLswKOIvxpfz5lhVOuLurCvuzvRJjOclk4iyBPUOFFEWIMLapn5EWN1HaiIRQL10oHasGMdc7vQvwGWh4kp1+P0qcwuz6TWYs04spoh4WRDxVJ+Fpclv8CBZIuAYIm8eyhhCN1g15y7OSg+j6b/3lri9OjS7ipfU8hrosg3FxuTfXaZuDPf6xUTKdovodiYBdqYPUkyn2Dc0BRrfCWkorHWiOoHYp14Ro6Qk1GpDYA3MNSDItXqJ+cizal9ZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFpBTmp3d09veEplWTlucjFyV0FjeC9oT2NFVncwYklodGhQdzlRUFhzSHlH?=
 =?utf-8?B?ZVovc3BaRXQ5S0N1VGJYM0xFUkN6dnBEWjdhcGFzUlhLK3R0YjVoYkx5Mi9y?=
 =?utf-8?B?ZHAybC9TSlQ0Z0tlM0U1czNBTXJLeWZyY0tjdTBqSVFURVh6VVpIanAySnZw?=
 =?utf-8?B?YUJzV2dSMTFJSHBaSGlFa1NNS0xJanloWjd2N2doZ0JxcUU5cEtJNlNNNTNw?=
 =?utf-8?B?aXNIRE15WTJpdFdidkhyNzkxcUhzV1l1WXJTbVd3YWdzQ0V0YVRuRDRmcitm?=
 =?utf-8?B?OFFjOEFSUG81UGd5dFRIYmwraDdCZ20yM3ZrZmlvdnRQc3dBRG8wbE00Z1Nj?=
 =?utf-8?B?bVdncHdaRnlPeWgxNnhSaGljQlU0cms0RVFlNEUxa0ZiZHo3cGZZYkxSTkx5?=
 =?utf-8?B?bm11c0RhR3VpQzNkb2MzY1JFTjR1cTNWeVBWRGIwNzdhQkFUQzl3RDYyRmta?=
 =?utf-8?B?ZTNGcmxBYVQrWFF4QmpkOUJRYzB0eXdXamlFM0F1K1gvTjNnN0E5SHByWWEw?=
 =?utf-8?B?ekNrdit5TjFTU1F2UkViQ3E5enM3MzllMmV5WmxYSGx1SnJ0VHQzU3ZheElj?=
 =?utf-8?B?Q3VyWHdiNVpJS09HS0dKTDNFNHB4eGgwQkxrNURtUWtmRW9XbGJpRFZYR2Jh?=
 =?utf-8?B?cDZzMVRVMm9MRmVualFzbHgxNGdLaHg4cTVrTGpLV2piU2VKbjRMRThqTHlO?=
 =?utf-8?B?eCsxU0Zqbkh4aEdYQ0xHVjVRY3Fjc3gyeVc4Q3NkUlY2NlI4elg2a1pCeWdm?=
 =?utf-8?B?UGhwVEpRMk40T041bTVLSzZxcEhaVEppZVVCMTZjdXAzRUo0dnN0YTZRVmho?=
 =?utf-8?B?T1lIUXJGRGZDMmo3ZWlCREFhaFIySkRabTNGUHFNaklDV0VXeGwwLzVpa3pC?=
 =?utf-8?B?STc4Z2ZHTk5zS21LMGViRG1qbzBLRDhoUFZ2Z0cwbXh5NHgxaU5Ja2IrcWM1?=
 =?utf-8?B?NUovZlVvN21vakNhMUltSE11SW5STjBzSS9XcGk3NkM2SmZoRUFIOGVGYjJT?=
 =?utf-8?B?VTc2UkxGcG9IS1p5V1BGTTJDNXNYdHJNRkNTVmZndWd1OFZRek50SDBVVWNG?=
 =?utf-8?B?U0s2UjJQU045Q0FPQWpOdVpkTFExR1diT0tSZE45cnc0RTQxQnJOcEp2blln?=
 =?utf-8?B?bUdIVHFpL3lEaithY2JHVE9MZzFoMlU2MHM0dlZndlBWT2VMZk1HaEx2TVV0?=
 =?utf-8?B?UkZscjBNYVNvcFpIQTZMakF0eHE0UGRBNTRUd1Q1YWRtR01HUzdCK09OSi9K?=
 =?utf-8?B?Znd4UkxDU0pBMUhyYWhValpsQlA4TmoxZ3VlSFQzTUNSc1BHQzg3VzV3dHg5?=
 =?utf-8?B?T0o0b2p2TitSUmNGcDhjbTlMRmdmUHNxQmJuOFZQNkROZ1R2WEttK3ZYSmV1?=
 =?utf-8?B?a09XUkRrRG56MEFuV3EvYmsxYUIzeFpnOEo5bWxRd2pVckg4WWM3dGhicjNG?=
 =?utf-8?B?SUI1alduY29RL0VvOStRL1ZwOG43V2tRRjNkOWJtL0xhc3Q5VnBjYVAwOWcz?=
 =?utf-8?B?cEkwdnpxV2ZEUWsvcUFOOE1XZmd3NXk0RmU1MGNHSG1vT24wc0drNkR6QnlQ?=
 =?utf-8?B?YTJGS1B5STE2V1pOWDd2RE9tM3IxaVZsNVhWTXpNSkRrQUI0eW9lK3JuV3Vl?=
 =?utf-8?B?VTFRYkFmbXlHSkxXd3ZKRVNWWVc1d0lyenRRZ045ZGFDY0JKMC83ZlVJUm5G?=
 =?utf-8?B?Y21oTE1tK0xCa3cxTGp3TzYxVHNYUUlEZTFsak5PRUh0RWJYYnZ6alYxN2pO?=
 =?utf-8?B?UDJSN1orRXE3NWRMR05nZkZ5b3RNRU5ta05aeENzUlNVaXBvN1RpR3pLdEcx?=
 =?utf-8?B?SEhJR2NtNzFrMlJYSDZtQWtQRU1Va3d1b1NXc3BmUEpIMXBWTmcvY2psZ1lY?=
 =?utf-8?B?RXhHbHJJZUFCSEN6cXVrZDRkUzBMcENCZFcyaGNKVklMSGxibWJ2MWp6UmE4?=
 =?utf-8?B?MnBWSzNVMElCdVlVOTBtVVFpMUo0RGpWcmZMOGhDak5OT2NTSjJmdUZrdUtw?=
 =?utf-8?B?Zmtka2QzYVRQTGJ1OW1vK3dXV2RHZU9DZ2pjMjlrU09BRmYrd2dZTXRtYzg3?=
 =?utf-8?B?ZE5yNkxoQVlqZVdlRC9lYjduMU9aS3hBR1FFSFdCVEN6ck1JcjZSblQzQ1g4?=
 =?utf-8?B?eFhIc29DWkVhZUd4ejJZVnpUTVM4TG9xMTRIWFYrdGFQTG9kMXEyMGxvNDJk?=
 =?utf-8?B?dmJFS1FhRlBrK0JrQkJVMFNOSEE3VG44dHVYRnNiWk5UNnVrcWU0TkxSTGpJ?=
 =?utf-8?B?Y3ZGYnVObU5rVUEySWtxKzBDaVgxbHl0Q2tBVkd5SWwwa1Nucy96YU5pNlBi?=
 =?utf-8?B?UWFXTDZWN1ROMjlSbjJxSWZHQTUxbUljTFBwYWZQZzBDMGIvY205SGZidWhU?=
 =?utf-8?Q?I0J1CfhwnLSVSdYU=3D?=
X-Exchange-RoutingPolicyChecked: HAGqZkEkxQoggoa3zR4gF+yIxrr4juOsTdUUkRIWAM4TRe85Zlzy3TkVCBrGsVfFix2DH5NumUV7JriutMmJKwCWMi3F2+EJNq5Vzgn9+HeJ/Ev19i3qYlGg7pSKG19w3MPlQyuKGut0J1FBDe/sSx7IrXlMR4qs86a+A8KPWnfTyupSnMY/wOg5WoHAKDv9oVAXMyx5c9iaQFEUV0TAj7TZ+Zuw3zjKhKP3k2sThZo/2sQOdL7c4ZgBsyJdMuUXIM7u45ehGjrxR8IefnE4OvxCMhc1AIjRnNupHCX4ZG8/p/kwFBTZopbl+Anfj6ZAAmf+bKR23fxLZcpCYZQ+Uw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 020a244f-f615-4786-c49d-08df29d241d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:05:13.6511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrMhlOd/xcfVtY8+pfPRGVYK3KcLxB4pJi8qsKMlNoN0Au8M6nJj09C7AWArb7E/CxMgIR0lfNOyqcCtGAkIfatx/kjubfOQmjGKfdwKKfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5929
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


On 09-10-2026 04:16 pm, Badal Nilawar wrote:
> Use xe_log_comp_info helper to report device memory errors.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 25ea178228f7..8ed4a6992ef1 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -409,14 +409,17 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   	 */
>   	switch (info->category) {
>   	case XE_RAS_MEMORY_POISON:
> -		xe_info(xe, "[RAS]: Poison error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Poison error detected\n");
>   		break;
>   	case XE_RAS_MEMORY_DATA_PARITY:
> -		xe_info(xe, "[RAS]: Data parity error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Data parity error detected\n");
>   		break;
>   	case XE_RAS_MEMORY_DB_ECC:
> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
> -			info->sw_address);
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Double-bit ECC error detected at sw address 0x%llx\n",
> +				 info->sw_address);
>   		/* TODO: Add page offlining for Double-bit ECC error */
>   		fallthrough;
>   	default:
