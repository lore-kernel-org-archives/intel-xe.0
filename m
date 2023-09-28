Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4A6E732E7
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 16:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CB310E697;
	Thu, 28 Sep 2023 16:41:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7439310E697
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 16:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695919298; x=1727455298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pIPvx6Af1lNfzO1ijAzB8hhJbVTbaJBQRsUwl28LXQc=;
 b=a4SM6Ul72cOGySVwmbZNI+VEY0YFAenwWCcUx+BgqaOTDshME1voWIgU
 2xQbTu3OUIJ4cdQEEtU5BigpIat4fH7tCfUyuhU2m3Q3INyU4o0cwSBWg
 aPAc4OPO0g4X1R3sFIj4kLLDCOFJeG9HL7Pb3Lthz92C/JdhUYdC59Dp7
 Ftf8gbhPgRv6gTb9+//7PeeY92YhlDAZITLzXIGaMZN78H/tgWv69jxrr
 flXe3wkq4hEuhQlH3500UV7r9bqu05t8733aegmr6qpUH8cBPYWKHBwRK
 VJEFQqlmMto00eKPg6Mjjhi+m2Xkqytshm8ntphW218g+Fz3TfGkRTS7d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="719807"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="719807"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 09:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="726292042"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="726292042"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 09:41:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 09:41:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 09:41:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 09:41:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 09:41:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkHxWTwQtV0iSZ6abyPaFAjpVJG3yDwQbWDNO4GPbhcJ9Y2FUE2m00oN8OkbVOXZxWLaDuS59dCAiCnYDuLGcEkbf82fXtEjIbdOSc5DyKwg74huSlwdV9321OA3v6RhRofui+m/FLUUjZHwpw04arSkmqwF/J3stUAxYvSMT5lZdB90GIFVM6nV/WSpcthbWtayB05je0wVDKxAivQcO2QYfOjoK+k7j9YHC1RLU9NmCZdRwsZCwTSwpgbsBnlZ1xIouN2q9kfRg6pLjUj4lXBpnKYfLFYsTs2AN7mdaHEE4gqaGmsLznka6uFyhQWISJg51M+CEO5VerV5Fvxxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISuMe6fl3Lln8SNoF6d2lBkHJ4/eOVGXYMNKfs0OScc=;
 b=Sbs3OgWenLajaGQrHwVEOzx+f9WddSCaR3/ALO3uGkncWstlxfhzjer0CP2XLxlO4TRe39SwF+vuTWUL3ViCDbNRcB2sIzKLm0bHzrQ5XwAFrmLsY3j6MNEdUF5UbFwuIHrDRx0P5wQ2hiZcxNUeIE0CJx0FE2neluspWaaNnc71YXJZurExk0JtaboE9KMpe82T6N7hjVH48knpungNfBhqnitdJqo/S5OensaPxkY9GRzpS81nejLpAFQ3d6bWXZRKS/38TuoU+6kvR34ODM9Gekg23H8oVKP/O/KcNXZEDJvwMo9nIfuIVV5HjPlTSKK0Fz1SS4DEHrTNs/pegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Thu, 28 Sep
 2023 16:41:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 16:41:30 +0000
