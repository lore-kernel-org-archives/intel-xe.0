Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73985C531D4
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 14:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1F110E331;
	Thu, 23 Jul 2026 14:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JW+Rk4jA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4C910E331
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 14:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784816991; x=1816352991;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oszVW0BMYPuiuQFNe4qEj26HTHTgsjh6Xx1siDMhao0=;
 b=JW+Rk4jAbVD61WsOTaZtTWeBvsaFIsc7v/CMCJjvh46fC9Lc1Z8QjKTI
 /N/t3Sm+/cBNweo+M/TiMNFWpMn/3tDzyz0zri6PdbUaxAzeXtbiGEk0U
 30jjQMlPJoE5bBvUs+Fsan6O9bBad4zfC4DMoDr8BFXiaT14osoM4eYZ1
 KYT12V5OTudwvci0ewPazSzvW3K/TvgH6k9prrTS0twWJqhz9L4lGQuCE
 P1RSc4SewCh3QmSs0adLWWyqV5rWMJQdq6TCAt65WKjunLEPYxz6rIgNb
 EWIP3nqLzs0cRY6Jm0hUoKP2E769XBV2yE1cuNamV2SFkoqyA6Uz4rNiD A==;
X-CSE-ConnectionGUID: zzCHOszSSyShjjvZvwpGXg==
X-CSE-MsgGUID: hNSvPBOITeugBjKKVUZdgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85666674"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85666674"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:29:49 -0700
X-CSE-ConnectionGUID: BiGkq/VATayvDNeGDLAIrA==
X-CSE-MsgGUID: 1cC1OvebQT2ZmYsr4gkUiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="288407351"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:29:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 07:29:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 07:29:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 07:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsQVRMMczHqu4xvdnWc/ghneNrumPJBAbzm52h0IegEfHGjPpE7l5DiAOeUdfFESyJuzT/0+MEbAEedKQOtmLds/CNBbiw36fdokDLVe06RC+aSQBkA2CLU+zktwzUT6wVGK5T5XzetBEF3I1wI7noC/+ihLI/wi5taoupwyBAMdmw1FccSRJ5doPBRYCll/VZZ4uNpWWBvg+Un8Ow1HLTwGXGzPK6jjFfj00jcZyCwUf+aWKPFPEzPK0aPGAHonSbQbn68ABluHaYSow1hEXha3mpjZjnXJaKIPpvncfpRp1qxdqNepdBPhfm5pXKPJE3DJDH9eldaf5AkGKv2XFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rA5b4aqAYkiq8J08RzOXDd74bZoTW6bpmPhzQ83jSMY=;
 b=ewKT2yCOXerwPoaaO9zDZ4xr3pxZ2DFdLXOedaSjDFL8+jegc20DK3tSPD8RWZPlPzA3lilbAzEgAAPFESgsrYxzu5HGhBwwo9l4haOTG0wXhpgTzfoqLEPs8dPezQ7kehXvyyZ+kvBG8QEwqsnWp0cD/4j+uZFxeeUzjHvV0fWP0LgKBjDU8BRHO+5YI98IekhbsAy8AAcXoFZEnDsPooWDAOX5gEQQwEZUcEvEJHPxzYsa+9hDKslnqsTuccLRRNs3sdl03s3Ka7D6dRVZI0Th+lhBbuBg9O+nxoizhV5SqX+/s+uxi2H2Sa/WnqYBHsQ7idn688PUNht9LlTPBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Thu, 23 Jul 2026 14:29:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 14:29:39 +0000
