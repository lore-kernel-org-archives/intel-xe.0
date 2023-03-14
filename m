Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CC4C7618B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 21:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AF210E2CC;
	Tue, 14 Mar 2023 21:35:45 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C4010E8CC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 21:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678829743; x=1710365743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aFFd7AWWNqeTUgzZPLpqxg1aQPtsjgk9bkT/HQydHZg=;
 b=MKvJMpDh0Rq+olW7hgOUiqCU/lfIg1ScOHPzjlHyz21JcO8Q7YX6Dmfa
 LE0ilZMay6HYSUZChQBebYrFSfw5bIVWQY0GWXt98KuThiN8KrhgFHObf
 2HBLE5nFc96IUHqkTIkxCfQ8NWL0sf9ZYN+AyFFNQKXW26ZGzr2QvEj6l
 pwWAUBrddV0Y2PjUxV5g7rV3o6yzpWva8uzctCSAEyVLBagowalIDbWk4
 5Y9gQuSi8X/03NQ2kwjnAUTK94XaMbFo2bFe6a3Rk/nvNZxM5GySSzJh5
 09wrdInMjWHz4vGhnYowdNgk4A0x75zcYm/diYSUblbGJx9TDBVsUwJtn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339912387"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="339912387"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 14:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="656513119"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="656513119"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 14 Mar 2023 14:35:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 14:35:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 14:35:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 14:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAuGr4ROAIjiLsNBrloYoUeNVPR5b7YVLJLGG1Dd9HrMjd/Qqn/WUjvEGTToy4jTFk0qUmz70wR6gCo62kWts7xyde/qUNG7kYuMGyBDn7W049yPzOOWpNwbzcfekXH9RmJyeruVvzf4asimXbdlhKVSR/iY0HnZ5BUmTNLinSX4AZK+yaMF3KeBX6a+Gyp1Lx7WAqiRWnUNzZNAsOSh+kZqRcSpmBHH5nqWSnO8g2WzVqvWs7cS3dKtf+RSG7Pfe1y5ilHfcCIi1s3br5Wyxmc+TLT+IXiCmCDDCZ1S0bSTkG8/r9zmKva4WeGrMvNEWtNRONVtTfY4icNFsn0dqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcVW/2RQN61jPeItZg9TTtQEkWDTM5VECdaOzjVUrCM=;
 b=e9Hd4dw8TVi2z7tyFnob6WpcqnbN8zZOtiZKfxyhoKWLciA+PjUkDt6XsRVgsSA3b++UWCfPNCLc1qgWGeWhkwbj78I7QSQX6C99sYknT/UcQe6Im34RVax3ax+aldG6eYJIY0emjfhQPukAFT0X31ESSMJNlhMn10RPUdzBNhbsYnhSFFPW0CMLQAu/dH7XkMTULTfutOtRtv3Km5aTIoDoqU1WMnefLPVFOUJIm5wSdGeW46TPG/P3d/adqjcycz1tBrSErMu/S3205D5P29BeBXLMt4+mQUHrPCi514/9Ro2XHowxI4oGLsBReUsX+RweN7HARhux14O60UG/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 21:35:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Tue, 14 Mar 2023
 21:35:40 +0000
