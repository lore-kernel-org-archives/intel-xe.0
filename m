Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9122BC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 04:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3989910E32A;
	Tue, 30 May 2023 04:01:44 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F00310E32A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 04:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685419301; x=1716955301;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=89gwUQhoeSO0K9fbNb0rOL1ttyKN0XgneSAA6dBxzP4=;
 b=RqOTOhLrwqxwsZ6D0Z/BHfLHHmsXKMiBoYkkgTPw7Gg/anLI/qqARj3C
 6TiPc3l5s/3aoPqrLCF1Rxl9MVWiNwz8pMq2HBbLQB72+qEnWA+MOcLYG
 I9hBAr+X4etRDOn3plRmbq5nCXtwU+5dvtDERnw4nZ3M4CSlnQs9C8r+N
 oZSDwayke5YyK8gev8IfwTFKi9vVe+9UW3ccnTshNuLWnIlFF1P42lzlg
 B7GhCQiNBdxBOTLslv5YA0GFD40VjqAj3RhT20tf4cd6O8wgpaQ6C7NXi
 hy7g2/wwRQHoGzpEHhngkVf6Nqw8dKvdgilbO7COmdhoeICzkwhb/ssDG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="334432514"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="334432514"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 21:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796110396"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="796110396"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 29 May 2023 21:01:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 21:01:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 21:01:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 21:01:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 21:01:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsQamT9H3+NbCl9v4JBDS3e7HOYxMKCIBtx3ci1qz/9O6O5wD6j1MprzAwIb40I3nezbPlcZxUi5Mqx6Gg8S69XQKpFcG6I0xpRgkkR4syOph3fAHc7DKSBqvHwjx46YS6Q/BKJwj+H5//rZKb305yRxEaMwjAviALMhNaL29o/uWaDG4CvuA+zvw1yRuOyAWIuFu8yh7BrrXU7//PhrWZdtpKnzxqLEBWixgjwatjpuem47oVa7XuxmcUttrm/ZYikKd+3xQNDbO4Ov7Q6CJOKmc6r7qKySXGGwAlhMupvvWvCxVsh1FzgiQ09b7RyvT3oDqE+fQYY+HJuu5AIfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W46pm/E1bZAvv7KUgNLto9BXeG8TkgMFVlsxMR3gxFo=;
 b=ZK5w2kyhJKgrIFOJJRZKiNG17Yk2NYIUcx0pMFrtezwFdW23s0M5kY+HbGH913cEvMOzZHhv96XpZ27WpA8/0IsiwpBpYTsDT+LANTfz1OyfZI0X68FkHjODcsY4j+k9tshOLK2t04//9O2459E1UjDmiXnhkNrqgcTUISGZJmCUIysKfi3imc/u9bV+G/1SZuT2ygDuzlh0ZuOorTlWIZMTLBi+3KkxgA+iNWQraX+uBmIcMuEk9pQ/rNmbmkVj6dt2cQgSpEb5UUt+GPLpBdMd3nES+8wfNOW4XXHx1LqmkLT+U9LPvPhzeHiV+gcrxF7PL12GnDnTo2FJoNukMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 04:01:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 04:01:37 +0000