Message-ID: <23532ff4-498b-4d43-ae79-a1c4326491c5@intel.com>
Date: Thu, 23 Jul 2026 19:59:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ras: Validate sysctrl response
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260722143142.675658-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260722143142.675658-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0299.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: c97f1e0a-bb1f-4335-9fed-08dee8c6d41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WNmmJH58HibiXiu+Oc5fH8hEeTsVky9iwwa15GTleLejPd5c5hKBC3SkwLjpR4zpGQX6wBKD9JaXB26K63ho+ja7hY8xUU2v/trKw0RsKv11yRyJCU6IHd0TmL1kdZ5LvI41LUqXd+42oeOKhD7Y3V5J9TzTO1B7Ok1qz8E2hfQl30BIQnGJjHQ7j/xsRU2ACte3gs951D/LM9IFDT1m5TKrEZ+e5xxDGcJkdVrmp2qgc4ggNAbweeOWQt8Y3T6KXqRzKp6mqI+Rqg1ISUdAyjs3+VuxgOJKhSvEzYo38r7ctgW9iBUYEaotlf18HyVI44zKadiSsVQ3L6cGj6RoZwZ+KTCne/t1VNA4KaEBA4EXR53QqC+cNzDuRRc3i87lMBu+RnchUGByyxCnKPD96hUCzsx/kYFdwU0JLLvkzwEvkDlG30BgumPWk1y59V4fBUahRkEkxVpFNUiEMb1kDAYQZ6nUxetYCphr3KCZUolxO9HlxqPaTHc9J0Jpp5evW2cU93Q7aZ780VO1AbvoYDwS9LkGLLDrH4tV34oHYg1REEa1/5boL/79D6m1u3a89rin5HZ95dNa+2sfAiXoWWU3HeiT8u4CVmUEUS9On8Adr4LYSRPq3KEcrDa1dqbhygigdfmEZ+Why76W4Y5bbdYYG9in1UZa06iFZTjpT7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFQwTVlLV2VvdUdnVUtTUWhsdy83WmZBamo1aU1VZThSUm1idFhQRVNUdGwy?=
 =?utf-8?B?UTdEcXhwNEFjN2lxdVlXZjlHR1AvbHB2TVZndjZZNTRBbWw1eHJ5SDFBVERt?=
 =?utf-8?B?dXlpbkRIRVVHTEJvU291MzJRUDN5Y1kvdTZDUzZxbm1rQ3RtYkZHdXJlZnRC?=
 =?utf-8?B?Y0ZZeFlTa2dMZzZCVjNlNUN6Rms4K2w4c1czUkFwSGtOZm9XRnE3KzRLekxl?=
 =?utf-8?B?VUlJRTlITE5NUmNVZjFLWHYzMW83c1dzYVNHNWNhV3A0ZHBpM04yUzJ6MXdN?=
 =?utf-8?B?bFJYTVRCMlcwTjZRS0UwNWo4VjZLeEJxUCtMN2J0WEttakNrdSt6VXBQZWxN?=
 =?utf-8?B?dVY3VmFSd1pKUk5DOW55czZndnd3NkgwS0lSaDlJL1lLcGZkTHlVMEJoYlBF?=
 =?utf-8?B?WkhmMWZWNnZOVkFiWHkvK2hZVlpzbFBrR1FLc0VCNGZIZVhnaUFtekRON002?=
 =?utf-8?B?KzloSnVwVlRxdE12YnRzSXRhbjlQY3o5VTcvdGg4aXo5TjlIcmhqaGtJdlN3?=
 =?utf-8?B?L3p1c1FwTit3VWRDTEl2cyszR003bS9UWTdhL3B1LzBXd2RQcFdJbWpRcFRr?=
 =?utf-8?B?NkdSRVF5aFBOMUJhSEltTUhxOC92Q2ZtN1p2N0wrOURFT2RYdkJXRHdnNzM1?=
 =?utf-8?B?QmQ3U2ZZSkxUTi8vR3hrNlVmem0xdEQvdWZzZEZzaFc3anBXY0IxV0ppOExx?=
 =?utf-8?B?dDhVSGthUjJRenJOZjUrSW5tUWswVjFGSDY1dG02V25mbmJ0UHZsMkJJQzZW?=
 =?utf-8?B?Q0F0V0VnL2R0VG4ydTRvaGptb1NrSjFHSHF1NDg0bUZQMU1SU1ppVkd4d2Iy?=
 =?utf-8?B?d3FTaXlnUDRnREoyMDdQRGVvYU9mRERnT0gxNjEzNkRPWEdZanpVazFUVzk2?=
 =?utf-8?B?SEZiK01QTnJhZHdFYTc5VGtXOFNhV3A0c1dQQWlsUTh2R3BwN0wxNVZkb3hV?=
 =?utf-8?B?YXo1QXRkQTdVNE5pWWw4UERsalNSNjU4d29QTDFJYjRHM2lqaDl5dWxjcTIz?=
 =?utf-8?B?a2F5Tnl2S0NLVXJacmhjRE1veURvSWRUUVV2NTBsRjFxc3grdnlBcW8zcnpj?=
 =?utf-8?B?b2lnMGhOOWNaRzRMRVh5SndPTzFob3I3ZC9OblV1aXpIRTl2N3pra3VCLzJF?=
 =?utf-8?B?OVgyOXNodVpzQkpRM1hGN3dobWczNUdlUkkwVWplWmg1MHdnS0xVSkU0MUFC?=
 =?utf-8?B?alpyV1RHV0dyK1dpbjk2NGJrNjVpallhSFYwaEtPbVFnaTZxNmRiVWl3cUVp?=
 =?utf-8?B?WC9oalV0S2Nkdk1NTysrak45K1JLdE9sNEpNYXpWNnNETG43UnRMRDl6ODF1?=
 =?utf-8?B?NzExNThXRHRnUUp4K2N0SnFVeVdnOUhtUDBZRGowRkwyQWRrYnl3bFNldVpi?=
 =?utf-8?B?T0FpNUpzMVhZb2xWUDNHNmZmTXFxSTB2Rkt5RXg2OHJGN255RDNoMmJWTjhH?=
 =?utf-8?B?bFdOUzlJY2wySTllZkRkcUdDS1dZUWhhcEVpZnNaVGlnd3gzRzlGL2VsSXRP?=
 =?utf-8?B?cWxZOGF2eEtwb3Z4bGRjU21idDZscXRCQXp1NEJ5UTh2NHQ0NU8xOFp4aFZY?=
 =?utf-8?B?VnpmbDNFOVJiSkdjRVh4Q2JYNGRYUWs4MTUyRG5Ed3RrRUFrVlFGMFUvclRJ?=
 =?utf-8?B?RFl5dk5UditKSU5aU0tDN2l1akI1am44OEkwaUV5aVVsVVdaMzFyZFlXeTZ1?=
 =?utf-8?B?VTRlNGcyYi9nc3VqeDAxazE5QU1OeXNNeGdKNTFXWEJJSGtySVpINVByOVR5?=
 =?utf-8?B?VjBlVGdkKzU5RWF6c3Z5ZnpETTVrY2E1UUhxMmt2ekJScUl1cThjVHFFYzlW?=
 =?utf-8?B?d1prMExUOFBXeVpCV3EwZHRzZTBLS3UxeWhqc2pJdDZBUUgwRGdWZnB0S1Vz?=
 =?utf-8?B?dnpsZGxCOTNJN2J6NnVkNjN6VXA3VndIWXliQk4rbDVOVTAvaXlnV3FRZVgr?=
 =?utf-8?B?VUs2QzRCbGJGRzU0V2M2UVJVSm9FSEhDNFVtSHFhSzRSWmFkQ1dWVTIvRis1?=
 =?utf-8?B?YXlYQ3g0dmg0TlFCTWVmWUdYSHlqZ2ZQL3I3aXZVa29ERzhXZHBkMDJYN3Vo?=
 =?utf-8?B?MWpvam1ITnhxSkdvTlAvM284aW03cXhFeFlhVmlqaE5hb1hhWThQWTFobUM1?=
 =?utf-8?B?RytRZXZZRGJqM05sSnZ3QTZZU3RsZTRIVE5ZWGlIRUd4S2g2ejQ3dTJrTW1F?=
 =?utf-8?B?bm4rL3FxYmgxNFNMdzZUN0RUODJ5L2NzVWFvTStzczV3YnB3MXA2L2pHeUFt?=
 =?utf-8?B?NU5TWnlWc1ZUZTdCQUN4NTdCeGh3OVBxeENQbkJSb0J5MTU4ZitQVVluN2ds?=
 =?utf-8?B?cE9kYTYwV0RtMitCM1U4RWVRNFlUaS95Z1RNK0J6ckIwNW9MODlTZz09?=
