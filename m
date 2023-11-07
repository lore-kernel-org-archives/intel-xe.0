Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C29C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EB110E17F;
	Tue,  7 Nov 2023 23:08:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CE110E17F
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699398490; x=1730934490;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yt/DoFfUczQbi2e/ESzajAkcgPIm/VUQ7kpdjj01YCs=;
 b=Jl41GH2wtqp7PdJCjsfSO3AcqNo5O25DBeqRD0CRZXtrwqFK+i2a9Pot
 yhGbkURouqpoqSC6oKk4fCW5vrCOe1yWe0r3gZ8iT5rvrLBH/WQy0Xo+x
 oOfd65/l2w9T/TiOR7ekTcQtve4/sI3GcFtIF4gKtHLHZmR8qqljYhMtM
 JUmcQ+3wb/hUpqFxslrKePe0J0HAe7FmB0+KqK+gXhoi1rN7cjQntGPf1
 xhMrYN/PUve1JY4LmAmLz6u4NqNVHY4W86LhVqZ89p4uJhYoNkBHVRiY4
 +4B42gLguwxgKsfR0TMQeU7wrGZwXChXyFkQy4OJgCSeVW2x5ZLk2PBa6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="11194907"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="11194907"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="906583626"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="906583626"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:08:07 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:08:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:08:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:08:07 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:08:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wr50TlbUikr1ngYBIeEV9zzmH+VFV2NxapmgFqG6GjplqIzyVLs5B7vIw4dJ92uX7wkCITqmB5EN1TgwP8K0EPUk5DMRPBSmfL0w6Jvk77WOnbS2C8v6lNvRqIWGgTzLp3SDCgmXGkPIZlBNVhVO2xRLavGJGlCY0WM+kWtXBQ+l/Gj1ArZAiQiqv1VQa7W41MstKJzN5r8AvjrwpUrX8x44CGow/pNNEeHi5wVQyVCXLkT+upVwSDkG82w0kIuA6nzrGeZzlEG+V9fgJS+wgO9k9Cqj9aQnoLbtPLeRVW/wNh4CGH9GkNlku0wUH+Gqvg3okhiVIm2iWEZHL151Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p44KkDYPATvZ6Jj2i9N8SanghpqaCtYc977Aawnqobw=;
 b=L0LNRT9AWOvrOyvWPcOVnIeHHOBJQrC5fQMZIieFpWkm2ygi1i5XKXc7q5Rc8ZEXQgnEAFT70igGG8OMTLv2NFqtHJhGyFzl5390gWKXb3aITb8TBkJRsc+nbm/LS0pDoOSlv3g4t0lqQVjlFJv88lNV8EUrIwte0ufWwoLpYVIfMGhRIkbeVhFRaxSD+Ca+z+CxiuAZX6FYCNzzIqePYEbCj4Fu5kiMMDQMZrvMmw2l42eBpVvosBFPyoS9/q99YUTlDw2UMeTll4cMtG5+PJ/ia6IUzsbtxnv/hzpANjt7sh6rNQ9BfsNS+lw5LM8urAi22hOrNxNCi6YutzLxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by IA0PR11MB7933.namprd11.prod.outlook.com (2603:10b6:208:407::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 23:08:01 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 23:08:01 +0000
Message-ID: <9cc88767-fae0-4405-b4ed-1e49bf81b654@intel.com>
Date: Tue, 7 Nov 2023 15:07:58 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-3-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:303:8d::14) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|IA0PR11MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e6a2b8-5e8a-4170-d06f-08dbdfe66378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0GEvg9tHmn3/MrRSc8Jx2awr5MttQBopSsTGy71dPuUL2/rqEwPS9hiKHNO9CIjG9XpP6QXnyLUTIXTsXoLxPXNTO4GX/JMmknMb4jL0UTJDYR+KZGkKI4r2WEdw3SeW1F7suq8at5d22bi+46BtD8nZg6Fn7h7Mvm9PjGlyr2XN04VfaLQcqcjmu/RyK3dWDgGeCVcR0rBuFltiQM7NG/1HfJjRkNNCgJj/Z1PkKlOZGun337FGecm9INXoFh/q2gdHNvpGHsKfQFK7Fvm1zKinyay7jLeUwcEFXXPHHXBC68dDoKE1ElVayVnGD1pQqcr9TE8b8tCM8WaY6xXbyb3q1+qe8AhIPEW3hubL/HI3AcrXTtAexjtQ2szdU3IcBdakQX29lBIicNSDSOCJuC0RMMnQa15q8pG0w0Ne2F7j9zK3Ad86OfFoPt2hGBY2focvBYL8XKVL/qCK6HEoy3izuP6AIjtYMB1iXVJ2/OHNp4TZJocHXAfKrgiprnMGhh7OYsFZIoleGO5mZlfOQiyAyd6hNU00q5cvvWq6afOMS9uiSthvTetaMseeF4hXgKNSrTncI6mgMIaPsksW8kZ+dpqcfzmdpXA0+8cA9irRuJZTb/dD6vmH9lelWcBhCyJEPd1v+dA52k9QuUYaCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(8936002)(4326008)(8676002)(66476007)(66556008)(316002)(66946007)(41300700001)(2906002)(86362001)(5660300002)(31696002)(83380400001)(107886003)(2616005)(82960400001)(26005)(38100700002)(31686004)(36756003)(478600001)(6512007)(53546011)(6486002)(6666004)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0tmR1R5RVIvOXFraFJTeG9ZQ1FKcFNDRlphM1ZOaWxQanhFNnpUTzBEQW1W?=
 =?utf-8?B?cWdXVXZadDFlaTVRRFg5cGZqOFJibDNGeDE1eHZ3dDNYT1N1d1pwWlRJQ1pZ?=
 =?utf-8?B?SldPWjFqZ0RBK05kZXE0emtRLzQxQlFkS0xocjBzVVhWS1I5U3BjeUdxb2Y0?=
 =?utf-8?B?OC84bm1pbVhUdDNIZWdQWnlTcExmb3BldEZhWW83RnNzY05lSEM2aStPZUI5?=
 =?utf-8?B?SVl1OWl0c3ZDOWtLY1NkTWtvWGFYU2lUbnpVYitid1RvUHkxZ0tNMUt3OTR5?=
 =?utf-8?B?OEQ2MW9Dc0haY2lwSzQwSFFsUFBPVjdrOS9ld0xUMURpbUJmMVdxNzQraFJo?=
 =?utf-8?B?RGZaVjZndm9hWjZxOFdlYUNueUtXTmFwQStJZWtpZUtuTk5MdFBWSXphSlVq?=
 =?utf-8?B?M3RLNE5sTnZUV2hOcnUra3lPVGNNdGxGUHNhVHN4RkhkOHpxc2VoZmo4M0pr?=
 =?utf-8?B?KzZQUE5oSjZmTHkrdmE2K1d5OWZpSXE2WkdMSVVrdEtKZTgxWFMxUjZHMVBT?=
 =?utf-8?B?dTVBS2VaVWoxMnZYVTFKSDBWK2ZwOUJtWkY2QjFlOFdvRDdudy80cy9qQStw?=
 =?utf-8?B?OG1Fdy92SnBhVFlXUG9CbDVCOFY4aXN2dkNtNjljblQ3Q2dsVVVQMHNiMlEy?=
 =?utf-8?B?UThyRitQOVVMNk5ZbE5IK3lSTzc3MmVyem9pUFRKVXNCcEMxQTJUOG5WTVNj?=
 =?utf-8?B?R3FERU5GdUxhT1Z5cWpWOEtCWXBHa2t5cDZabkZDR0tsVWFETmVCVW9QRlBS?=
 =?utf-8?B?NHBhYXpIeHA0YnFlUEF5YzZXcE9ITlQ3RTZpS3FhQjdDTUVyV2JDeUpxMEli?=
 =?utf-8?B?TSt6S2RFZ3JYNVJuZGJzay9GYXhKdXFFZWdCY0lmWWpIREhtU0tIOFlaKzE3?=
 =?utf-8?B?QU5DMGhVOGR1OEUreXBWdTZzdzBPWmRyczlWMmFLVGNLaUVBSFR6TXRzLzIw?=
 =?utf-8?B?OS9hV0lBVnRMZ2NCVk5wcXdxL2tSbzAwMVE5ckVLYjkwTndCYUZVdWJUUVdG?=
 =?utf-8?B?NnRoQWZ3M29mNUpqRFJOM1FqRFQ5VllkQjhqUmJhRWVGblRzeU9pVzJpTUpn?=
 =?utf-8?B?K2RXWTlBenF0Um1KZHJsaGxSWS9aVHBJYkY1VXZhc0JUM2FIQ1lPT3JJdDE2?=
 =?utf-8?B?N01zT0c3UmNLQkRManVadFhBWFFuNXU0Y2hET0MvdSt4UWc5RGhvYkNrV3dG?=
 =?utf-8?B?Tm41NjZ6dWdUVkZyU0FxdzhVZTNCRnIrcWJhMjZ6dGF0SmhlK1pmWmQzeU9s?=
 =?utf-8?B?ZkNYVmZ3OVhTUUMvcjJSalZoR3ViNER5cmN2YXRlSWc3N0MyamwrMzYrYzhI?=
 =?utf-8?B?WGtxMkpKOGJIS3Z6amdIYk5TSktENlk2enpuRXBUdkkxdVpiYnU0QTc0NGlQ?=
 =?utf-8?B?aWFrMXZjNEpJK0g1ZkxJTTU0Mk1WN0pMdG9tK2pIbnlyUk5HSTdlempnOVFY?=
 =?utf-8?B?ZmtGWVJoZVVoTTJjUXVRUlc2ODJBS3NpQURUSk8xbEJZVi9GK2swM2dxU0g4?=
 =?utf-8?B?NzFpRzZGczVpWUxmQWZ5Y1BUcDE4M2Nac01ETSt3K1pCNFNOdGpCZkRYazNm?=
 =?utf-8?B?djhHbXRpNy9jamJSbC9uQUI3Nmt5cm1OOW9lcGVFNmYwSjc4TG1aR216UnpN?=
 =?utf-8?B?MGVtcmZvSTJMZm8wenY0RFl3SHhsdFYrck9FcFlhOTNpQ1RwUDU4cnhmYXU2?=
 =?utf-8?B?ekxLU2gwcUZCbER1Sld5UjJmOERmT21ybXNZTXJzVVg0V2IrOFg4OUw4TUJ3?=
 =?utf-8?B?WVhKMENXUHZVNDlFcTRtOXFJTkZKN2QwcE91UEhMTEJ2b2RLNEUxaDlLN2Y4?=
 =?utf-8?B?SVIzeXZQdWwwNFFmMVcyMDRadWh3WUhUaENYSXcxR0IrdzNudWpaUEFoN2E4?=
 =?utf-8?B?VTVsYnVpNTJuNS9EQXQzRjlVb1lHUHRPa09ZOW5ZREt4cE5aSUg1Sk8zTk1n?=
 =?utf-8?B?TkpTUkxYajFlTFlxYTZ5bTI0QzFOT1cyS1NkVUUzVUtTSFl1cVNsU2w0eS9R?=
 =?utf-8?B?blMwbWpTL3NkVmhKRFFobTlONjg0RTFNVzhyUTN6Sng0VnVLY3FYZ3VhdkxW?=
 =?utf-8?B?OTQvQzhNajllL1VScEZLT25XR0g3c0RNaVVUNThSaXlRRy9acDlJUFlibWhG?=
 =?utf-8?B?RWpMWVNMdHpvbkJ4aXEvZGdHU05UUUUyZjhkSlRGK2ZpMkQxazhoM0hHdk9S?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e6a2b8-5e8a-4170-d06f-08dbdfe66378
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:08:00.9482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTaOhy0V9dW+U+PTvh5AlFKXYhtrAWnwYaIfBYP64ijZc/zP8XbeOUZP9s5CuwIvR27WbBZkFR2tmuCQ/Rb9NeFjjRIIh/5ALovQpvovomM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7933
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/12] fixup! drm/xe/guc: Report submission
 version of GuC firmware
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

On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
> Major GuC versions greater than 70 will have the submission version in
> the herader irrespective of their minor version number.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 3032c4f148d4..91d4a2272ee7 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>   	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
>   
> -	if (uc_fw->minor_ver_found >= 6) {
> +	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
I strongly recommend that we update to a newer version than 70.5.x for 
all platforms and then just drop all this code before Xe goes live. 
There is no need to be carrying this legacy hack in the shiny new clean 
driver!

John.

>   		/* v70.6.0 adds CSS header support */
>   		guc->submission_state.version.major =
>   			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,

