Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A4C41513
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 18:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C2B10E62B;
	Fri, 13 Oct 2023 18:28:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B264C10E629
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697221715; x=1728757715;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Oz53rgbDsyAY/W9phyGxWYDkOEOViFz/fcwBXHg2Sy4=;
 b=dzErSotKnwR4DwCi2Xlp/yNlG8FflnzgtusQRlUcFH4CTYT++BnSlDH9
 MSFsHO6OzO5TehAyKr3sejaDhgzYE5B//+60MuefUP9dm2Eg/szD73Tpe
 9f2n4iT0i/ELALMdEhd+RxZfaY/z1ClFp+HGAbevI2JNOihxMRGjOsrq0
 beG2ujiI6KEB77o2k1sLgqkYLaUCnfgDlqyXXwXzclrtxH7w5t2cFP7ul
 effzcWucRHPvXNzNFkN6MVaswrYwwkibXg5HYxU+UYqV+3qGJ7e6L83Jw
 Q2SSeoy/BwWrFEfzz09Q9Be9pY9jPBFi6Y3M5KrLxYVBxOoQeVEB68HiN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416292848"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="416292848"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 11:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="789954124"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="789954124"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 11:28:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 11:28:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 11:28:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 11:28:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 11:28:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaQxyOR/y+N6bbgwRH+cUln/+7LTrEwUjjkEHAW2X6jbWDld9XL4YzKN+yzT722ZmTJPhyEI1v8RuxqPTQegkA3Nzj6uPsnc/nb7M+U1VsjkcpmlIrawb+2JeDHKlhTXyeXro8FELWJLfRY2mef/Lz4rILqkwbNuSWQMFkOpvfINlDYEXZm92IaUXBNB2deynAXwum8Px+R/aG3/nW3xCg6QCy3Ymp6KkKlGLmEbrtP2StlWKPYje91dgLoqRg7Gi48E8EYpab6kq/iMc3nSAJTsMmEyPrsB8qF2RpYaDvLYF7qJDAMEs+n6K0LCBuvBxhwOPXCVShZGltBPH7ndag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opjzV6kTgBlukpKw4/dr/rDp+H5P0RdT+mWkzYWsK2I=;
 b=dyG0AjCA8sILp50kUyj/BIqv/yx/8c00wRDaKfdxi9WrNYUjKyvJyaGaA1UOVAf02adazhWbGQz+AlVFkYHqwN5vU7bm2ZYxsVAgAAIhGsest7T/x03aBacxePsSd4WKpL8OG+Ml1/dW+1TJgV9cUKZl1gEVCtINo06CAumyX0kwpqpkEKD1RJyTEVYBxf1YmKPanEUjdY4Z1jd/460/uFLop/HqxeLIPErernQZjwQ1VV5nietESAp2LK+D7WpMEO9TEM+37pVyK2ty2SCPYXywFVVEUtDMkcQZqg3RqGpP9MeqZPmOI4ILyg3+7Qorcistd06evNQRxRtWwxvfVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 18:28:30 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48f3:57b4:7dce:f17a]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48f3:57b4:7dce:f17a%4]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 18:28:30 +0000
