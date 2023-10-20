Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CDFCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 03:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F1D10E573;
	Fri, 20 Oct 2023 03:39:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB02710E573
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 03:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697773136; x=1729309136;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=UUTGZUa8tvXjKCBWteLBnBS3z0wu8sOP/bUAvhanxVw=;
 b=k8NV35OJwA8skCQCTdZ/XB2nO+5Fsf5PlpB8DdJyIiYiHwC4CTupZcUI
 CBTUknzseeRlO2M1Tp3MHP+zbu06QdlF+vvAtHZ4v7UctaSq65QTRSeOp
 l/6UQ/fMzYyO2g4uuh86bkJ2EudO/rRA4GEVdR6PL7Mas9L3enz4RkjJW
 h4zWxmNMtro37SXQM3wJ8QUkwTLtsuG5+A7Hyz+8QgBOFTmJkLKzCSKi+
 h4toCeK95uhBBBUNjIrwn5IUNDPFv6CwKpMZa0G398gTEwXjNZSmByP19
 jvoC9A9cL4LfUj7Sr6nc1py2acSRVEuiNmJeEaBEDbfVZWMELQNlH5KNd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385300185"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
 d="scan'208,217";a="385300185"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 20:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="823089706"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
 d="scan'208,217";a="823089706"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 20:38:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 20:38:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 20:38:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 20:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4R+48uvbUzVjtHBC7BOwxbVQZDo8laMhKsXl23jMRpryMBI3fiV6j61E0LCKgTUzkhVwZLWW98e4bkR+OZUQZukWnlspQ2rRL6BKe7g7vWiVy+PjfhMIys+V6TbN9DFSHAxesyBtEuIeDD7P2C56IC5PG1gg1jLffosMjWGavm2f1MY1lrpB80NY71PlEdwJ9nmztS7JPxeGaYS4poxk8l1xkSavFYF4ynWJzXFEMtI2buYlqQhh1fDpxA4aK2ohUcCcKr1cBmNuzn3KKts15hrKvSqlwLyh/07uXyziR+646JDHoJgaLt2KcfkZg3mpT8yNxFbwvtQWh+RwT+4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eemxKd56hZg4Pk0Dw0rQp6yJz3h2BKG2mvNNpnNhS0=;
 b=guswycH2ccXr5I7Jt/3rf6Z311sWlnXOp4t2d8T27XEF1xp2OXDe7qHvbaVqHBykAy08Wx0GCIiVBOJYldg7dyzV1p5syxT3evWrVG8wNHiqtgBnls+dqJ42yQwOSVET5Lt++tLu5t9Jw/0O5YuL+scI7FRAcfHi+XLCGfrZOwXKJ/5ScOqjWAliB9NKEvVYl0zOuGy4xEYUK55EBanvspY9fpHN3ZPmqOsgHW8tU14P/mGDYGFgOBhMd3RqpD+0fqXyHNKsqld6DSPhfOOkgnc2IYGk+I8RMeR07yE3bgswB+kLwJ8FoNu4GbAZcZiybtgiCuA4Qi8FM4ll7y6nXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 03:38:42 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%7]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 03:38:41 +0000
Content-Type: multipart/alternative;
 boundary="------------PFCpcljqJGWLmQFXAMYDQW0L"
Message-ID: <3a80ba4a-ef10-44b5-a63d-f90a8024722e@intel.com>
Date: Fri, 20 Oct 2023 09:08:34 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Welty, Brian" <brian.welty@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
 <20231019132534.1374903-7-himal.prasad.ghimiray@intel.com>
 <d1db0afd-0979-40c1-918e-955a7d658c0c@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <d1db0afd-0979-40c1-918e-955a7d658c0c@intel.com>