Date: Mon, 29 May 2023 21:01:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <szxnvedtttjyvxsbcwu5hqs2bw5qz6xlabqueurhy2fwsofd24@lzr5djyebxgu>
References: <20230525232406.688875-1-gustavo.sousa@intel.com>
 <20230526001038.GJ10045@mdroper-desk1.amr.corp.intel.com>
 <168506366187.3319.4933213415417310598@gjsousa-mobl2>
 <wjqnree2qplqlfkwuzxcfujob53ooe7ccdenzvypymjjecam2u@p23d6xn3mwi3>
 <168539689700.259912.17352008220425971440@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <168539689700.259912.17352008220425971440@gjsousa-mobl2>
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: dd997256-38a9-4379-0299-08db60c290c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgAmPskbXaoohbSKBkjFPKdGF7dS+b4JejhCg7//5FXgwBGu1SOb4njJDUH6wy+kfhNpoE+ih31mw4SKE5m7ZrxLglU2N6JV6J/sWrYD+ez+dBOShyTd3VKwbtTE5Hd4VkVzUit4yToJuLRUHDIXSRS0sXre3sOMydNvxb3jsRnlItLDyXfjtjAcEWwPx/SM+0/EkC27ytjYA6l3ncYkvwDEAdCSQWL6djbUQNQMIKtt/Ojyp3vIQnQWfD8PDpVT0qWXOO2Io69FMxtfpJZhKJ/gv7FFysFmzgHsGMSQjuo/vH+VD1wwObw61MVZHt61iggptUviEXSo6t1zuWHqqnnLLsRG+LPSwbaPzCtOgRqK0EVpQnYtS5jUMEH+9z64r+aDhnhDRCFsYQBUjaddpmcMfmAK4ZlG3E4imyJlP9zNycVJ7ofbOUI65hOSCyfwtwvbtYKoIZ9Ue0XslK0RE2vI77AkX3GxJ+AbYuP/I750cZaOj0iPyI0fC+2Lc0j5WuK88nw3RhBjvhgkIRK+RKB81c+0zqr4vot6oHR4d5Idkj91gIeco1w/RPBfNeOD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(9686003)(6512007)(2906002)(6506007)(186003)(26005)(478600001)(83380400001)(86362001)(6486002)(8676002)(6862004)(33716001)(82960400001)(38100700002)(8936002)(41300700001)(316002)(66946007)(66476007)(66556008)(6666004)(5660300002)(6636002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GNidU6ALMTfDRthdnuc6QQTtAf+/kp0a7EmSV0mFXrHetM+v8/k0sBqzjTNF?=
 =?us-ascii?Q?+hdA1OAaYwGa97X2jVl7J0b7ISfbWWdoPhpjJq4cZzb3IYTgyT+wI2j0B00Z?=
 =?us-ascii?Q?LtBlYqUi7N1wcQMvs/wOiMukhiIEQIQb0aBmi32U6ldC7GJkvZMRmzd9uY/n?=
 =?us-ascii?Q?JAuq4NyeEFhsHj29FAZcHEsBqTf8UnJGZSnkX6iDRe/1HrTqxCN1wzNyHI1p?=
 =?us-ascii?Q?P+RMT7pwpFTXkO2oigsllV1N0mbKJ6O44mveBQUiAXQBqls42sWqE5KYGVPc?=
 =?us-ascii?Q?Y4fWP16PwJFm063d9IPCx8uj7zhkQMm24a0ZkxVVxkIWfSBFwbDVFJJFoaVL?=
 =?us-ascii?Q?G9bhDyOazGhG0TsvNVjCa2tOHu+2hZpVAhjJYOO/Ub2Y3ID+8NXSWSDPNSDJ?=
 =?us-ascii?Q?mV0XQ6FZx2w0xyM9GgYy226GrF+r1nrFYlQvSFbYuoGtsN7eNb0KPKEzXOGN?=
 =?us-ascii?Q?QiqBtilYwoaTCJyfLsRj3fnXTFLloFdl2wpIRZ2gGCM6ROWuJ4EhlozG6632?=
 =?us-ascii?Q?VjQNKVtm6cqfIa1ZolQ43T+/5keoAtq+wMJUUYa5BMUsxOmqo5khjJLJqAIc?=
 =?us-ascii?Q?jAwG2h8WTtMr4PChHKJnxLlczOSLogN+V43/Fs2FqUnMCCoi4Wqcbyfuc9Yo?=
 =?us-ascii?Q?PBg4z5GleVWHnCAcSkSEjW2tJjzeLjc1EbMrolxPSAhw7OmQZudX32sWyNg0?=
 =?us-ascii?Q?ed57f6uFq5FXXxAw776p8PUV9Rr4p1kWTlG2AHSaoHhEkQAwIsz949g4wb+m?=
 =?us-ascii?Q?Kt/VI+LoU4+4vI+yfemiUItRagov4TPpG7foaIUmns6jlv4TrXkMGToaogmY?=
 =?us-ascii?Q?7CxecKIgHWHWcNK1XPgqGOCS0amNBvAtYoC7fQY2ZIQWYL5HfSd/4FY9K8sE?=
 =?us-ascii?Q?vWXRZdAip9zku/IUeem2vtVoo530Lj5m9rQZUEJD13LvnVpiviX+Y59nql8x?=
 =?us-ascii?Q?8DeiuxIDsPc370hgrCmvz9GXI35cZ42IcpHkRrOsCGKBjnMhoo7d9w3oaGCs?=
 =?us-ascii?Q?BQ6lO0UPkLaGKX2BRBNWw0DkzFI4tVlimJRB2PSR9k4pu4ouSZHmDXWSVseI?=
 =?us-ascii?Q?H/RU5BY6wYC+YKbRWeE5rzG+RHRbFtUnk/wycTy0UyzV6bClterllgAmd+Ib?=
 =?us-ascii?Q?LlUvP4ncrXv+i7NR2WXIB7cXAHAxhWHY0s8TLR2/MlqfwQEBA+PJHEIz+Nos?=
 =?us-ascii?Q?wNOgvPsn8gdgoEI1/NG8RoS/cpQRD2+S1qPKPs3QNRGkDIkelp8E6Bu/sOzm?=
 =?us-ascii?Q?1cp2ulDqohJdbhNgIIbQOwMxuZWUWoHT5RaHLw5IuqptQdLZCbgQbEnmy+qO?=
 =?us-ascii?Q?qtHpyJdEPvc3RRfxqHMDl9C2KwWA1Q7Pqelg/M3SUDJhzYm29XVFqvrJttgg?=
 =?us-ascii?Q?UoF5lQylh/612qzlavCzfBQG3aBTJ6bBSdvbxxuFI2ApR9oV0iXcxnRHWYjL?=
 =?us-ascii?Q?fTTCuzFZm9kXRS2m8cdDhifyliDLLIZXO9xVEFuJdXYqfBbS9vWRVdoedhAw?=
 =?us-ascii?Q?UBW+lRWTTR4nv+2rGra1BmZl2gCWYcwJzRD3o+cJMrvGd5SgfIoNm0Pzuzul?=
 =?us-ascii?Q?sJ1+Zw+tSVK8UiZ0Zooyzl1xDXxpBly59ZVCsN8PSzO8fXngQafNpjcZon2D?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd997256-38a9-4379-0299-08db60c290c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 04:01:37.4212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pn6Pn7luJwF2+OUIAELn64QMr8Sd+8fqUJWcI7CFdyMDH9TCX0+ZKMJOPUbJ4LSqRQSR8tHBQEMvRsF/0mEmUqlRsgzFEVJ4KAuFSpU2XzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/reg_sr: Apply limit to register
 whitelisting
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