Message-ID: <40bae1cb-dd9c-4028-94b7-0343b73bd6a9@intel.com>
Date: Fri, 13 Oct 2023 11:28:28 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
 <20230915223459.2964036-5-daniele.ceraolospurio@intel.com>
 <im557nhivgzgh4nqea4gczfkwqjh2trwrsfl45fensii6p54fq@2csdpghuqrep>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <im557nhivgzgh4nqea4gczfkwqjh2trwrsfl45fensii6p54fq@2csdpghuqrep>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd9abff-d608-4fc8-0900-08dbcc1a32fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMvNw+ivl5XXlIkVg6SwCojU76YXoRjGzBF453HkEOoaR5E2i4SshJTXSqO2VeXSEDuG6n1J9YnJ1420wqdpVu334JTxrWWqm6peyhMfaijkDzDVAF0Y3VJAxym4e/ejcubUz+OcQKb/PszJA0Vut0/HtlZi4MuQCOFUW2Ykmf39W7zs13rxQBQ9hKea87bc4O7QAc0JzrCD2fHqgRXYvPp0vUxtzsJo7VELeStSc2EUoo706SfibcQP9sJX1JsvkpWs0kywAsUzjZYl1ErqeuE2dEZmfupqQutp7nw87a56uuApw5Tjg5BK0V+z7l38pm1dI8XjHlyFTKFqqu1vK9+2xfOCCe0wSBTw2qP6oysmWlMJnUwoMo507OcdT6TzctT/QHQWPBB6vzp0o/xD4LkcH6QN2CGqRJvV+Mzmvg3pLnLlnAzMk+9ZvbpTrzluURvzWDwt6TS6e/wmIT5gjJ/yHF/kAr1GpZP/zSTx+PsDDFlELL2gQ5HWy/RrJuzhWnde1QFKt6f/CSmXiLpZPDt65l0xlZtjBrGxTCGcerqsLLJ7dPo95NA2SyPLBQkdWbXnqcMx51Vks2Tp8yVBJwLRHAUV0Sy3KWMJQcghe1cUy4TRFfccNUmdIy129DctUFWpEGtD0Rl72PJQ9j3Asg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(6636002)(37006003)(66946007)(66476007)(66556008)(316002)(83380400001)(2616005)(5660300002)(6862004)(86362001)(53546011)(6506007)(31696002)(478600001)(8936002)(8676002)(82960400001)(4326008)(6486002)(31686004)(2906002)(38100700002)(36756003)(6512007)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWlLaWsvWmU2VjlHUE5vdDVUWUZ5ZlFzNVRHdDJTbDJIMXVBenh2K2Rqcjdm?=
 =?utf-8?B?a0ZLK3ZvTTVLdjVNUSs4UmJHWHFmeUFEWnJkaXNPWVhpam93ampkSk56enJY?=
 =?utf-8?B?MytIL0J3aHBIbUlrdEJVZmk2MFJmZ3J5U2xYUW12VytkVVYvTVMxbzBPSkZB?=
 =?utf-8?B?ang2NlBBWjJLUk1zTG1seUNYaS93WXBNOUV6YkZ6TU1DZnRLVG5LNFlSaDB2?=
 =?utf-8?B?OGR4UDFsQkJ3cTEvS09EaHpYckRoM243bHVDOHdpMEpoNlptcEtUZlo5cTIz?=
 =?utf-8?B?UFRiNW5ZYVFFSnh4MFg0dXBBbjZMVEVmTkhaNDJNUkFoMVpPcUs3VERkcnlz?=
 =?utf-8?B?dHNQWDE5TjE5MnJqRlJNblJXUlZDdGlIUXNITWNWU1pZTC9IWXhwcVVJVFgr?=
 =?utf-8?B?Q1Y2SytMZmdiMEx5Y0hQQmJ6b05VY1VhdkJ4enhPVUZMN1ZnZUFRN1UxbnJj?=
 =?utf-8?B?WTM4YVY5OWJ1cHE2cXhEWmFaaUtQOG85dDV3czNlbTY1ZHFxTGk3QktCKzdq?=
 =?utf-8?B?UklZWDRCMHNRa3ZLbkhGOFU0Qk5TdGNTR2ZrUk1NbHFoUWNnYk9Oa2lWWHZI?=
 =?utf-8?B?TExVcXIwUDZTdTV1U1Z5SEZTY1gwQlNpbnpsemlEMUQxQzVTcTd3bk1YQ0w0?=
 =?utf-8?B?Z2VQU2kxdTYwUmc1eUk3SnJQMVpZbHJTMUpiTTM5UHl3R0F3aWpSejZiOXVT?=
 =?utf-8?B?MXcvWXJOVGRiYTFTUjBBYUZBSHBhMEhxUCtTRVQxZlNJa3ljZGZHYlYyNjZo?=
 =?utf-8?B?YTVCaGMvU0lEUkIxemZHOW4vR0pDaWFTUUZQZUxRV0RKRWZFK25QUkd6bEc4?=
 =?utf-8?B?a3lVN0x2SnkrcUxIUWlTNGxtVXdOVUphTDJZQm12QllwUFFLRlcybzIreWZN?=
 =?utf-8?B?bWwrTDArMXMrUlhsNys5eHFrclhTUEpKNUN5OEMwSWVGbFp3bDk2WWNYZjFP?=
 =?utf-8?B?bTFET0Q0NW56bDc3UjNsRUV0QkxJRi84OTdSY0RTUWpjS3dxMXJ2MjFyak52?=
 =?utf-8?B?VXFBUXQ1eW9ibjl6dDdGNE1TZVRJRzVRdmFlQ1JidEhPdCt1ZzVaYjF1ajRn?=
 =?utf-8?B?RkV6RjBuUXhsZW81TWYwV0Mxa1BLNU0yeUcrOFlka3E2UWdiSjBDRDdiRlBJ?=
 =?utf-8?B?S21NZkE4VnBpU3JRMG9RRzQrQXQ3dTVzNk5NWkpYa1JjTWJjN1VsU2dXejVE?=
 =?utf-8?B?TmYwZE9MS2VhS0RuM2R4UXdnK3d2S0paZ0lTanlxR2s1bGFxeDlWZkFXU0Jp?=
 =?utf-8?B?M09NbFlEWkNkWUV1ZXE3WmZmeFJ4b2h2a0cwdnJGclF0Vmw4Z3BHeHpxcWhJ?=
 =?utf-8?B?OW95QjBxa0xqTzdCZWxRK2laN1o3eWNrZkJ5OGJiU0I2Sk1QVWptREFrR3Vr?=
 =?utf-8?B?RmtqejRvNUExRXU0SUpBd1BxekJ6Umk1S0Frcm9HRk5VWnRHOU5kdnhZT1NG?=
 =?utf-8?B?Vm53SURwaU9aWUxTWmVFS0NkYXZOdFBJT1dTKzhqck5jK1B1ZGt4SVlYaWJt?=
 =?utf-8?B?VDY3Y2tNWlJXL3FRbjN0cG1mRlc0YnJodkJXUjVuNDMyWUJlQUN1ZzlQN3Mr?=
 =?utf-8?B?Z2x2Qm5YWDRrWlJtand0RUIrbE9IMHBOaVdVdHcxNlQxSWtETUs3eENtZkFa?=
 =?utf-8?B?dHl0Vi9OMVpwY2V1QkMwZXZabTlkTE9jR3JNSXN1MFd0T3pxWHJUcjNJRDk2?=
 =?utf-8?B?Y044aDc2Ni93ZWY2cHRIai9FdEE4Rk9LR3ZwMWJtRzF6b2pyQjFENnVVY1Y3?=
 =?utf-8?B?T1hrbHFTTTFDUXhYV0hDQTBtTkhJMU1NR3FKVERjSlY4QUx5RzdKRFpTbnpI?=
 =?utf-8?B?Tm5LQ2c3RW1xYitVMDFadXkwT2VrNjMwMFVyUzMwTkZlcGlFcmJTNmxzVjdF?=
 =?utf-8?B?VjQyanE0YTkzZUY3bzlVSkl3NXFNL3RpU0k5bzJvcUJJZ05UYTlYQlhhOEpG?=
 =?utf-8?B?NjU0U0dHRkkvZDU4dzBZQ3d4eXVoRXc4MjdHN290VlpuaDk0cE8xVWF2ekJp?=
 =?utf-8?B?N3ByaW1pVDRJaXdZMnJ0WkxMeFZiTHUxZjVkdlJZR3Y2S0krWDhUYUhLUDNU?=
 =?utf-8?B?ajFpeUhkZGNWQjA5NkZBNG94QndCVWpJZ0w3dWN2OWVEaDJqUXhJUFIrWGsx?=
 =?utf-8?B?NFV4NlhwbzVyV3N0eDdsdXhLN0dpS0Z3TmJhMTMzZHRaZ2M1MG1wbkRYMGRN?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd9abff-d608-4fc8-0900-08dbcc1a32fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 18:28:30.1432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qq8VA/Mm6+aEONDZGQC/GOqFAHRFIZVr/tD1DEGYEi2KoYSH5spjAfpHMBKUGoUGI+Pmcag8fcvivlQGzN0gpeQEvIpHVLYq6+m5dfR4aQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe/huc: Define HuC for MTL
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 10/13/2023 11:14 AM, Lucas De Marchi wrote:
> On Fri, Sep 15, 2023 at 03:34:58PM -0700, Daniele Ceraolo Spurio wrote:
>> MTL uses a GSC-enabled binary. We expect all GSC-enabled binaries to be
>> defined with a "_gsc", so we can check for that in the name to
>> determine if the binary has the GSC headers or not.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_uc_fw.c | 17 +++++++++++------
>> 1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index f956457d0b11..4e43b16a61d5 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -113,12 +113,13 @@ struct fw_blobs_by_type {
>>     fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl,    70, 
>> 5))        \
>>     fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl,    70, 5))
>>
>> -#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)                \
>> -    fw_def(DG1,        no_ver(i915,    huc,    dg1)) \
>> -    fw_def(ALDERLAKE_P,    no_ver(i915,    huc, tgl))            \
>> -    fw_def(ALDERLAKE_S,    no_ver(i915,    huc, tgl))            \
>> -    fw_def(ROCKETLAKE,    no_ver(i915,    huc, tgl))            \
>> -    fw_def(TIGERLAKE,    no_ver(i915,    huc,    tgl))
>> +#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)        \
>> +    fw_def(METEORLAKE,    no_ver(i915,    huc_gsc, mtl))        \
>> +    fw_def(DG1,        no_ver(i915,    huc,        dg1)) \
>> +    fw_def(ALDERLAKE_P,    no_ver(i915,    huc, tgl))        \
>> +    fw_def(ALDERLAKE_S,    no_ver(i915,    huc, tgl))        \
>> +    fw_def(ROCKETLAKE,    no_ver(i915,    huc, tgl))        \
>> +    fw_def(TIGERLAKE,    no_ver(i915,    huc,        tgl))
>>
>> #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)            \
>>     __stringify(dir__) "/" __stringify(shortname__) "_" 
>> __stringify(uc__) version__ ".bin"
>> @@ -207,6 +208,10 @@ uc_fw_auto_select(struct xe_device *xe, struct 
>> xe_uc_fw *uc_fw)
>>             uc_fw->major_ver_wanted = entries[i].major;
>>             uc_fw->minor_ver_wanted = entries[i].minor;
>>             uc_fw->full_ver_required = entries[i].full_ver_required;
>> +
>> +            if (strstr(uc_fw->path, "gsc"))
>> +                uc_fw->has_gsc_headers = true;
>
> can we rather get this from the headers / magic or whatever from
> *inside* the firmware? Relying on the filename IMO is not a good
> practice.  If we don't have a proper way to identify, then I think it
> would be better a try/fail approach starting with MTL: try with gsc
> headers starting on MTL and fallback on error.

There is no "official" way of knowing what type of headers are on top of 
the FW, but the GSC headers start with a marker, so I can check if 
that's there and if it is not we can assume it is a CSS header. The cons 
of this approach is that if the binary gets corrupted (which can rarely 
happen) we might get an unclear error through the fallback.
Would this work for you?

Daniele

>
> Lucas De Marchi
>
>> +
>>             break;
>>         }
>>     }
>> -- 
>> 2.41.0
>>