Date: Thu, 28 Sep 2023 11:41:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <e4g5olh7tuqc57454k75kvkawqfukl2mhrjemnnizuhnl4vvdl@ig7eej4w5br6>
References: <20230928100537.392675-7-matthew.auld@intel.com>
 <20230928100537.392675-8-matthew.auld@intel.com>
 <dbemahqf4yya7icjhcv47v34fqbfgl76rlyeordmno4dupfom2@66sdmkd6duor>
 <20230928163839.GH2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230928163839.GH2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:217::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 7711a2a6-b6ff-4136-6659-08dbc041c44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73tHHXMwzqKkpkdcPzw0u2tJ32uxU6P2zGgRdRnP8Z9+srejfTvX12MG5s36iG6MzuL8uexR7AErZCGQR6kj8z/o7i33XIhTwv40NqvXkfX5nQPt2OCS4Qg3KPRf4XlDCGVD21waJa2Nl/zQ/ip32hApCwGdEES/Yyp6Bi+3AkcvToFNUk0yZt+F/oMLWaT8OA3+/eaYtX4VGifqJm/HZUcJ5FUHjoOtH7JYvT3Cc9oRcns+rbVNMEhTBM7j7VYU7HDTbaYcgBidagD8VFQslxDQvMXHcRq06qP5lq/ceCvLRpWJLh+eO8MclfzVny2D8o0YQCinVwbnxH4T3nhGpq40alhAnr7iLi5n2806JweV8vuvxKI+VvF4Z6uQ8jGenvzMESUJkOuMK0Lv//ni3qbhe7xXYshZ0y6fOVtPxjBVVzLob+6GK7dI4CBNokZY/E6PBlsLVCueVII0Ua43xT4ALW0bNY5TTNP7Z9ZddqKViwPn1iydJycbfdbSiCk/a3hoO+3IxAxUZwizjW3oZjPycMOvTsr/0+ClxRbe+3raKI0E2mjQ54CuxnxooQIs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(366004)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6512007)(9686003)(6486002)(6666004)(4326008)(6862004)(41300700001)(2906002)(5660300002)(8676002)(8936002)(316002)(33716001)(6636002)(66476007)(82960400001)(38100700002)(6506007)(478600001)(86362001)(66946007)(83380400001)(66556008)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LlXwtVBALWMpwRxbOZqYCQrwyiey3OiQNgIt2vj2gf5ARbV2UHjJZaMTtJJ6?=
 =?us-ascii?Q?SItwsxHfQ+ajZLrS6ydh1HvVAcRqZ4nG5/JezixLi7SdsxBSesrn+PfrUgIy?=
 =?us-ascii?Q?ZiyWXPIPSAyfoLmx5Hg/4/8JPjYCRNqRM8qeKHR9jKSsybweewtA8Zcee2Kv?=
 =?us-ascii?Q?rahzwH2CMUJ4HGGPNESgeFbE2L7Gs5xPm+UccfwHTqONUUl6BHTP2UgzLOBj?=
 =?us-ascii?Q?Ifll666FADa+ZbSwYDDG3Xc8DB3zzBts4x9CTE5C5PGoXmA4HiObgRYNT9nD?=
 =?us-ascii?Q?nsYMyhnBQnOtqLjvYyvY+kEOaB9DjPhWuN/wIOfkYr6OA2zhjenWprgUwXIn?=
 =?us-ascii?Q?wj5K7k8BXF8qPr7IwKaG/xH7QZF10RNzqteWz97UFiGVSB2Wue0vdGUCrf+I?=
 =?us-ascii?Q?2TFrw767Qc/s6S/gikHJ/wRaxzEM6OfeV3Exs/+ZEouHk9BZDR9ddfJHR9fi?=
 =?us-ascii?Q?IIU8iaNuB0ldF8jqp9eW75HnUvTpI9rtLHBnZ3d2gWUNV2v7y9YEVF/rnCjf?=
 =?us-ascii?Q?Gpj8QxRXtEcRuvErQtptHoRYahYE4VDkV3ryBTBfsE2Ve2VPiMxdahRciLOa?=
 =?us-ascii?Q?3rU1i4ooce/qf21LkzOfVQwUwONTRYnTh3qhuZrBDphsaMvFxZIpqQh/0hKF?=
 =?us-ascii?Q?sJFLgNYFeS2+27BdWeVhDaVCR/lZbr0pLeRGyb/KpBwj/YAI4hsX5HOGTYQ7?=
 =?us-ascii?Q?6aMl68xSRHwa/hQStWzqtdDE69tMq5QAE6+26A6c3c0dAkN7NpQ1pvvcxBG8?=
 =?us-ascii?Q?xTeLoD4xzQehXhyY1Dtus0iSM+pgWQIHxfmwHpUQGqa/xw8oaI6qq8QDnmYt?=
 =?us-ascii?Q?e+QBryTuez1rKGfd/R31Y+QO1Za8sxjyKEuy5HB0ws3Rd7i1cHCP9wSP5Zpo?=
 =?us-ascii?Q?t4nbpFe/W14zp8ltirBlQP7YMgwAzRRV85k7Tk9VGlaX56xUdkyWuw69cD9b?=
 =?us-ascii?Q?cY6DR04fMD0V+hU0hZiclu1dGf55eQmPcgMEb31/vx6eEy/Lvux5w+lQNIEX?=
 =?us-ascii?Q?zzqDWEmSvUezFhNmzswCaWHgO6uo7mtGgKD1rmYWv3Xyh68fBdqsgenDo0ba?=
 =?us-ascii?Q?mSzElCthm/RSko9UNGPJv1Z5eFe61iC8FbuJfaEI/JkrsVCnAo7+AbwB0RQ8?=
 =?us-ascii?Q?0pBqpPekscI8IGB0PY6xSdv9deH/gTeDFUXivBaxt+7IBEy5syqNpdCE4IVf?=
 =?us-ascii?Q?+nr+lhnFrexKS+tLY1CgHR2ggnM2AYE0lzCJIFlD9s/suFiMfLWu4FK764uf?=
 =?us-ascii?Q?hsuNc5DXBlPx7TOxB7/S4ZHcaw/V7VvJwh0MBcfuJs7EYs1EDcjyxojbqEt8?=
 =?us-ascii?Q?e9SlNtzbAtW0jl/hiMp/mpFPAy8eWPXGqufx0bxYfotHvhDJU7pYZBOLmSYI?=
 =?us-ascii?Q?4kL6YoQXhvOH3lj4Dt2oG2p6us7JmbOdskWmTY2bjeBZIxQTQXY4ubH5XjA5?=
 =?us-ascii?Q?a+ttbae9ue8eRHfTG6Felh+w07aHmJVH7eteJ+/YAp5MPIAN8t5asqaL6ye8?=
 =?us-ascii?Q?Tz8co2me45vPSaEmW4ypFgEFgrYtQnUCsRieG7Sp8Ip/jNIYtNNKNU4rAEzd?=
 =?us-ascii?Q?DLimwD/nZ9meZ+a7wigQRGndWaMmaknLbhjULUbSIUdcwFkXYQlSwLrrskyK?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7711a2a6-b6ff-4136-6659-08dbc041c44e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 16:41:30.3715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAsqGQELP7AI6QRxPLcsybA7N4OpzIjSkRURE8A9i25eXhRQSW7UuIaMteftID7fmfYRqd3GQpfhLqKx1jLVEbgkduSQgoHoR/DxPdKB3CA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 1/5] drm/xe/pat: trim the xelp PAT table
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
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 09:38:39AM -0700, Matt Roper wrote:
>On Thu, Sep 28, 2023 at 08:04:18AM -0500, Lucas De Marchi wrote:
>> On Thu, Sep 28, 2023 at 11:05:39AM +0100, Matthew Auld wrote:
>> > We don't seem to use the 4-7 pat indexes, even though they are defined
>> > by the HW. In the next patch userspace will be able to directly set the
>> > pat_index as part of vm_bind and we don't want to allow setting 4-7.
>> > Simplest is to just ignore them here.
>>
>> But why do we want to leave them in un-programmed state? Wouldn't it be
>> more future-proof we we program them to something like UC?
>
>By reducing the table here, we prevent these indices from being used by
>the uapi, so it's impossible for userspace to ask for them.  PAT only
>gets used through the uapi and can't be specified inside instructions
>like MOCS can.
>
>Also, even if we did think there was some way for userspace to get
>around us and accidentally utilize these, the hardware defaults are
>already set the way we want (maximal caching).  Maximal caching is also
>the strategy we use for uninitialized MOCS entries because the
>expectation is that userspace is a bit less likely to see a regression
>if unused entries become used in the future and switch from more cached
>to less cached than they are if they change in the other direction.

ok, makes sense. Thanks for the explanation.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>> >
>> > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_pat.c | 4 ----
>> > 1 file changed, 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> > index 869aee64641f..36b79d675e54 100644
>> > --- a/drivers/gpu/drm/xe/xe_pat.c
>> > +++ b/drivers/gpu/drm/xe/xe_pat.c
>> > @@ -42,10 +42,6 @@ static const u32 xelp_pat_table[] = {
>> > 	[1] = XELP_PAT_WC,
>> > 	[2] = XELP_PAT_WT,
>> > 	[3] = XELP_PAT_UC,
>> > -	[4] = XELP_PAT_WB,
>> > -	[5] = XELP_PAT_WB,
>> > -	[6] = XELP_PAT_WB,
>> > -	[7] = XELP_PAT_WB,
>> > };
>> >
>> > static const u32 xehpc_pat_table[] = {
>> > --
>> > 2.41.0
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
