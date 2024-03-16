Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBBCC54E67
	for <intel-xe@archiver.kernel.org>; Sat, 16 Mar 2024 00:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EE710F034;
	Sat, 16 Mar 2024 00:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mm0LFcTi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FDE10F034
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Mar 2024 00:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710550383; x=1742086383;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EdcoYcvR+WnVOWu1z0xc6fmGlw/LOJnfEvnnmrvgwFQ=;
 b=Mm0LFcTiaQHzlGAY0IBIFzzzdCzO43j0DYYi956k4vp+NzULNMdXJTZ6
 kRn/p3LuA1HuZWDPRErhEnSgRxH0YmEApaPnvNtTG9hntjNywz04Fs6bo
 wRQ3uswHGqAQ6RFEIRYZXuJVOcTq95XxeA1S+0RQ9N1s2gizQ+C97g0Kz
 Huaq/53DSLpH1PrPLSq2vcU7N1D0jDb+5AR1JVGkqTLwGDhcjMYGUcv1M
 KfMBDYxlqarSo2ZsQcpycwPI+0ML58Aw1pG6Wm31U4rmgJf1ozzjs2W12
 v8d8BElWHAvxL9bX2Ssl84g5ChFQKd61bj4e7QMZh5OpedcO+1Q4lUhn4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="9217120"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="9217120"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 17:53:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="12923302"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 17:53:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 17:53:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 17:53:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 17:53:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncGyqVUszPH4u2UOPBWScBNSp4pgda3x6FjaBwg0TxNLvpuZJmN2Jx/Km7zdhI85H0cQxn0SstKPONmhrGTlbGdJjtLHIKPiqfM2lgqFYyO5Cfwgx4MIzJv9025pWJmf/e9Y7Kp9imAnUwims8tgfHovEVkeP8eW2JU7ROzB/BON3JOgCyMe9elykNfYK2Rz0pK9YkjIhGSLopGz7de2jw1Z8Uu7mafVdLfNDIAnef7JX/NBSgu3taFTgu7LHkwAY15f0sgI9ZF+DS+OSoThMg6pEKGMA1pN9ACd+a23H5eu4V3aMB2W7IgTuCDITVi7tTPmJZFbnHl8wnz2GjX3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhCUycOrRhQQwPV/aZbktNmzuKdizshb/ZXCcv3Us8E=;
 b=JcGE44iKrRJg3ZrYHq359cgYUIPFwuw4/50mrfRKSfJbzmVd9NkKsYQwDczQmS7hGwtMeBiaRJei0Rsx6hylTFtBGdG+nF8nF/hd/4ieYnBJqHkgy6YjswX1NOhviD3aD3hmX7hozW79j+/XoiJeuLcwoP6+nkIvnDk43n+5Mw8VBnlHXie9QUdIyr4RBBMCCfKz0k5dUxzyXZ7y/3kd30Hc4jGYM5BNv1NYgJ2GbKfE53WAtS486ece2Xls+2/yO52lYXNxGq3YPFYlOdZ3zir1bYN+afmQAgKKjAZ0EDmqzzguIBX+ezWbu7D7d9SpApw1+DXNAKHe+w/7mxfz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6556.namprd11.prod.outlook.com (2603:10b6:510:1aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Sat, 16 Mar
 2024 00:52:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Sat, 16 Mar 2024
 00:52:59 +0000
Date: Fri, 15 Mar 2024 19:52:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Musial, Ewelina" <ewelina.musial@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyX?= CI.BAT: failure for drm/xe: Refactor BO flags
Message-ID: <wb6y4fg5rrotypqav4r4toiyxzmkqcj7dr7isi4amw3xtzoswr@7w56chxzgoik>
References: <20240314052619.2628396-1-lucas.demarchi@intel.com>
 <171039791262.753907.1073892033267196048@8e613ede5ea5>
 <lvcwvxxew4wcylvs6e2hs7jcjuiyx222ufhuk64heypauvqs5r@3vav2uii3cn6>
 <PH7PR11MB707380E1B39BB7D3E4C3210593282@PH7PR11MB7073.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR11MB707380E1B39BB7D3E4C3210593282@PH7PR11MB7073.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a470d04-2ec1-48f3-bb34-08dc45536ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJGq3GD6R7LFDjxNIe6K7MqG1IPtkpJfSuYLvfnBZU5jDDYE5AztHvfMM/vM3XI+j0kPY/VNJ48BQXAs5EKTmoVx+4gIW/bUNGQsjuuXH8YkxrIvkxiSlr39UuJxkbcd5igQkjckT5mlw4Feh4PqlxIY42t837fjM6W/7WWuGDTjY/Hpft7pJgS/Z0dJQU0QsQlPRVroJZ8/M67ryLteRX5X30Xa/Z9NPPRWzLIIroDC4A7ZvSb8oz/TAEN9cdlxbiF1kjcGH3IOI974PqtLSVRy2Sq6antlCXZEAFSf9x0Zwy3AmmUr7uABOf7mTzx3RwgtTCXrv4sIDptPQ+uXK2CJ9DJAU9qZ9pUNdZFKMClYwj8/WE6bIQkyKUsyru05ZGI73eZ/yowMmuiYK4imB5MWWzRwZ0EzvxMW5lf1++RBbAYPELkpUa8V2ACG8hIN4Rm4Wtg3EAVo0CBpcJAxLy3owsC+1zpzRqEZFFCKgVAB3xj7CgphP04gUr6QUnCpT3RePlFzbp3hl32OvGifL9v1zwSrQbfQyP4NScMtuJmdC+OoCXb8BvThsaPv9ZpslWqo+b5g2MJ3lt7pHlbPJjys7JZoR/6Pk1dwSgISgaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFUSE1IaW9pUEFSTUhYRWZuQnRRNk94ak9ReUhKNFJEbDJNY0Rpb1JuUDJu?=
 =?utf-8?B?MTFSWWV3Mmg1MjliNEpYRzJEcGMxeTFEZXhISU5uOHFGeGtqWERJUCthQkFM?=
 =?utf-8?B?UW5CUWtmc1dJN0FqdkM3V0E2clJsOVhkOW03ZHNlRUJ6ZDR3eFhWSXRTRVBq?=
 =?utf-8?B?cnBxQ0NSWFBTejluTzVHMTJnYjQ2QW9kY0F6d3E0dGxkanVRS2x6MnlUZXRw?=
 =?utf-8?B?MHVhbHdHNEFGWG4yeW9tQ3RGS1E3ZEszeFNLWUtzT21sT0hoK3k3WUV0aStr?=
 =?utf-8?B?VitwTjZ3RFBYSmJmSi9Dd0hoVkFTOU5wY1BkMkRFaVdzcG0vUVEySGQ2WklB?=
 =?utf-8?B?R01kSGJUb2h2NHg5ZGZvQmV3TkNPUVlrWWVxb0YrR1pnZGlYZC82dnl0dE1X?=
 =?utf-8?B?djBhcHZiamFlWHpvaXN5QnJScEc1V2ZQdkMrTi9YNFRWYlFHU2RrTXdlWWtE?=
 =?utf-8?B?TXZrTjl0MkJkQmh1Y1pzdWU0cS9jZmJRNmg2OU5Gbm5XTzJta1U4SnRJTSt3?=
 =?utf-8?B?T3oyWjNRcHdjZ293N0lkcEVXSG5rQXBvUkNmV05SZUthYk5rbzVhTXFxMGdE?=
 =?utf-8?B?dXFzd0lnaVpvOHQvSWJkMTl6cm1FZnM5ZXM5dVhpN3Q3Yit4akdqVjhLeFk1?=
 =?utf-8?B?V1JHc3NUaVp1eGxsQUFRWUtucE81Y054VjVXYjFweGtYYXFabGE2MnB2cThs?=
 =?utf-8?B?eG1aQjBuMmoveTRUZ1pRakpsTFAvdGpIN0dzajBTYUpzYmE2M21NUWR1SHNr?=
 =?utf-8?B?cmpQVHdtbDBYTnc2a2FSOUt5Y3RPZ3BOUlhxWDVUVTRvVXZNNGtsYzZRSFB5?=
 =?utf-8?B?em1NOThNMmhvS1Y1WXpTRlNEUldqdzVBckZkVCt1MzgvSW1YeURhSXlxSFA0?=
 =?utf-8?B?MzNpVVh1dXh3Q2ZJM2t5aldpQm5JbUhPRHgrOFhERG96ajJNTHEzUDlUWmQ4?=
 =?utf-8?B?MmluSkdweWY1YnZJaFc5YVM3T1Vjak8zYzhuTmFiczN4VzZ2YmtZeGxydjV6?=
 =?utf-8?B?dWM0dWRsMTk2aXoyZVNGamxRQU5WUk15YkJMSzk4cXZkcHYxWjE3YjFxcEdU?=
 =?utf-8?B?N3ovWUpKajc2TTJpZXZubDRmeHBOU2E1NVhaT1haQnVSVDllUGRTNnJ6NS94?=
 =?utf-8?B?S0NtWWYrV3A4MlN5WlZ0SWEwbitDbXJodVU5V3JXWW83VUhycGx5YlBBWWt1?=
 =?utf-8?B?TmU4TW45em9ZTHArY0NUUTRKYzM2RkRSbVg2MVZONHo0ZWUycWJhWDZiRWhW?=
 =?utf-8?B?azZUTURpR0RsWXlBcWpoQTZ3Sm5NOTJ2UU9ML3E5eXAyd2ZsMDFabmdXOW55?=
 =?utf-8?B?WHV2Vmk3V1d5NEdyZlFTRjFoc0p6ZGQyMjk5OElIZjBMYWQ1K24xUHlabkY1?=
 =?utf-8?B?NlZabmlOUnRpdkpubUdTeS91d2FNRFpmNXZTNjhHcDVkL1RoSXJRTFZycTdq?=
 =?utf-8?B?NHo3YWsvL282VldVbjdWUzROOGdqeUFxU3RWWlBQaW03RlpHVXJ5b21SWHZx?=
 =?utf-8?B?dFFkVmhlZW5RK1E5UVFEWlNPQjI4WVdlMGJSdU81Rzd2Q04rVVlnUmFvWjVP?=
 =?utf-8?B?dUhzaDZaVzdDcWlJT0llWGhaUVJmdUlJaHBkNkVjSiszQ0lFUjJrWEJrSmlB?=
 =?utf-8?B?VzJMMXhrQ1liWTUwZHh3Y2RUUENkRDRRZ1o1SGNRT0tSVWJoaEVCdE1pTlZG?=
 =?utf-8?B?dTVsUVdhdjM2b1pkTXlnUUhoMVVpQ0FKQm5FZ0NFL1Zrd3pzMUdkMlBBTVhJ?=
 =?utf-8?B?YlU5VUVZNS90OGQ4cUh6YWJSZHdrYklmaC90YktxaFBIRFZnNW9nY2hpSTBu?=
 =?utf-8?B?MEhZNk9zb0hHVk1RRkF5Y1lrZW1mWmdzcGc5K2dqTmE5VHlqZHFJNWw1OE9H?=
 =?utf-8?B?QXFXUkUwcTZHcEtrQ082SytPRmRTNUtoYnhWTnZNWm01THFUNkdwdUJGanZU?=
 =?utf-8?B?Z0NzZTZacHpvMG40YzJ6NzdYbTJpbFRwMWdVWVJJNWRBMVJlTE1HY1ArczNt?=
 =?utf-8?B?UzhuZzVabzMvRVlSS0tYUERoZVR1c042ekZydjNRUmxDNFAxSzFPQXZjWmRw?=
 =?utf-8?B?T24wZGtZZ213Y0tRMUlPaVhFZ1hVZWhVTXRCdVBlNGF5ZEREYXk3RlFhOE8z?=
 =?utf-8?B?WWhyWXJwTVlyeEM1RWkzeURBUDVDOVdaWDFvMndJc3BtbDhOci84ZjN1VWlH?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a470d04-2ec1-48f3-bb34-08dc45536ce8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 00:52:59.2763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDPD7VSZXa2ThlxANNa6MFLfMOJe8YRu/aKViG90dQBi7enXOgzT6wre5Z+Bh7bfr8ROsNsK6jL8MwxUDVsapCga6UcY6hTTXA3ESaL5W0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6556
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

On Fri, Mar 15, 2024 at 01:38:03AM -0500, Ewelina Musial wrote:
>We are replacing whole kernel and rebooting to it, if it prevented all machines from booting maybe kconfig also changed meantime?

no, kconfig didn't change. And the change here was:

	xe-938-96e47e3f3a5952e104d56352872becdc0048d26e_BAT -> xe-pw-131120v1_BAT

the diff, which corresponds to this patch series only touches xe. Even
if we replaced the whole kernel, there's no way this series would
prevent a machine to boot.   I'm seeing a number of reports
saying a patch series prevented <random CI machine> from booting and
wondering why that's happening


Lucas De Marchi

>
>
>Regards,
>Ewelina
>
>-----Original Message-----
>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>Sent: Thursday, March 14, 2024 5:42 PM
>To: intel-xe@lists.freedesktop.org
>Cc: Musial, Ewelina <ewelina.musial@intel.com>
>Subject: Re: ✗ CI.BAT: failure for drm/xe: Refactor BO flags
>
>On Thu, Mar 14, 2024 at 06:31:52AM -0000, Patchwork wrote:
>>== Series Details ==
>>
>>Series: drm/xe: Refactor BO flags
>>URL   : https://patchwork.freedesktop.org/series/131120/
>>State : failure
>>
>>== Summary ==
>>
>>CI Bug Log - changes from
>>xe-938-96e47e3f3a5952e104d56352872becdc0048d26e_BAT ->
>>xe-pw-131120v1_BAT ====================================================
>>
>>Summary
>>-------
>>
>>  **FAILURE**
>>
>>  Serious unknown changes coming with xe-pw-131120v1_BAT absolutely
>> need to be  verified manually.
>>
>>  If you think the reported changes have nothing to do with the changes
>> introduced in xe-pw-131120v1_BAT, please notify your bug team
>> (I915-ci-infra@lists.freedesktop.org) to allow them  to document this new failure mode, which will reduce false positives in CI.
>>
>>
>>
>>Participating hosts (4 -> 0)
>>------------------------------
>>
>>  ERROR: It appears as if the changes made in xe-pw-131120v1_BAT prevented too many machines from booting.
>>
>>  Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2
>
>
>Nowadays don't we boot the machine  and *then* try to load the module?
>How can a change to the module prevent a machine from booting?
>
>Lucas De Marchi
