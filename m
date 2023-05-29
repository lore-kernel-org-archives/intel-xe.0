Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989F4C7EE29
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 13:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6772010E28C;
	Mon, 29 May 2023 13:43:11 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5352910E28C
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685367789; x=1716903789;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=iGx3GBAdIj0Qffy8EQhEnxd2ZxQz8qPdC+nPanNiQzc=;
 b=dsfRkPQq0AMjwONWJozC56zyYLFZj+AjAag2hBCLWoLIbYYV4I11B5jf
 G+rWsn1BeEIJMAB9xGiKU+Iuf+dqygbor3N2jOFOY1wtXbcJLGCzXXhI3
 mspNaoqEPqwLfwNQq5RNtdNiS//Kt8MpwrPT/9CWy+pY+hy0YM6nJATX+
 bENonaa0vYQGbyyUqaAx2zyk3vYklUbi3sKZWSP9StW6/ZAy48uh/dRns
 upAK57E3GZu85HiRbtVuKQhjqliGTipt/9aG/GBvFgHlNu59WwJ6bbFwI
 0dgBmOg8CQF4IJQI7TURgh2jxmi/MaNxNL3CmTMuQ0VH5wzP28cAKV/qi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357085415"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="357085415"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 06:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683589658"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="683589658"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 29 May 2023 06:43:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 06:43:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 06:43:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 06:43:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 06:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsIHhn/fM7GYNXoD+GirJiyCzIv/aNeDTyPjajHWUSTBdsGPR+2Oehi/LvZ938NW2RyC0XZDm4OfjtYN5Y8V8tNHAE05NxkW4sRWi/Qu1gskrDdrZIn0y0IM/of/3kD3FktqCONs6tJhskdBAt0RBczV4ZbYBTTygC5GoOudLbgNSQIizIZUTHUtHAFMVG1EUVpP7u0I911id5JYqmEXBPJ/VzFK7L8xSPRNQqGATKHtAgqegkIhw0pt9vdD8Dp0eQnsHwt2jyCNRTRpsvSHfYNq3lHccbthMOldU4+3tCudVWBdPmq4oNkJp0tZ4QK6jdNtaEikrSYWtqdDlTt6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0Z1eJEK02+6k3waxqH+aRP1BhkaHZKTaLckZnT3gTw=;
 b=T2dvZA/SoY+0guIrBJ2ydeNY1cRjFRQ/S4CdOA5ZPYhTexzyQBAn8/pfytadHICcXBcmckqeWFX8ptoPl98nYCFXAhyacmvWZui2NmVdnoq6td0HRtBb0Y3+XTgwcdDq0WKdN60esgmXVX8JC5cvpaYZI4exQquqUy38n/qK1j0TEdEKVFT2fi8MuFcMVTpQJOs2WXuWFd2an/uTDfyG2LnTorUkqm2Z6QNIrirovYF7/kQK/IQ80niO+oGHBrhfyM566g0eOIzwD7b38JDxC7hsB1DKkRfXdQvOpe67/5pqEZM4E/0OTuSOTTfYLBK3A+aHTeCxLBX7vXgBEg9T4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DM4PR11MB5375.namprd11.prod.outlook.com (2603:10b6:5:396::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 13:42:59 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 13:42:59 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230526214817.GL10045@mdroper-desk1.amr.corp.intel.com>
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
 <20230526004235.745730-3-gustavo.sousa@intel.com>
 <20230526214817.GL10045@mdroper-desk1.amr.corp.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Mon, 29 May 2023 10:42:51 -0300
Message-ID: <168536777154.1394.6316661432140990148@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::27) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DM4PR11MB5375:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a483897-438f-4cee-0a0f-08db604a9d43
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vkG6yxEHtGcaj80rH2v7JlHL3BBcGZaKAIeyUKwxj+5l9PGdx+8oOKuQ43UbFHe2DhNZoDU+BlkzO2hl9mllEA3PDp0/DoQU/LXWgAdSUP/vsemqNliEDF8fGhCyiIsJOqkr4WOn0MQA3oYjV7hB/dXhFq1rBY6Rim3Qla69ly8hOlx0bi0tVQpzK8KGOR8GOaS25lq5ZNgcSScKaKKlwgafgTUypodjqn8ZtAa2iLpAIiEJQPoa7OBPGeAl482wL6UrFrdpzL0CiSWWCOm++8GdUWnIpkFpscUmA9BN1EuIdEOMzKr/rvukNbitfvQciiZZHM6XaS2TbRZGu/PB2MeA72B7XVo0mdm8w4UdyyoNN/99EIkSs3kA06shG0KaAl/YcG9qBRqm/z+q4aj7P/KjZ4XsgUExmZxGJgktzfNdaODNc/jUJUrlM/J5HTAHFIsDof5bHEN2kMstdY+hnuafakiIz+hUARhTI1zvGSW4IHrHga5UougOZwslBo9199IRkdWXUOnRLaPhCzKcxscerjV3NQFRztPMvyxNEElcPP7GogZ1KBoS8TTQK1PA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199021)(6486002)(86362001)(41300700001)(33716001)(6636002)(4326008)(6666004)(316002)(66476007)(66556008)(66946007)(44832011)(107886003)(5660300002)(186003)(2906002)(9686003)(6506007)(6512007)(26005)(38100700002)(478600001)(54906003)(8676002)(82960400001)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWovVmQ4NDNVK2U3VG9jOFNRbU91SmxGcWUxWnJqRE14elNzQUZvYjBYejRo?=
 =?utf-8?B?Z2psNk1ESlgxdzFIaXpGZmgxRUNCV29mcXMzdVhUb21ncEpITU01akpWaXJp?=
 =?utf-8?B?Q2FSS1E2YnBHNys0Njc3bGlTMGVNYy93VXgweXJqOHdXeDNJelBnTDJlWC8v?=
 =?utf-8?B?WXJCSVo0MzZQSTcvVnVQalI2OVF2VTRYemZJWUw5WHFOOHJHUUVUY3dhT0Qy?=
 =?utf-8?B?SmdtdTF3d0cydTdqY3VyaUNvQUdhUHh2cFJLalNBYlVXUE1zbXUvYUVuLytZ?=
 =?utf-8?B?UkNPVUN0MUxwWi9QS3lrRDUvOEYxQkxjQzJGY3c4NHhmYUdVWTh1QTQwSGw3?=
 =?utf-8?B?aVJNZngwUUFsbkdCM2wxMXIra2FDY1RraVRLTWt6YnRUYmVqMDdmWXBMbDJa?=
 =?utf-8?B?VG1uM1FtNFJoUlFOdnNjZnNRRG9TUlhma0VmWmVkeU5PTmFIYm5vRTU2QU1O?=
 =?utf-8?B?YXFBRGpubjVUcmJhMHQyVmsrLysyOHlBSkxEZW9JS1RNUG1CM0tKQlJ0b3po?=
 =?utf-8?B?L3JrVG1BOGdlcEE1RFBVWUJSODJBaitpSzUwQnowYUFQYkhrZE4ycHBseStj?=
 =?utf-8?B?UzhwSnFxUVVQR2JWNjY5L3ozRy9mRnh2Q0FGcGpBdkllMVRMeU90MWZFeWlO?=
 =?utf-8?B?RlR6WVBsdTY4U1pNR2RQWkUvcUdFL3I5UlpwL1ZIeHVCUElFd3ZOMWxqMG5s?=
 =?utf-8?B?TEd5eFZKbkkxTThuWXlxWjQ4SVdJRFFZQytZSEI2S25zQjQxSjVjRVUrWlEy?=
 =?utf-8?B?cnBONzRpUElDdFdsTjNzZllKMUhkUG9VR3NONXJYVHNIZnRFci9JU3lHcjRR?=
 =?utf-8?B?Wm1aUHpSWlIrOEUwM3JtSnRSU0RkcXFlamhSbkc1elNFektJT2VVckw3bzNL?=
 =?utf-8?B?WTRlcGhzYjJiMmpuZy80OHM4RThIVzlsWnR3MGhtQkJiS1pJWWE1YkRrNk9V?=
 =?utf-8?B?QzF4ZnZnVlFPUi9Vb2pobGY4dm5DbW1LTmc4aHQxeHhxU2EybzZGdUNSem5a?=
 =?utf-8?B?QnZLVWpsTlZiWUJMc2JsZXdSOVNCcm8yMHN1QTRBeXZVUmVab0g2WWtGSFZV?=
 =?utf-8?B?TDlSVTQvYVJLSExJQ04vb1EzZFpKdU9teVk2eXB0b2o1MmNYV0hKb2hJRS9p?=
 =?utf-8?B?MkVTR00xVjFhMnhTeURXVWZ0dDZVaDJLVUgzMmNRZVVzbzRreElzT3lUbzE4?=
 =?utf-8?B?QTNLc1N6cjJlQTNJd0x5czEraVI4QmJnM3ZCeUtvcWcyemZFWTR0T3lxQnlj?=
 =?utf-8?B?S0lUQXA4eFJJb3RWNkRjMG9DUDlKSUtPYU9TOUpVMGVKZFpZOFlhUGJudUJT?=
 =?utf-8?B?ZTRlT0trME9vVkVJKy9JU0QvaE5xU3UzNm1RbzJtU1hZdkpLdU94YjAwcFRa?=
 =?utf-8?B?U1ZwQjRJSGtoWEpRVXhrRWFlM0Q5VUpPYSswQnZuMjZtMk9wMHYvVkU5Y0w0?=
 =?utf-8?B?UUViVi9zN3ZBaFFrb0ZvNUtFKy9HdHJ6RENuNHhpa3J6MlZ4M3VaNzJZQ1BS?=
 =?utf-8?B?UWNsWnVQTmdYQ2ZIdnVkbkk1a21JUWV6WHFyb29CRmpIVUlYbURwa2l4UUhH?=
 =?utf-8?B?aVk2WlZ3dnZqUUJvUGNVQzRXMlp3ZHpVVFhLRFVQZXdZeWhNbEx6TlZNVmhy?=
 =?utf-8?B?Z0FxOEpkZU10dTdqTWp2MDllYVpNS0dLa2ZZemU0U3hHd0kzZFRHb3E1TTlD?=
 =?utf-8?B?QzBpOFV2Y1Vidk5IUUhOMmRPK1doUTFCSVZkc2IrUFFSK1Z6VHpmVlVuVjNZ?=
 =?utf-8?B?c0hnR0k5RVJRaVlMNmJBdlRFdDQwMlhuTGFwNGlwTkxkQXZocktiOTZIVVJt?=
 =?utf-8?B?OGU1c0l2Mmc2K2FEalRWWmFnbStyVjJyVjFlelIvSlFZTE5IT2VxQ2p2VXQ3?=
 =?utf-8?B?TWNjZk1hQmVHRGVWY2NSeEVRNWNZTVZsSDBickFYRzd1clAxQlpic0x2bFpl?=
 =?utf-8?B?Q2xONUQvSC9Zd1FneXpQRUNybzVjT1BDb2NTL1hIQmdFOTJtaS9SZmhmNHhj?=
 =?utf-8?B?K0JhNlBRTjg4WFhqVC9DZC8vRG42T0Q1Z284dUw1MFBWLzM3ZmZoZURhK0ky?=
 =?utf-8?B?eUJiMjhwdHhaYnJ4NjJWOUthdUJaQ0kxei9xYThTdlVZQitOalpXMnpYQnUw?=
 =?utf-8?B?ZHRrY2o0RHBOVTVZbzdyS2JodzFtUWRNeGQ2eVBzMmtqUWYvaFJFYm5NZlBy?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a483897-438f-4cee-0a0f-08db604a9d43
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 13:42:58.7391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBNeMmX8jUTCkSzVr7E5A5sZtWnUA53qTIdq9RrDBSN1SSRld+Gv+lEQePv0NJbQ1MzQ8zZ/vna0tH7nO+Gr7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5375
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Replace DRM_ERROR() with pr_err()
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-26 18:48:17-03:00)
>On Thu, May 25, 2023 at 09:42:35PM -0300, Gustavo Sousa wrote:
>> The former has been deprecated in favor of the latter.
>
>It has?  I thought generally the goal has been to replace DRM_FOO() with
>drm_foo() (i.e., drm_err() in this case) because then you get nicer
>device-specific output.  Or when we're doing something GT-specific, we
>move to xe_gt_err() so that the useful information about which GT is
>automatically included.

That's what drm_print.h currently says:

  /* NOTE: this is deprecated in favor of pr_err(). */
  #define DRM_ERROR(fmt, ...)                                             \
          __drm_err(fmt, ##__VA_ARGS__)

But, yeah, I believe using pr_err() would be the case when we do not
have a drm_device at hand.

>
>It looks like xe_reg_sr_add() doesn't have a reference to a drm_device
>to use drm_err (I didn't check how hard it would be to plumb down to
>that point), but xe_vm_bind_ioctl() should be able to use drm_err() I
>think?

Hm... Yeah, that's right, we can easily use the drm_device reference in
xe_vm_bind_ioctl(). As for xe_reg_sr_add(), there is only one caller
(rtp_add_sr_entry()) and I believe we could have xe being passed as
argument - I do not think it is worth adding an xe member to struct
xe_reg_sr, at least not this time.

Thanks for the feedback! I'll send a v2.

--
Gustavo Sousa
