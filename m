Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF55C47077
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 00:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA29810E53F;
	Wed, 10 Jan 2024 00:48:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849F810E53F
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 00:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704847714; x=1736383714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Wq4XSiVNe85CVq/cSwr+IUlzYOy1hVS5OSQlwHvbrA=;
 b=KRDrO/+2bb1x11Cuue+IkRDb1KbVrgVwMe9bHP4Amq17t/s1wAgjhOhQ
 7fPur5t2EB7SXvIzNjFEJFG5EV/f780EXCLMkkPsXbnwvNjI3jiBwzE3e
 G1+Nkb7VACVba7un8CpeK86mOLL4wYkYe2heMnGID503kzG6K3ehR66Sd
 jF0vP2YbAe2DvovhB4umDMn4ZW74ndGG/OgVR3MsiEX1LPI2o3C7P9t+I
 +reySg1epn5Nz9rQMQpUbtMGIsGq0VGYQsMeYWhaGYxzPwBD06gFZsM3J
 Wysr4LWlum9wg/1t+didxAY1kTAwzovRnkuoZdQtkpdSZqbTh7Vpymwkm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="388806051"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="388806051"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 16:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="785426461"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="785426461"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 16:48:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 16:48:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 16:48:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 16:48:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 16:48:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOjAQj4/4oa7y1C7qehah69nZUWQhj2IOi/bG7EeUtGO6OKJNAyEDAXEvrHd+f9B9B/KDWBqWxMcr3NDRsekop2QrEF0zddPKev0cEc98ylqTx6BVTNqNaKppjdbZV5xGgGnTaNwNW0gnpDzKGhI620nG1tKnaBF3bW4+Uvr8PQ35POPtg5Ai5vs/lIjkFatps236uFypNu0CuZsuP86HFT+r1USkeup3mqp3dprbnIEFAwCtaDffy2Zi38yOF3FUcGnTf5acyfgomxVwHlle8kjTeoqgQnndn6IRNKc7m+TKfw/8SaNkk4u8+Xov05xAHZj8v6Cfk0nqT0VhTXUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCPmjnA5Ks6S2IMOvAu3LWiY8E+fmGCuU5O74vPR4/g=;
 b=JJByw7ZzuYsUds+pok0Q9Bf33oK6ZqqZ/u3SGh+n/lHwjG4bVap/oeljxWv0ykQN3wy+CT00OlixaN6BWL1l82qKCovopxusGeoqjYom04ZJmgdVABlqq08HBUD4u496wSxWRQ0vW5Hh5nw1sZv5PI6O65tfbedcJOZQrS2YjknCAV0PG3giggeUdgUyL1EebjKLM9I23XZL+1+/iRWTtEi3K5DCEThGCnr+deawbY4WQetQKN8ShdBsF66fZScgq6VcZ+k591JdiZE7qsgLEGvm+9i2oPnhQ0MTWUnu8a1uvcFnwCn83cZ+sVPbGxfnd88OVzSZ2T2FgSI027+CFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 00:48:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 00:48:31 +0000