X-ClientProxiedBy: PN2PR01CA0221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 6769d34a-e32c-4407-c62a-08dbd11e0dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPzkhvwIO0aZ+w3g87Qm+E6sm7ldVwIfeDLsbnsRuH7TNTYD0ez6W8HonC5w2ezdx0waNt+nu3J1T7RfLI8naBSSQlwl8Xlb69ZTNX3VZiCjrBnCk9UbBL14lTx5I2Vy4IoaC+MetXIRfEuLLNxyL18h5cyR7dBt5lmBUsFvpxrqpocmGeY924/79CWqrLumoeH7IqH4ogQVGU4GgiZU78jYFF/j13ygdFe7HoLwcCaBOQzIKThIr8jg6Hwqsh7U6bCUh0w+s+6fTJbQapWsNE4D8mkongPLGTttg83vajcy9k7YIBv6DGkwedCxQkK6bLSmrCljHO6QtTRlwIFLcrn4YZlEjQ0UdqBzrTuAY05vYf2Fl/BZZ/Y9wyrg4/9irmmUf2o0Hl1cnpEwi0Id9T2So4q+pdRa+GekiMkl3fdgF8NfkxRavJSPif8VtmOrzqFRqsTl0XvrPtRJKKi3xPNHUaTbaO+2AoNMJ7cNZm73BgSUbO9aLNxEK8smm6+hEDKrkp+VdpKW1EV69CXVgUMpH+lAnJEdP+Nq+4oG0iwnBXEj7fQvNCc47DV0dw3boNaIzaY3GxgeVUrpvZtbGXnBYUnyg0RXf4FOuWQz8zTh31/5TFzpGKwUUZQzEsYeSiFRLrGnz/mFizEPKPjgOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(5660300002)(4326008)(8676002)(8936002)(53546011)(33964004)(6666004)(6512007)(6506007)(30864003)(36756003)(2906002)(83380400001)(26005)(2616005)(38100700002)(82960400001)(31696002)(86362001)(478600001)(316002)(66556008)(66476007)(66946007)(41300700001)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRRNUJYSzRKa3Brbm1weDNPMGcrcGN2SXViK3hkQTkyYWpLWUZIS01DRk82?=
 =?utf-8?B?bmtXdVJjU2g0eWJ0NXZOMFF0YzlhMG9nVGJ2TjdETmdiNFNFSDBrK2dlWDJB?=
 =?utf-8?B?RkdhdkRLZ2hhRmNDOFhRUllEbExhTis1dkUyUmwxbFhhOVpnRGNTTXkyNlFM?=
 =?utf-8?B?dXNrUkVGL0tZUHVZbTJQQktoWFd5YkdhV2tYVVRJcmFobDRkOWFtcVN6OTFo?=
 =?utf-8?B?WXNWWUVtS3RwL2NQRHhYU1F0UmJKYWlRa0RSS2FlYkk5cDdYYnEyYWdPNi80?=
 =?utf-8?B?bFc3RGVLaktxbDRoYXJJOXg5ZG1ySEI4SUc1a3IvSUJGRVZnTFZibENDa3Mr?=
 =?utf-8?B?YU5ZbUwyY0dYVEZLUlhELzVvQitCNTc3SkNKUkgwaldXTGdJOENPNXN2RkFV?=
 =?utf-8?B?ZmJzTkJEd1FnaTdpbm41eHcrNFNhVll0NUJTLzJkdFY5RERtc1ltVFJqUUpE?=
 =?utf-8?B?ZmpCTG1FQkRyanYwa0lUbTRWekpXdG96eU9rUjBOSW5CSGxNVkdlN0pDcVRZ?=
 =?utf-8?B?TUNsZEo3L2NCZ2xBZDl4SFIyNFpzb1F0VFJFWkRsZHJhVUtrZi9FMWtlSlhS?=
 =?utf-8?B?MFAxTUl5Z05UUGY1MDk3dEtJUFFiYUxTQzBPdG1wNXltd1lhSjRySDBKblJQ?=
 =?utf-8?B?UWoxSC9YanNieks1QnlGNmFWc3AzeXYwZWZhbVNZTDJrbVRoSm44OW5Da2RG?=
 =?utf-8?B?cnY3SFJjMEtYR1ZXOTdnREFYVnRkQmk2RVpPL1hlbktISHMrWmNXdHlNaGdT?=
 =?utf-8?B?eG1WNlVLa2FvWjYzTDdPWlhRamMrczgvNWU0ZUUrWi9BRDhiQWJ6eTh0akpF?=
 =?utf-8?B?L1BLb2xBcU83WnIzNGNaVUZPYVV0TlRpakUzaWdFaEhORjBkV0d3bmVneDUx?=
 =?utf-8?B?YUVjL0ZsK21oRUhJOUIrWkNTMDY5U09nakpvQVZibTlnbGNndEh4UjZzb1F1?=
 =?utf-8?B?WXV0M051cUgxS0xxeTZ6T3czVHBRL3VsRGNLZGQ3bkZ4aDNsRDBvZXlSVDdj?=
 =?utf-8?B?b3hZRGJ1cXlndEdRc2U0N1UzelhuRFJERDZPRVZKMUw4Y0ZaY294dURiWjQ5?=
 =?utf-8?B?WXM4bDNjU2VlclJtODZoQjVCeE4yK0I3eHRoYmVCWC9sOHNuUnZ6b05QbC9q?=
 =?utf-8?B?bVFTR21ON3ViUUdGbVJWbnJwaEp3L3F3UGFTa2dQUU50ZFZCZFBPY1RKRDlN?=
 =?utf-8?B?UkczQUpod3NTOFduRjRwMlk1azVqS1d0Z3J6N05qVzJ5MFFaVnVBUjFtaWxs?=
 =?utf-8?B?YzJWclZ0VGwrMXNud003SVRna2d2TGdTejBqTGo5RkZjeGw0MWlIVFVBN3N0?=
 =?utf-8?B?V2cxeGN2MVI2S0pIbG5zcUtHTVd2Z1hNSnZ2L29TdGdQVXpvYXVJa1hzaklB?=
 =?utf-8?B?c3dRbDNvRCt3N3hMRmwrUS9uMVRjeDdYWG9sSG1YQU1hYm0xNngxakxJMjY4?=
 =?utf-8?B?SzN5ZFp1RkpOR1pDRUc2ZnhtQ3NvUENTYUovYVZ0TlVwR0gwWGl2dEZKOVBw?=
 =?utf-8?B?UDA1c3NOamVMZmVsT2htZCtIY1lXamJnUXc4TzdQTmVMb01XeE4xQzJNM3lw?=
 =?utf-8?B?TE9Jd2hUMnNBZlNMY0xWRzJvREFjQmVRUVR6eFlpVytVdXA5bm5uSmFwUlN1?=
 =?utf-8?B?NHVUbFIrMW02aHJ2UzZlVWoyLzh5M0NCRHBpOWVJcDdZc2hsMUhLS3NONGcz?=
 =?utf-8?B?dFlHekpMc0s3R2tibndJa2pxelBaQ2poNXVqT2tKczRKQ0ZTTlVMcFplUWlZ?=
 =?utf-8?B?cEpRYm92N3hpamwxUmtPTUx4K0hTb09FanMzZHN2TklLakJHaTYrdWlMZSs0?=
 =?utf-8?B?aTFGOE5VclJuNzcvTkNoREpQRFpxWm1WL0hTVGluWWV4MXg0YU9WQjc1ODAw?=
 =?utf-8?B?NUE2NGxONGRXaHF5RVZ6dDBvNldyYkhFN1JYbkNNVE8xamNlNEg4SnFGTkdj?=
 =?utf-8?B?a0cvMERxR3d3RHo1eEw3cjJ4WmNEWW1pWENKRk96SzliUys5WlMwdFJ4aEMw?=
 =?utf-8?B?MnpaM2RzdDR0bGczbnRZbVkzMUV3R1lTV2RWdkpLSXRKZ2lOSTN1MDJSTFBM?=
 =?utf-8?B?THozSEh6QmZ6cElJK2pUSmVpRVh6SVN1YzQzNGlRdmVyS3ltY0R5NERFMmVL?=
 =?utf-8?B?ZElkNEFINGE4WlY0ZTdiUXdXY09Rc1p1bUE0ZFo0RmtJb3J4UitsdWdKQU1Q?=
 =?utf-8?Q?FuJnREh6nJ3vsvn+IKdYCBw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6769d34a-e32c-4407-c62a-08dbd11e0dda
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 03:38:41.6277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OlifwTJ5apkRN6EhP1h4o4cirJ+B6HSGANRXo6FFF4vkb1nJvnGVO7Uqhv8odhaLqoNLNNrt6Ak7r1N/CQoNMlxuqDZKIUIVKCAo/Th36I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 06/11] drm/xe: Notify userspace about GSC
 HW errors.
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