On Mon, May 29, 2023 at 06:48:17PM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2023-05-26 13:58:22-03:00)
>>On Thu, May 25, 2023 at 10:14:21PM -0300, Gustavo Sousa wrote:
>>>Quoting Matt Roper (2023-05-25 21:10:38-03:00)
>>>>On Thu, May 25, 2023 at 08:24:06PM -0300, Gustavo Sousa wrote:
>>>>> If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
>>>>> slots, then it makes sense to refuse going above it.
>>>>>
>>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++++
>>>>>  1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>> index 0312823101ad..b82f704179a0 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>> @@ -231,6 +231,13 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>>>>>
>>>>>          p = drm_debug_printer(KBUILD_MODNAME);
>>>>>          xa_for_each(&sr->xa, reg, entry) {
>>>>> +                if (slot == RING_MAX_NONPRIV_SLOTS) {
>>>>> +                        drm_err(&xe->drm,
>>>>
>>>>We probably want xe_gt_err() here so that we'll know which GT we hit
>>>>this error on.  Also, it wouldn't hurt to pass hwe as a parameter to
>>>>this function (instead of mmio_base) and include hwe->name in the error
>>>>message here so that we also know which engine ran out of slots.
>>>
>>>Yeah, makes sense. Arguably, we could simply pass hwe as a single
>>>parameter and figure out the rest. Is there any reason not to do that?
>>>
>>>If the above is something reasonable, I wonder if xe_reg_sr.c is really
>>>the correct place to have this function. Maybe it should be something
>>>like xe_hw_engine_apply_whilelist()?
>>
>>As long as xe_reg_sr_apply_mmio() is there, I think we could leave this
>
>By "there" do you mean "inside xe_reg_sr_apply_whitelist()"? I'm asking
>because xe_reg_sr_apply_mmio() is not called by
>xe_reg_sr_apply_whitelist().
>
>Or is "there" the whole file?

yes

>
>>one in xe_reg_sr.c. If we are going to migrate it somewhere, then
>>probably xe_reg_whitelist.c would be a better home so the RING_FORCE_*
>
>Yeah, that makes sense.
>
>>are all contained in that unit.... We could then add a func() action and
>>remove XE_RTP_ACTION_WHITELIST() too. Not sure sure it's worth though.
>
>Well, we could at least do the move to xe_reg_whitelist.c for now, and
>think about XE_RTP_ACTION_WHITELIST() in another patch eventually.

I was meaning more a XE_RTP_ACTION_FUNC() and then it's the caller
resposibility to do whatever they want. Similarly to how we have a func
for the condition (XE_RTP_RULE_FUNC())

Lucas De Marchi

>
>Let me know if that would be acceptable.
>
>--
>Gustavo Sousa