Date: Wed, 10 Jan 2024 00:47:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: Fix arguments passed to relay G2H handlers
Message-ID: <ZZ3pGXZiuIWo+N4Y@DUT025-TGLU.fm.intel.com>
References: <20240109230015.365-1-michal.wajdeczko@intel.com>
 <20240109230015.365-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240109230015.365-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: d062f80f-24e8-402f-4bd5-08dc1175de20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z/xkDrwhyPI5mzB7OSPE9kB+SNv9s2D4Oh54Sl4lo8XnL3pN4rm74xVfuhi5R7vrzJXFO9ytkN/WuYsPQRaYpbecpdkstHQPk9JqNfDij6Ftnjj/sVEfcdWiyXTIJCaS3YfJC3REYC2zQriEHfHFXrdJEHnE0QHjqXjcQszME07h1y9MeWcUGZJqdUtx1CKxtWo+9gFFMvhu3VWc+035BvGpgVZi31Qm0/tR49ef3/+ePWIeroeLZfFCtYxRiMzqCfWY2fZTCpPpZSLIGwYzPg+F9s1ozo2KOkECM3VKIQ0cZwuRuRtxsGQpc8gbU+zfwffPbkuWZjwt02WzARxxCmkYFRKZ8KoLT+tfbFMiH6vq816mGVeeh1VG+/J8wogVAqpXz+1fQlSyTnZ77s8rp9KZ3FwmfzZ7NhRg5YQEPYkseL4Z3sjN7fHp/cTFU54jUhLRk34KyEBte7clwIriRt25Xha4MFGppS/nh5jjpUmKnaBzceUApN4mTNcbXxQv8reSw/5aAyGtzPgsK4qF/kokbOa/wvTJPPSCIvG+yM+YddMJ1vZqAEGnpPh8pK1WQZaMx8b0C5VbaqAyFjoER2cc/q25xCL8+CJJfvF2Bg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(39860400002)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6486002)(2906002)(41300700001)(5660300002)(8676002)(38100700002)(316002)(8936002)(66946007)(66476007)(66556008)(44832011)(4326008)(6636002)(6666004)(83380400001)(6506007)(6512007)(86362001)(6862004)(82960400001)(478600001)(26005)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hGd1rX+CVHMnH/T+WZFyQGYfHoFbuRz03mpOSdCzag8KjOZ3tMqMP570knSp?=
 =?us-ascii?Q?tT8dt3sOLRLlcU4WjhXIZ5tTDy0bNI18CT9AsGXB0QvrUJ6t2IwSxB7u5bes?=
 =?us-ascii?Q?Sql69JKhUUwUX0M6pvsaL1BnRxaPFjb5506zdS1+2VS96YrJdx6aQ8zgKjV9?=
 =?us-ascii?Q?Cp+timVFczL0zDoxQbbdpETCBCblfSEFvew5wEsAVNV/9gfky6tJX3KDktri?=
 =?us-ascii?Q?M6ro3RxOKpxnlCQrfXnmVSRPlSDeezI1voEwT/u6EDFjEqGVZdJJeOtanTkZ?=
 =?us-ascii?Q?V7CjJAikoz0Kec6RZhromQbRYiPFI9qd+aLBIn++Yp8SzlQQyjBhHRoX1iNO?=
 =?us-ascii?Q?R4QId7mlt4yLCZbaPTJZwTiHdGjtxZBQFBwRO5cYbKdX0HvaSjciGgkGk6GA?=
 =?us-ascii?Q?QLniOXc+f48wQnrd+KJA8489m55UYqfu3Vt2H9fN4Ng8ndzfbL6fWyVZ++Sj?=
 =?us-ascii?Q?PIAE+I7lT9oVpjq+ebLdzTbLLMcUQp3EiHLlEvG/cfL5C/SWCC/pZ3gQbyAl?=
 =?us-ascii?Q?r4sbz1OwImh4VvvRbGRCOoh9q7eWNZhipOq+z7t7g7+t2b0KExE1o57l88RW?=
 =?us-ascii?Q?qFBjvDstUWqYTmt+olrVKuonK4FEtcAKvty2+q1OtmysWX83wiaSQ+Rj+Z3/?=
 =?us-ascii?Q?58etBM7JWEVtOItM4JXKoRlt9O25WD+28Q3ZqGsvagdqXfI9DjywsP3H1nxM?=
 =?us-ascii?Q?Xr4JicMaMPIZed6mH0OIcSH5gvV4fk34U8QOJPjESZ1caQRDnf1VCyCvCc3e?=
 =?us-ascii?Q?egizcSs2hKuZsoWDR4FLKZw+nn8iB58B18Y5glnz8tH2Xmd+H4+XPtZWcUpl?=
 =?us-ascii?Q?bKfJNmF6WQ1ClHdVlemXo3yqF0DsH0b7fKq/mrljqCkBCt59nEUPv9sSTu5O?=
 =?us-ascii?Q?HiRnPNBjBB9Tv0prSDe6dnjo2gUkqRE6ncl0D43uDzDrvFFc/L3j6oGeN9qc?=
 =?us-ascii?Q?SEsDnpDAnUxQOCCGqbdS94m70E+ax/aXhVfSx7agNUoIOsPB2TfmlIIoM9kz?=
 =?us-ascii?Q?8i3apGuYUl825pIqj5PvGvNzyNjEbPVRNAK4zXszAFPTLbbRn3H2qDCDovfH?=
 =?us-ascii?Q?hWXfahDcNAXEtZVCT8gig+iSu+UkDu05xNf+TCLd83nDG6K3Bf2vFlVxSG0B?=
 =?us-ascii?Q?S2wIpKJTfxPFX/t8vT8ZktoLeMmQVDYGErtab6cAGp6MKgwhcOLwQq9SQw2S?=
 =?us-ascii?Q?mC7XTLtu7wf1mujoV9gqaXvdh/yV5RTFpg1JeJKjiedvkjbAEATKx9ca+U9V?=
 =?us-ascii?Q?oiN6m0VGAkf2Hlp8h3ABBbkV6zAosqkWfCbOqXr9Ylq7YemYzpcqwOwMvQoo?=
 =?us-ascii?Q?Mzzmoqq5rLBJfR4SMBUNmC2Uvwl9f8BsKs8b+Gt92+4I5o8rB7gCiPY7Y06k?=
 =?us-ascii?Q?jyXxZxC4pfwmtxVYtG80BdhqWwVwugg67LBS0Dstx0j+sfkWo9hV9+3h0w7Z?=
 =?us-ascii?Q?vsauGMBwGaPExkhTIqN2/3FErht42N7WQlu2EfSn4DDjL56xjKdVrAU8LLg/?=
 =?us-ascii?Q?2ZhySsOjLM8gSdy8o3WLMXVQRStuRJwfMvVZf93/TSfbyKMNNWZPD4w4KcwS?=
 =?us-ascii?Q?o07YGlDqQSUZ+h7xWl2XnrSgrQoieEs2eCuvyIXUOqHPv3dU8LN3CvelF5XU?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d062f80f-24e8-402f-4bd5-08dc1175de20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 00:48:31.6459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nd4I4/TZEFOkUrg03RFVC6RyP1Uk73IQvoETwDTVhNplw9vJXrB+NEGDAq0IuDdyw7qSYylYfckKaX4OeNedug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 04:00:15PM -0700, Michal Wajdeczko wrote:
> By default CT code was passing just payload of th G2H event/request
> message, while Relay code expects full G2H message including HXG
> header which contains DATA0 field. Fix that.
> 
> Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9d1d855da229..721564dbfda6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -975,10 +975,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *hxg, u32 len)
>  							   adj_len);
>  		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> -		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
> +		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, len);

Should we change this function definition:

int xe_guc_relay_process_guc2pf(struct xe_guc_relay *relay, const u32 *msg, u32 len)
->
int xe_guc_relay_process_guc2pf(struct xe_guc_relay *relay, const u32 *hxg, u32 len)

>  		break;
>  	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
> -		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
> +		ret = xe_guc_relay_process_guc2vf(&guc->relay, hxg, len);

Same here?

Fix itself LGTM.

Matt

>  		break;
>  	default:
>  		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
> -- 
> 2.25.1
> 