--------------PFCpcljqJGWLmQFXAMYDQW0L
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 19-10-2023 22:34, Welty, Brian wrote:
>
>
> On 10/19/2023 6:25 AM, Himal Prasad Ghimiray wrote:
>> Send uevent incase of nonfatal errors reported by gsc.
>>
>> TODO: Since XE_RESET_FAILED_UEVENT and XE_GSC_HW_HEALTH_UEVENT
>> both pass DEVICE_STATUS=NEEDS_RESET. Use same Uevent to determine
>> the RESET_REQUIRED and pass reasons for reset required as additional
>> info.
>>
>> v2
>> - No need to provide tile info in uevent because error is
>> accepted only in tile0. (Aravind)
>>
>> v3
>> - Use pci node to send uevent.
>> - Pass RESET_REASON for uevent.
>
> Can we go a step farther as Aravind was saying and just have one 
> single uevent?  Or maybe you have one uevent now, but can still 
> consolidate a bit more.
> So replace XE_GSC_HW_HEALTH_UEVENT and XE_RESET_FAILED_UEVENT with one 
> uevent, defined in uapi header with:
>
> #define XE_RESET_REQUIRED_UEVENT        "RESET_REQUIRED"
> #define XE_RESET_REQUIRED_UEVENT_REASON_CSC "REASON=CSC_HW_ERROR"
> #define XE_RESET_REQUIRED_UEVENT_REASON_GT "REASON=GT_RESET_FAILED"