Date: Tue, 14 Mar 2023 14:35:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230314213538.j3pu4dras5geerio@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230309122133.486044-1-jani.nikula@intel.com>
 <20230309173734.GA3408186@mdroper-desk1.amr.corp.intel.com>
 <20230314002437.baxfkjubclrc272a@ldmartin-desk2.lan>
 <87a60f7hd0.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87a60f7hd0.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fad6d1-8ded-4d05-b7d3-08db24d40eac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLSO7eIrYOl7xRrEz0gpDpetQTKIEY1HCYl4ioryIkI6Y4tGBnXMJ0cf42usKEkAeRDQMMOXvlk1cprqWpKBAwW2az6cNFXc2SXKapSngtNtnoh64wwPNUjCOxvItLc/m/3IDt5gXKlgdsp+071Ffa0yxTmoSh4eUjmkOR/as0Q5BPTQUVdHWCyfCjqsgYAnUFgllANgCXo6/PIMuQWd3Vde1IfIv4aHH6JW3EjfrpJhuVrdIr9cBJEFmUsWooJTJHYWj/PJBIX7VBqlGoR3hoSF5CZyV5f2hiiU0lsnW47F+ZXZwbgZpjavmlvaeC2Im961D9JMVsx9DavwFtlflx0/6/5Ag7Y8GW4kx2PPocEVzMEuvxdACarjlNDolWV8Jb4Z7YA7wY3b/57cv69hp0RK2LQfLNDF7hW7cVNBigjVJaH+ErM866kALDcf/3DmbzrSQEdsZvhVcD1C6zb/4lsY/IUCyw7jwrk8Rko0ehcuS9wCQK4LonUymThur6vsgIBdRWXeMeOBi5ocObkygYxNYKhMSUyclNh32MUejCY6t+bH+KjiEEjDWSN87kIn1p+V5Nn3NIJkluMHTl0nGCFej/RA7M5pLOhzgpa7lkPhBjEhxzZC3HA4D+c5n9g5jpJgskGy+Rc8NJK+6WQ6fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(5660300002)(83380400001)(8676002)(478600001)(1076003)(26005)(6486002)(6512007)(66556008)(4326008)(316002)(41300700001)(6862004)(66476007)(66946007)(8936002)(186003)(86362001)(6636002)(38100700002)(6506007)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GQjECmDPlNVJEbHEfHI6rfJBvUiM79zfJCUHnesFQ+0LFCWvC7KVBhq5jIQU?=
 =?us-ascii?Q?OI6gvMfCEqfnAhuS816lHlgmlPHt7OmQaCvg4MDz/FPQULoFh1geMtVJVNZV?=
 =?us-ascii?Q?rSvS0Ry3wdSoO4b0+dJQYkQsbzID9RE7jNaLlCrd9Ls0dNEpAWLHSsbZU/rk?=
 =?us-ascii?Q?vaKC3s8UpXEPXBNqQ5BCZT+IXgMFB0SS6Z5BAHtGeymZZoDgyvNCfGWV2NGB?=
 =?us-ascii?Q?MTAu4cQSBUT+VSzdMD2nAl4S8FmBen3juRzoau5k4iDmmmjGLqn/jLn4ECgZ?=
 =?us-ascii?Q?Y1oaPCRJqRj9zrPvvPpQYP4V8g7efoyVDTkqq3lUdQCbknoO2YHWqwyskuA+?=
 =?us-ascii?Q?dMx9fNWdrdCibNDNdaph3CRJuLJeVzVSPdz60+MLMSlok7AJscmNWiLyr1nY?=
 =?us-ascii?Q?iO7Ci1e5AeL22dVDyGXpAHTMpa0z+Yh2fOIwjjaewq+32Z4CKA4FYl6zHox4?=
 =?us-ascii?Q?hrYstdr1eF/MQQp9JCsHGVNOiKM/NduNEXdXrRcmERCJqBROmcMNBZwPNqhX?=
 =?us-ascii?Q?Jv8LVn6s6y1FqY41OEQIt1Hvr1o0zbrQHYiEpJuTIxTq+Wi3/PDCssjXCUpr?=
 =?us-ascii?Q?7wWxkP10jU0qy95Y3a2bHyAISlU1/FX7R4/KyIBDi6y1ajyW2zX4G/Rzz60T?=
 =?us-ascii?Q?uhcyZzwrijHZMbUSDujb0UR0sR3vnu38FdgGOeW6y1KMUKA7rUpI0kY2o1U0?=
 =?us-ascii?Q?hS/z1FdpEXhAhNl3DtxlEFORO8nmax+AOojwz9gC7Czr0OZ1z5vdVlAuDIQB?=
 =?us-ascii?Q?VO3em/qO/gTK6OomKsEMDTkVmhuWSBF7V4HkYIrWulavMS8xfFVKQJ/uKb4q?=
 =?us-ascii?Q?PySxiAAgvBfIRi5ZxRoY5vZaApFC73UO6v4cjhhE8Tpi+fhdKTaUvQhpW3gv?=
 =?us-ascii?Q?g+LVRzjmPCQwQI813M42kAsJJnJkkkxxVoiZNPhccXRPvh8O28x46yKOzoEW?=
 =?us-ascii?Q?4RRpkGo3td+gXelsBMWAqow7dInBS+tGzwo/Q6c2aP231khBfHX46cTegZ2y?=
 =?us-ascii?Q?XO4k/KUeR1nHovrfJZ5mOJBGmCyfCGsJP0KWZjCr0nFtd3kJl8b/nMJobjWA?=
 =?us-ascii?Q?/Fc3EbU2fewG9Ktv15R/62WOswNQ4ReuFMeeHogFGAyBmoxpkIYVeus9gde6?=
 =?us-ascii?Q?w6P0jAMWUBhlLcAH6M1E+kXGINPe3T4E0ecDJ2S0t+/CjJZcSltdMqMh1nBO?=
 =?us-ascii?Q?Vk21QXz9HxEVAUR5RWyqLnFuDZ1H5PHcVl+nBMX0K1V38ZNpNDNIJuA4pzuE?=
 =?us-ascii?Q?z76uP7Nc90pBvG2Jh6disVcvm/xaMGXt7gkJ37pArnqQEtqhSZT+8VHnJCvT?=
 =?us-ascii?Q?JtEX74hyvvItZHeRJ9Q850SAPIg393l+3hJrM1m9Y0jIGO8Ml5Y80hsuKtJO?=
 =?us-ascii?Q?WPoWq+huW7f1f+hXIjJiEfyHSCDUIVYBl+3Prd1hNbuzxRGZOr0hqghiRqFQ?=
 =?us-ascii?Q?fDT3H0Q8j464mVwOZK52B5iSw2liJXcO5vTj7cXJy9rDORx8LBB7+fH/I+RJ?=
 =?us-ascii?Q?y1C6QPwqszkwjOHjaGUNdq0jbh2Z/1cwOYwZ1/wP5zaKBV3hsLVC1Euimq+F?=
 =?us-ascii?Q?1/my3+Qc1X/7U/nrozOyfe+sV2o5yobh7NqNwhGAMZXr6AB9XbgTvKqweCW0?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fad6d1-8ded-4d05-b7d3-08db24d40eac
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 21:35:40.4048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svRPw5Vsj4Paolh77f0tNGxYM7DpZrPYESitE6YKep9p/tFQIqV3ocGr1mPj1XzjeShKO9xq8S89WzqzBfYt2hgDKRX07K22pu4pBCpx8zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5894
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/irq: the irq handler local variable
 need not be static
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 12:32:59PM +0200, Jani Nikula wrote:
>On Mon, 13 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Thu, Mar 09, 2023 at 09:37:34AM -0800, Matt Roper wrote:
>>>On Thu, Mar 09, 2023 at 02:21:33PM +0200, Jani Nikula wrote:
>>>> It's just a local variable.
>>>>
>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> but the commit message should probably say 's/need/should/'. Setting it
>> as static pretty much breaks setups with 2 devices like TGL + DG2.
>
>Mmmh, only if the probe races between xe_irq_install() calls for the two
>devices. Can the same driver probe two devices in parallel?

true, I don't think currently it will ever be in parallel since 
we are tying the bind to the module load. We could stimulate
a race by doing the bind separately, but even then the window for
the race is just a few instructions.

When I read this commit I was under the impression that whatever got set
in this variable would end up being used later. Checking again, it's
only used inside the xe_irq_install to call directly.

So I'm fine with the current message and my r-b stands.

thanks
Lucas De Marchi

>
>BR,
>Jani.
>
>
>>
>> Lucas De Marchi
>>
>>>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>> index ae2f65c00fa6..529b42d9c9af 100644
>>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>>> @@ -529,7 +529,7 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
>>>>  int xe_irq_install(struct xe_device *xe)
>>>>  {
>>>>  	int irq = to_pci_dev(xe->drm.dev)->irq;
>>>> -	static irq_handler_t irq_handler;
>>>> +	irq_handler_t irq_handler;
>>>>  	int err;
>>>>
>>>>  	irq_handler = xe_irq_handler(xe);
>>>> --
>>>> 2.39.1
>>>>
>>>
>>>--
>>>Matt Roper
>>>Graphics Software Engineer
>>>Linux GPU Platform Enablement
>>>Intel Corporation
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
