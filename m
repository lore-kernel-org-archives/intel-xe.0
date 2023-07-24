Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1851C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 12:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F3310E2E4;
	Mon, 24 Jul 2023 12:43:35 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF0B10E2E4
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690202613; x=1721738613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DcWbi6g5dHoWEegWEj8Rbu2pDbf0sb4DraMFF/6DPgI=;
 b=QuGfahPoTk64AZoOqiyuSvBJTNP6TLS3mi9XTJgHPyl3ALeNbdl+VNN1
 zpoeroCCwsUCV4QZyyWTwcaQy8BHU4dx1xveA1B8L9wthpfKGLFkxAnqn
 735vFVC9+l/F85hVuJls9p9ZfO+aHLC827zaWlD7DJP3DO8y48btuY6jY
 3jZg03KvjlWwUzQnDCNLnqSCGs1EM8hs40fX/WM1/HII50GApnUByGgEC
 7ZgYFglXMfHWZfUycKWX0FD6/bj4vUnXo05dKLM0w2PL5ud9JGJGR5ueq
 Cy1NkntzqYdbF8VvPiIGN48wQ/5A6TUMydpo304icig/60dCNlhJLdPSd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="366319940"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="366319940"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 05:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="899480337"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="899480337"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 24 Jul 2023 05:43:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 05:43:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 05:43:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 05:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoeLaSn28i9FqJ22pVa42dXIQfLAxzaTZZF1+SwreYPTNPcQirQG6ZB7hb+wt7sCR9zYd9fIgSFyUqHXb9/q5Ue008c2iN1Ue616q3f9hBFgjIopWjoKuRH7/4FlP/fuehqP1CZ8FFOSCdF7OW51+e9U6OMYbMhI/7e6dpvIQ3XY0VJLadjwzEq6YdWl0VmF7hvnjGgTc4Gxx6G7Uqfn7i8HQBk0zuHerDCdbWQX8BlBlHf++J6T0MoSwmkaD+DRIIhL4bLCSK0wP6VBiWFRm6g9vaM8ZuMJujskBN83kGjV9pwhC7wlF2UgG0jS9AD9MqN0JdMIdMCn/CLPLhfgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcWbi6g5dHoWEegWEj8Rbu2pDbf0sb4DraMFF/6DPgI=;
 b=bY5ehACcwdK+TGZtJestZPaGlUS8WVa3qsx231SI0EzWk1LZGKLiJy2IHVwPd15adx5jmS/TBbFhmOmI+FhRDiNn2uc0/a8Jx2SB/FWkQvgAPjnHt90RTwzf6/J/MpBZ3RudqBhkSQ7VoD6iO4H2grlcp9hbc0/XwhgM4waq/oOxRmCLxoBwSYYsdXUgIBS0uVGWUJPdc8MgQRJW852EIuVoR2SwvdJiM+lJMbEgs0sQthTI+8mW9uD4doBAGeb0i2SXbsL+xyJNLuqx7gs+4Xemu8tG/xMps86yXgUdzkES4kHJ1BGCb7GwFrT9JYPPi1ohz1lExB7GllzEobbwWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8176.namprd11.prod.outlook.com (2603:10b6:208:452::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 12:43:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 12:43:30 +0000
Date: Mon, 24 Jul 2023 09:43:24 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ojes27pyo7okvuw5qw4ddfru2szt3rji52gno5nclgpgoacop2@s4m4c5fjrvpf>
References: <20230721202144.269837-1-rodrigo.vivi@intel.com>
 <20230721202144.269837-4-rodrigo.vivi@intel.com>
 <0a4f11d54a1349b750a87d322c89e939ed6fc4e6.camel@intel.com>
 <ZL4wEOdDSEVA5yyl@fdugast-desk.home>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZL4wEOdDSEVA5yyl@fdugast-desk.home>
X-ClientProxiedBy: SJ0PR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:332::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 5586d99f-e505-4dde-e984-08db8c43951d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jse8FnPbbmI42HRYZfxcjiKZUBKtgH7rQn38TIqYk1WP4MMvY0f+K4pEVHtpAjosX88GJzLv51vePsN6gL2P/t8hpv88VPACC3bfz4V5mFCYAWsRsp8FVZtakKb4Hfkl2SjZ9VuEObhpoo6V7SDrERq0g8VsdG9IiYQUF9Dzsk0FYdwQHskamN+c+jFAw3jUvWEqH7pVX8/vfrkWkUSkPByXULqnGVTs4ESPPGGqkHqdxjY3fG5yVgyXUiZnQvTlWExwhVovv+DyJ2dmjrN4m1obV3CymWJg3g2pHRkaFKTkt5L6e+MdK3m2n0oiNuRIG4haE8kQ1w3K+x3BGeronFfuvNk9ZPmboHlDA3MQ0V1nbNTyPQuBJodL504QXyC4q4kkEzy2rKoqeXZJrOSXWAAjVZh6PAQARmR4G9N58ln62/9Sp2Cdxn8u0HT+8Y9cgzqlLwFPIrrQ6GgAaQ5kyKuYlmJBFF9QEz5xdWdQq5elaXJ3AMgaZ6PbosnN3Wzc9BqKu7R8weqX/X0xOz0ltFS0pVGqvNyyJfFhEEtxdyOG3extzvCp334iD2Ti0sMD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(83380400001)(33716001)(38100700002)(86362001)(82960400001)(54906003)(478600001)(2906002)(186003)(26005)(6506007)(6512007)(6666004)(6486002)(9686003)(8936002)(5660300002)(8676002)(6862004)(316002)(41300700001)(66476007)(66556008)(6636002)(4326008)(66946007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H6KKne75TNFUNbIrnKT3kWBtzILmcdF9J9nTKtCqxnVZD9ZcyNT7qmz6bx7G?=
 =?us-ascii?Q?HuJdsX5aYBOKi7hCPtbuj/SddzqEg2J846H0kjPLSszwxSJN8dF4DyvfC62x?=
 =?us-ascii?Q?a9NPEPilR4/vDDZaeJ/eWkegxUYiAzcfg6R9F+YMzehaya5Zll5S+vFdByAC?=
 =?us-ascii?Q?cUCX+ChGS02hGU2U+86HznzAEXmamj/VgNzoiwxVcFmJg442gqlMH9l1bVhg?=
 =?us-ascii?Q?1OMc2c01BCySp57Xxds6VeSerO3KMFslqG24WwLr0sNFWnMkohPxaQgNW44O?=
 =?us-ascii?Q?K9cKwMfN5R7vscsyXiw7QjWuIl96qVWuFUlsCLez6cPPemdaHp0pcgL3KT4U?=
 =?us-ascii?Q?0mvp3dw1uTCYzD75ArPqn/sfJO/6tqbPVgAIY6pKqhNSMs1faoSsScgtO5Va?=
 =?us-ascii?Q?kgzRI4wKoPDdjpst/8ur16vxIXtRNMCDz7C35Jh7ig6v+rSD4hZDQVsFH/31?=
 =?us-ascii?Q?oWbACIkRx9z1c/tqdyc/lfkxaPYJk50fMQpD/uNqX0OBXPHJ9CaEglybPd5m?=
 =?us-ascii?Q?VuYWaaoOzokXv5oXcbgi769oB2CCXY7G99PZ4jUW2I1TivbogyXAkW0ZnA29?=
 =?us-ascii?Q?fBCaKYKvFOQjRDmLCsdqCkrp9t/RW+niGr1raB782/rmokY6QyxPmGpYxXcF?=
 =?us-ascii?Q?qzRVdtoj+XqCzos02GUBFiZaXAeQxMiylm5z7vwf+2G9sskYndpDg7UVMcG8?=
 =?us-ascii?Q?JjYfPdYZvNLjUFdxHFhYG1tVQpOxyHdJzxfQCkUkb/8UswgdIfafVHO5SMGj?=
 =?us-ascii?Q?1KSeaiBnqdC83nFR4WV4cNiKArLt1kV6FVNO11dnA1Rj7l1QBJ24q+AHSydp?=
 =?us-ascii?Q?9cynwO5dZHOwvoe3El7sYuiyudPHixBGc0WjQ4oAQhu/YF82qjZw/3+FNdgz?=
 =?us-ascii?Q?WrdCurPPozlVWaOqqsRjq3dp0bWFE8yE+vRvi4FO9VaQAuLpgTNITmaDpL4p?=
 =?us-ascii?Q?R3dw/huUNhlynHfPEfliE/i0sPncc+TX9QinKHTg5O0ZVRaINiuQ+EE+OGNm?=
 =?us-ascii?Q?H3H+zLeQJDt9P7fA1CxFXKVojpc6+Nxu8f1jeLDahEgW8Pmay/0+HHANALGb?=
 =?us-ascii?Q?3L66P56XMeDk1kxTGpxhESlFs+7uqlbWE01CgZnT6HcXjZmiQyGAktvmvpI1?=
 =?us-ascii?Q?7mg3MKPXS7hhZKnWHabfcWWqKCnvodsPG5qUQB6iG0RfGSWm1fFfKYjhhr6O?=
 =?us-ascii?Q?8YKzp/HHv4SvRZ8J57PhPSTgM8I+kC7Q4U2fE4/xVc+OZeFtyzKGT8VRP2Du?=
 =?us-ascii?Q?Y0v76Mg3FSH7DdkfxONxuvv7zb5Gtgs7mBTDbOugbNyk/f5D5Qm7mC8AGt+n?=
 =?us-ascii?Q?xDZiD4IHqy3FeFgcXzFVeOYB43ey5V5IGdJERGknIQK0crAT8oD/mA84uKXR?=
 =?us-ascii?Q?wf0mefOyfqjXBTDYupi8F0hsNZwqkZKeJwEzGgOBUV3JnpSnRQGJME3A+k2o?=
 =?us-ascii?Q?+dAYOBJYXUHY3yjW6QmXfDGdXzKIa7SXGY1UKBaNOBtHfcaYBVesp2ybsz1X?=
 =?us-ascii?Q?7/uMcdnBxnOqEnGswMgkBBaq74xOB7QmaNND5205nFRboiwJ67boa6xnMfYf?=
 =?us-ascii?Q?mMyaEBJpUc+WZVYnEWq0suTiRMXwXmGxL8Wi24CNJah/2OvV0GygxhrHpkEk?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5586d99f-e505-4dde-e984-08db8c43951d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 12:43:30.0312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3fcLuqFliEibf+42R9Rts4dwYw9UU8aCf5M+3CDTfEjjQUlXHgpEgl/Sl+hLyVf3L7JLmW+PmKgEQ69mPGuM3YVP2gokTpUZJMbaUs1tEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8176
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Kill execlist support.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 10:02:24AM +0200, Francois Dugast wrote:
>On Fri, Jul 21, 2023 at 08:40:01PM +0000, Souza, Jose wrote:
>> On Fri, 2023-07-21 at 16:19 -0400, Rodrigo Vivi wrote:
>> > This submission backend is incomplete and unsupported.
>> > It was left there only for some initial bring-up for comparison
>> > and experiments. But most of Xe driver and its features rely
>> > entirely on the GuC submission.
>> >
>> > If this code is not entirely broken yet, it is likely just a matter
>> > of time.
>>
>> My 2 cents here, I think it is worthy to keep it even broken to make sure Xe have a backend layered architecture and don't end up like i915 +
>> execlist.
>> Also for new platforms bring-up this might come handy when fixed(if the necessity comes someone will put the needed hours to make it functional
>> again)...
>>
>
>My 2 cents: I agree execlist has potential to be useful but only if it is fixed
>and maintained in the long run, and (quoting the cover letter) "untested,
>unvalidated, un-ci, unsupported" are all addressed.
>
>Otherwise I think it is better to remove it and to keep it somewhere else as a
>patch if needed in the future, because it is odd to keep code we know not to be
>functional.

This discussion happened over and over. And it will always come back if
we keep it like this. If/when someone steps up to add an execlist
backend, this patch can be used as reference to be reverted.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