Hi Brian,

While implementing XE_RESET_FAILED_UEVENT, the recommendation was to use

"DEVICE_STATUS=NEEDS_RESET" instead of "RESET_REQUIRED.

Will be proceeding with:

#define XE_RESET_REQUIRED_UEVENT        "DEVICE_STATUS=NEEDS_RESET"
#define XE_RESET_REQUIRED_UEVENT_REASON_CSC "REASON=CSC_HW_ERROR"
#define XE_RESET_REQUIRED_UEVENT_REASON_GT "REASON=GT_RESET_FAILED"

Thanks for the review comments, will be updating it in next patch.

BR
Himal

>
> Would above work?
> -Brian
>
>
>>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Cc: Brian Welty <brian.welty@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c     | 17 +++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_error.h     |  3 ++-
>>   drivers/gpu/drm/xe/xe_irq.c          |  4 ++++
>>   include/uapi/drm/xe_drm.h            |  9 +++++++++
>>   5 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 3b371e0f6168..bc7b545ce37b 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -196,6 +196,9 @@ struct xe_tile {
>>       struct tile_hw_errors {
>>           struct xarray hw_error;
>>       } errors;
>> +
>> +    /** @gsc_hw_err_work: worker for uevent to report GSC HW errors */
>> +    struct work_struct gsc_hw_err_work;
>>   };
>>     /**
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 84533ef6a51e..644e63d4d717 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2023 Intel Corporation
>>    */
>>   +#include <drm/xe_drm.h>
>> +
>>   #include "xe_hw_error.h"
>>     #include "regs/xe_regs.h"
>> @@ -378,6 +380,20 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const 
>> enum hardware_error hw_err)
>>           xe_gt_hw_error_log_vector_reg(gt, hw_err);
>>   }
>>   +void xe_gsc_hw_error_work(struct work_struct *work)
>> +{
>> +    struct xe_tile *tile = container_of(work, typeof(*tile), 
>> gsc_hw_err_work);
>> +    struct pci_dev *pdev = to_pci_dev(tile_to_xe(tile)->drm.dev);
>> +    char *csc_hw_error_event[3];
>> +
>> +    csc_hw_error_event[0] = XE_GSC_HW_HEALTH_UEVENT "=1";
>> +    csc_hw_error_event[1] = "RESET_REASON=CSC_HW_ERROR";
>> +    csc_hw_error_event[2] = NULL;
>> +
>> +    kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE,
>> +               csc_hw_error_event);
>> +}
>> +
>>   static void
>>   xe_gsc_hw_error_handler(struct xe_tile *tile, const enum 
>> hardware_error hw_err)
>>   {
>> @@ -435,6 +451,7 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, 
>> const enum hardware_error hw_err)
>>               drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
>>                           "Tile0 reported GSC %s %s error, bit[%d] is 
>> set\n",
>>                           name, hw_err_str, errbit);
>> +            schedule_work(&tile->gsc_hw_err_work);
>>           }
>>           if (indx != XE_HW_ERR_TILE_UNSPEC)
>> xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h 
>> b/drivers/gpu/drm/xe/xe_hw_error.h
>> index 997747b6b603..3c02fbd3b256 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -7,6 +7,7 @@
>>     #include <linux/stddef.h>
>>   #include <linux/types.h>
>> +#include <linux/workqueue.h>
>>     #define XE_RAS_REG_SIZE 32
>>   @@ -106,5 +107,5 @@ struct xe_tile;
>>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 
>> master_ctl);
>>   void xe_assign_hw_err_regs(struct xe_device *xe);
>>   void xe_process_hw_errors(struct xe_device *xe);
>> -
>> +void xe_gsc_hw_error_work(struct work_struct *work);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 8365a4cb0c45..bc0f01a2abc1 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -614,6 +614,10 @@ int xe_irq_install(struct xe_device *xe)
>>       irq_handler_t irq_handler;
>>       int err, irq;
>>   +    struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +
>> +    INIT_WORK(&tile->gsc_hw_err_work, xe_gsc_hw_error_work);
>> +
>>       irq_handler = xe_irq_handler(xe);
>>       if (!irq_handler) {
>>           drm_err(&xe->drm, "No supported interrupt handler");
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 24bf8f0f52e8..4e5e57bc9f69 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -16,6 +16,15 @@ extern "C" {
>>    * subject to backwards-compatibility constraints.
>>    */
>>   +/**
>> + * DOC: uevent generated by xe on it's pci node.
>> + *
>> + * XE_GSC_HW_HEALTH_UEVENT - Event is generated when GSC reports HW
>> + * errors. The value supplied with the event is always "NEEDS_RESET"
>> + * Additional information supplied is "RESET_REASON=CSC_HW_ERROR".
>> + */
>> +#define XE_GSC_HW_HEALTH_UEVENT "DEVICE_STATUS"
>> +
>>   /**
>>    * DOC: uevent generated by xe on it's pci node.
>>    *
--------------PFCpcljqJGWLmQFXAMYDQW0L
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19-10-2023 22:34, Welty, Brian
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d1db0afd-0979-40c1-918e-955a7d658c0c@intel.com">
      <br>
      <br>
      On 10/19/2023 6:25 AM, Himal Prasad Ghimiray wrote:
      <br>
      <blockquote type="cite">Send uevent incase of nonfatal errors
        reported by gsc.
        <br>
        <br>
        TODO: Since XE_RESET_FAILED_UEVENT and XE_GSC_HW_HEALTH_UEVENT
        <br>
        both pass DEVICE_STATUS=NEEDS_RESET. Use same Uevent to
        determine
        <br>
        the RESET_REQUIRED and pass reasons for reset required as
        additional
        <br>
        info.
        <br>
        <br>
        v2
        <br>
        - No need to provide tile info in uevent because error is
        <br>
        accepted only in tile0. (Aravind)
        <br>
        <br>
        v3
        <br>
        - Use pci node to send uevent.
        <br>
        - Pass RESET_REASON for uevent.
        <br>
      </blockquote>
      <br>
      Can we go a step farther as Aravind was saying and just have one
      single uevent?&nbsp; Or maybe you have one uevent now, but can still
      consolidate a bit more.
      <br>
      So replace XE_GSC_HW_HEALTH_UEVENT and XE_RESET_FAILED_UEVENT with
      one uevent, defined in uapi header with:
      <br>
      <br>
      #define XE_RESET_REQUIRED_UEVENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;RESET_REQUIRED&quot;
      <br>
      #define XE_RESET_REQUIRED_UEVENT_REASON_CSC&nbsp;&nbsp;&nbsp;
      &quot;REASON=CSC_HW_ERROR&quot;
      <br>
      #define XE_RESET_REQUIRED_UEVENT_REASON_GT&nbsp;&nbsp;&nbsp;
      &quot;REASON=GT_RESET_FAILED&quot;
      <br>
    </blockquote>
    <p>Hi Brian,</p>
    <p>While implementing XE_RESET_FAILED_UEVENT, the recommendation was
      to use <span><span class="ui-provider ec bav baw bax bay baz bba bbb bbc bbd bbe bbf bbg bbh bbi bbj bbk bbl bbm bbn bbo bbp bbq bbr bbs bbt bbu bbv bbw bbx bby bbz bca bcb bcc" dir="ltr"><br>
        </span></span></p>
    <p><span><span class="ui-provider ec bav baw bax bay baz bba bbb bbc bbd bbe bbf bbg bbh bbi bbj bbk bbl bbm bbn bbo bbp bbq bbr bbs bbt bbu bbv bbw bbx bby bbz bca bcb bcc" dir="ltr">&quot;DEVICE_STATUS=NEEDS_RESET&quot; instead of&nbsp; </span></span>&quot;RESET_REQUIRED.</p>
    <p>Will be proceeding with:</p>
    <p>#define XE_RESET_REQUIRED_UEVENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<span><span class="ui-provider ec bav baw bax bay baz bba bbb bbc bbd bbe bbf bbg bbh bbi bbj bbk bbl bbm bbn bbo bbp bbq bbr bbs bbt bbu bbv bbw bbx bby bbz bca bcb bcc" dir="ltr">DEVICE_STATUS=NEEDS_RESET</span></span>&quot;
      <br>
      #define XE_RESET_REQUIRED_UEVENT_REASON_CSC&nbsp;&nbsp;&nbsp;
      &quot;REASON=CSC_HW_ERROR&quot;
      <br>
      #define XE_RESET_REQUIRED_UEVENT_REASON_GT&nbsp;&nbsp;&nbsp;
      &quot;REASON=GT_RESET_FAILED&quot; <br>
    </p>
    <p>Thanks for the review comments, will be updating it in next
      patch.<br>
    </p>
    <p>BR<br>
      Himal <br>
    </p>
    <blockquote type="cite" cite="mid:d1db0afd-0979-40c1-918e-955a7d658c0c@intel.com">
      <br>
      Would above work?
      <br>
      -Brian
      <br>
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Cc: Aravind Iddamsetty
        <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@linux.intel.com">&lt;aravind.iddamsetty@linux.intel.com&gt;</a>
        <br>
        Cc: Brian Welty <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>
        <br>
        Signed-off-by: Himal Prasad Ghimiray
        <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_device_types.h |&nbsp; 3 +++
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_hw_error.c&nbsp;&nbsp;&nbsp;&nbsp; | 17 +++++++++++++++++
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_hw_error.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 ++-
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_irq.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 ++++
        <br>
        &nbsp; include/uapi/drm/xe_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 9 +++++++++
        <br>
        &nbsp; 5 files changed, 35 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device_types.h
        b/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        index 3b371e0f6168..bc7b545ce37b 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        @@ -196,6 +196,9 @@ struct xe_tile {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tile_hw_errors {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xarray hw_error;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } errors;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @gsc_hw_err_work: worker for uevent to report GSC HW
        errors */
        <br>
        +&nbsp;&nbsp;&nbsp; struct work_struct gsc_hw_err_work;
        <br>
        &nbsp; };
        <br>
        &nbsp; &nbsp; /**
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
        b/drivers/gpu/drm/xe/xe_hw_error.c
        <br>
        index 84533ef6a51e..644e63d4d717 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_hw_error.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_hw_error.c
        <br>
        @@ -3,6 +3,8 @@
        <br>
        &nbsp;&nbsp; * Copyright © 2023 Intel Corporation
        <br>
        &nbsp;&nbsp; */
        <br>
        &nbsp; +#include &lt;drm/xe_drm.h&gt;
        <br>
        +
        <br>
        &nbsp; #include &quot;xe_hw_error.h&quot;
        <br>
        &nbsp; &nbsp; #include &quot;regs/xe_regs.h&quot;
        <br>
        @@ -378,6 +380,20 @@ xe_gt_hw_error_handler(struct xe_gt *gt,
        const enum hardware_error hw_err)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_hw_error_log_vector_reg(gt, hw_err);
        <br>
        &nbsp; }
        <br>
        &nbsp; +void xe_gsc_hw_error_work(struct work_struct *work)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_tile *tile = container_of(work, typeof(*tile),
        gsc_hw_err_work);
        <br>
        +&nbsp;&nbsp;&nbsp; struct pci_dev *pdev =
        to_pci_dev(tile_to_xe(tile)-&gt;drm.dev);
        <br>
        +&nbsp;&nbsp;&nbsp; char *csc_hw_error_event[3];
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; csc_hw_error_event[0] = XE_GSC_HW_HEALTH_UEVENT &quot;=1&quot;;
        <br>
        +&nbsp;&nbsp;&nbsp; csc_hw_error_event[1] = &quot;RESET_REASON=CSC_HW_ERROR&quot;;
        <br>
        +&nbsp;&nbsp;&nbsp; csc_hw_error_event[2] = NULL;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; kobject_uevent_env(&amp;pdev-&gt;dev.kobj, KOBJ_CHANGE,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; csc_hw_error_event);
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; static void
        <br>
        &nbsp; xe_gsc_hw_error_handler(struct xe_tile *tile, const enum
        hardware_error hw_err)
        <br>
        &nbsp; {
        <br>
        @@ -435,6 +451,7 @@ xe_gsc_hw_error_handler(struct xe_tile
        *tile, const enum hardware_error hw_err)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err_ratelimited(&amp;tile_to_xe(tile)-&gt;drm,
        HW_ERR
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Tile0 reported GSC %s %s error,
        bit[%d] is set\n&quot;,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name, hw_err_str, errbit);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_work(&amp;tile-&gt;gsc_hw_err_work);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (indx != XE_HW_ERR_TILE_UNSPEC)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        xe_update_hw_error_cnt(&amp;tile_to_xe(tile)-&gt;drm,
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_hw_error.h
        b/drivers/gpu/drm/xe/xe_hw_error.h
        <br>
        index 997747b6b603..3c02fbd3b256 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_hw_error.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_hw_error.h
        <br>
        @@ -7,6 +7,7 @@
        <br>
        &nbsp; &nbsp; #include &lt;linux/stddef.h&gt;
        <br>
        &nbsp; #include &lt;linux/types.h&gt;
        <br>
        +#include &lt;linux/workqueue.h&gt;
        <br>
        &nbsp; &nbsp; #define XE_RAS_REG_SIZE 32
        <br>
        &nbsp; @@ -106,5 +107,5 @@ struct xe_tile;
        <br>
        &nbsp; void xe_hw_error_irq_handler(struct xe_tile *tile, const u32
        master_ctl);
        <br>
        &nbsp; void xe_assign_hw_err_regs(struct xe_device *xe);
        <br>
        &nbsp; void xe_process_hw_errors(struct xe_device *xe);
        <br>
        -
        <br>
        +void xe_gsc_hw_error_work(struct work_struct *work);
        <br>
        &nbsp; #endif
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_irq.c
        b/drivers/gpu/drm/xe/xe_irq.c
        <br>
        index 8365a4cb0c45..bc0f01a2abc1 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_irq.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_irq.c
        <br>
        @@ -614,6 +614,10 @@ int xe_irq_install(struct xe_device *xe)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; irq_handler_t irq_handler;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err, irq;
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; struct xe_tile *tile = xe_device_get_root_tile(xe);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; INIT_WORK(&amp;tile-&gt;gsc_hw_err_work,
        xe_gsc_hw_error_work);
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; irq_handler = xe_irq_handler(xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!irq_handler) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err(&amp;xe-&gt;drm, &quot;No supported interrupt
        handler&quot;);
        <br>
        diff --git a/include/uapi/drm/xe_drm.h
        b/include/uapi/drm/xe_drm.h
        <br>
        index 24bf8f0f52e8..4e5e57bc9f69 100644
        <br>
        --- a/include/uapi/drm/xe_drm.h
        <br>
        +++ b/include/uapi/drm/xe_drm.h
        <br>
        @@ -16,6 +16,15 @@ extern &quot;C&quot; {
        <br>
        &nbsp;&nbsp; * subject to backwards-compatibility constraints.
        <br>
        &nbsp;&nbsp; */
        <br>
        &nbsp; +/**
        <br>
        + * DOC: uevent generated by xe on it's pci node.
        <br>
        + *
        <br>
        + * XE_GSC_HW_HEALTH_UEVENT - Event is generated when GSC
        reports HW
        <br>
        + * errors. The value supplied with the event is always
        &quot;NEEDS_RESET&quot;
        <br>
        + * Additional information supplied is
        &quot;RESET_REASON=CSC_HW_ERROR&quot;.
        <br>
        + */
        <br>
        +#define XE_GSC_HW_HEALTH_UEVENT &quot;DEVICE_STATUS&quot;
        <br>
        +
        <br>
        &nbsp; /**
        <br>
        &nbsp;&nbsp; * DOC: uevent generated by xe on it's pci node.
        <br>
        &nbsp;&nbsp; *
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------PFCpcljqJGWLmQFXAMYDQW0L--