X-Exchange-RoutingPolicyChecked: OrmXILRJ/f8eFXk6eNKdZhOpwUUI2XtwygLeWmLmr5CEiOieCMBYpxlaW4Pj3HXwjP7qUJgQ57W7Ytx9SfA8+oOHxWFqCodPs5mft7sYVP5CDevqkyRqFpP+fKZ8lZFB1reTM9wdiKIWM2VLA4eAgpwYucHtCl+zU6fQS/uFrvEEaZZWrdZjAdWFllwhwD7GTkTLHgsRs4rMlp71ofdMMQIUGDv3Ug4GODnl/azoiuWTCoSqR35qyH0hDbVKSB1gLN3+xHkf1HHgRC7wsB/stTIJICd+G3eNTJ8Y8I4JmfRDWn7T1a0cc7XGxYLOAio18jdGDhFKBbz4JxKJzyppFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c97f1e0a-bb1f-4335-9fed-08dee8c6d41f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 14:29:39.5109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPoWpuyrOuFekjAZuk8V57OPCeGWk47tTpooy8oDFohAdrClToabRjJ+wwBgjZwiY6/9V8CSaQysNH9bmP2PAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
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


On 22-07-2026 20:01, Raag Jadav wrote:
> Validate errors raised by sysctrl firmware instead of blindly trusting
> them.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>


Looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
> v2: Continue invalid uncorrectable error case (Riana)
>      s/error/counter (Riana)
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 5e294e9f8f99..28123f08e513 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -156,6 +156,24 @@ static inline const char *comp_to_str(u8 component)
>   	return xe_ras_components[component];
>   }
>   
> +static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
> +{
> +	u8 severity = counter->common.severity;
> +	u8 component = counter->common.component;
> +
> +	if (!in_range(severity, XE_RAS_SEV_NOT_SUPPORTED + 1, XE_RAS_SEV_MAX - 1)) {
> +		xe_err(xe, "sysctrl: unexpected severity %u\n", severity);
> +		return false;
> +	}
> +
> +	if (!in_range(component, XE_RAS_COMP_NOT_SUPPORTED + 1, XE_RAS_COMP_MAX - 1)) {
> +		xe_err(xe, "sysctrl: unexpected component %u\n", component);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>   {
>   	struct pci_dev *vsp;
> @@ -327,6 +345,9 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   		severity = errors[id].common.severity;
>   		component = errors[id].common.component;
>   
> +		if (!ras_counter_is_valid(xe, &errors[id]))
> +			continue;
> +
>   		xe_warn(xe, "[RAS]: %s %s detected\n",
>   			comp_to_str(component), sev_to_str(severity));
>   	}
> @@ -358,6 +379,9 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
>   		return -EIO;
>   	}
>   
> +	if (!ras_counter_is_valid(xe, &response.counter))
> +		return -EBADMSG;
> +
>   	common = &response.counter.common;
>   	*value = response.value;
>   
> @@ -422,6 +446,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			component = arr->counter.common.component;
>   			severity = arr->counter.common.severity;
>   
> +			if (!ras_counter_is_valid(xe, &arr->counter))
> +				continue;
> +
>   			xe_info(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
>   				sev_to_str(severity));
>   
> @@ -532,6 +559,9 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>   
>   	counter = &response.counter;
>   
> +	if (!ras_counter_is_valid(xe, counter))
> +		return -EBADMSG;
> +
>   	xe_dbg(xe, "[RAS]: clear counter for %s %s\n", comp_to_str(counter->common.component),
>   	       sev_to_str(counter->common.severity));
>   
