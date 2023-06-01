Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DFAC77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 16:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575B710E57A;
	Thu,  1 Jun 2023 16:48:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B938E10E57A
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 16:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685638105; x=1717174105;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9PEDm4CVvxxoDthMbDbGUYucGGUn0JPFTnhUV9RrtYY=;
 b=hc7ZEXjqXDwhOrTZBFi0z0YEjQG8aGnxjb1qRVJCnwObtkDAfzNwtGki
 exJWZ13vQqBdjPzNG7P6qCvex0x5ASNCPPW4rW9d6Y8W0eL92CKPfvaDO
 orKEPnaNRkw7Fum+NyOzfi6SODzrbJ2WrWBILjOhn4Q6aLAaRz6NkwpAe
 QK2cW1Ikn54xt5sczJZiTJqCZ3dGp0IrVmSXANs1L5FJc2YHlXQq1jz7Z
 wIk3kyldKE9N2EZYscBIg6BLcfd5ZeIo1S3YB60ojOlVb9du+TBw2amYE
 1T7Cn5GivvWcHJb0yRpgnLIxtcgJMAEPa9PeSZkUw8yAxkuw7IgZrH4KG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="355632275"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="355632275"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737175506"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="737175506"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2023 09:48:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 09:48:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 09:48:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 09:48:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN5autFRVokpz/fZrNu4/ty/3L9idt2PyAAygyOUOAGxKfmVUf2ijQep2iZDuL55aPLkzJdYPHnGOXzQWa7h9JNIk79f6Oya6SKxtN1sgmGT3UmTuHMPzhLXqwwcfw9Qdny8eM6QNbjYfha26lsb/CocRIFBtJFIhbdmZ5mIhcRA/PWDNRZbKLtgdN62IkwCHdxB4LPqVudwpl1E5QsCbenrrdDwIQRq1a5wrgnHT3tGnl8kfPBKQxNqXDckitTkgIF/VLVekJXFXfIYpB2avxdtXjiSnETz6CdW5W8UZ0kcOYpl6EDJIvP7WucsiCPPkcMB8ckpNJMMd459Pe6tpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mr9EEYskilBISgkv2sOu+Aup4Kx6URXZXDuSv6AYcg=;
 b=C0pYdtYdPud+fSbl21GHP8WsMJCgYTqCT8EPqh1HE6bsqy2bjYQJqGvHSTXXhbLPv8kkSFHZy+gzrnMcNEwrJWNxEKb3V4d83Iv/O0cjnDq1XJS65tdYrUKamBcp6BZDLb5f+gVdFjtwI89l8txDHquYGjCzQxxpnmsn4Ip8agm+FyZ1hOkou7Xa5NvuvCnoY2+XTmLh1tp+CcAt8in9Fft1ruRgT6thDdMT2xFLfwNCNKiMG0cJlD9rFa1mGM+5j/6RYLUCT4Od39VQE+DaQVIwRLBvDi9bckFQ1jEA2p77J+qFiSM+fzqhQaeG3Zaz43eAotOfz7kDUc0dqHgG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6908.namprd11.prod.outlook.com (2603:10b6:510:204::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Thu, 1 Jun
 2023 16:48:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 16:48:20 +0000
Date: Thu, 1 Jun 2023 09:48:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Message-ID: <sptofjhqdc5kjs6fm64ueghqluyi3p7g6x2d63nxruxxp6zzlq@fktu4g44adrs>
References: <20230531152338.6-1-francois.dugast@intel.com>
 <uieo7p5pwbj252uxdtmyyozj3crbbrkcm4uevookml3vxqj2ik@c3ilb7d7okcl>
 <ZHd9u1AdemcPGPn3@fdugast-desk.home>
 <jjkmqjebxtljdu4chzjuj7a56xbpttd7wf3wqh6o7ciigb55ur@pgci7bqedka6>
 <CAFCwf11Cz8=3=nnhCTGKN9Coz_dsZL7XcAc9HFyayHRcUCioCg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf11Cz8=3=nnhCTGKN9Coz_dsZL7XcAc9HFyayHRcUCioCg@mail.gmail.com>
X-ClientProxiedBy: BY5PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a08fee-28af-4c66-edc0-08db62c001bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kHIn8NJrnzKFfK5xLAGexgZGMnAu7BY0PRgluka0F2tMqSMQ4pYBlmmBXQGfHZRKFITGRyd4osQ8c5w+3IuGo0BPyTCGcEGqj0zh/4hHWFJ6jtJGLwY0AdETbnQ1AfNHhdMzR0TQWir8L/th3L5iSESxgATe9360upt/da1/f3ZE2u+zMEWgDyanq9k6lv9G95YOTvJ5pVCAlUh6HRUh7/2ff/P6g5pS+LW90x+Dx6WINBwngiknzA3+0Q1K89j9P1rnnks9LtBhTMGM5jr0390LSI/4SfMMrl4nTMaqA00izO9jbopNaE8AtmxBXXJ1KIPJjPvM14DEa0ukEurxshxZlxN960A2MwYDwhy0kUh+nFj36ZK0yeGaH5jan4jIuHghuzhZOGma+AfJvG00gT52uaTcCq7G4RKAIYcWYUkYwcXbtPr6+no8djvHyBxpmo49iPYR3XNaq3fdnbSFsKwIPkTOBDTRezFzWq57ba27GhAq1vRaKlY1WsKkUSkCAy0YzTaT9hfMaeQCXSWqkfAErw43CK/hpvWDMdx6k6Gqj9cWycAgleGLqxfTy3ZaiqtND/TZP6c1P47CyEUVkrin/bmsQ1xkO+Rt5mj6NSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199021)(6512007)(26005)(9686003)(6506007)(186003)(30864003)(2906002)(66899021)(478600001)(83380400001)(86362001)(8676002)(8936002)(966005)(6486002)(41300700001)(82960400001)(33716001)(66946007)(38100700002)(5660300002)(66556008)(316002)(6916009)(66476007)(4326008)(60764002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVpvbGlXZHVyS0ZMTTJzaGhBcVdXd3JEcEtpTFlodWRKSSszMlpLZFlwVk10?=
 =?utf-8?B?Z0RxSExEb2JZd2Z0WDJvUmE0WmNPUmVmWUtsL1F2R0F5cjdTcS9VRWx3UHY3?=
 =?utf-8?B?UXB5MldDRnkza2lHSzZwZm5DUWhQZkpoQWlLOGdndmpCL0ZKRHVLSURzUFBW?=
 =?utf-8?B?eVVFT3F6aTRjciswWGRqczFscW9qR082VS9YUGozZE9tRVpPd2FuNmxwcUhw?=
 =?utf-8?B?azBuaHVJRDJjL1hNcml4Wjd5VVU5YjhvbDJQdHNpdExMZFpJdGdTMkZZSlF5?=
 =?utf-8?B?OC9Mcmp6aXprR0ZiYlYydTFybVI4OGFWRmdOOXNlUDZ6VXNLNzVRdVQvdUdR?=
 =?utf-8?B?QldoQjI1ZWlwd25vQUp4dDhaSHdJYy94eVVyQUZoMHJrNHpjSFo1cjR1bG04?=
 =?utf-8?B?ak9qUXAxeUcwb0tWZkdPZTdhYXVHaUF3eXRDU2NJY1hzYWVXR2ZwY2FTWXox?=
 =?utf-8?B?R3pDQUdqOENPVW1nOWZ1YVhBRy9GVjBHRnZMamc1RzVTZm00QnlwRzd5RWQ3?=
 =?utf-8?B?alVsUnFrcnZVeU91OFhQRVRWS0JBMXV5ck5yR0FIODNma1phRGZuWnFQMmRw?=
 =?utf-8?B?Y3pjQmdnejF2T2ExenlPN2Qrekk5MWRpQVBWVWF5cVVEKzBxdm9HZGZzc3BZ?=
 =?utf-8?B?Rld3TEIvQzdFZmVUeno5RUMyUkZHSUxodFNvcWFXR2ZNQnBZZGVoR2pvV1Z2?=
 =?utf-8?B?TjAyYkdJeGdXOXJ4WFh4L1RpUVNQTnZQd21VNkF6SVQ1Ni82NUxob1MzSDVR?=
 =?utf-8?B?TnNiLzdUTXhTQjBER0RmWTJiU0lSWGQvcEdxUnptRGRNSWh2U2pyaEk5RWVL?=
 =?utf-8?B?bmJyYWhzSTFRc1VUTHp6bysvb0hqOWZPTDZyZ0lMKzEwbFNlVWhXTGFIQlNZ?=
 =?utf-8?B?RlR6QTErYjg2ekZNTTJUUlRLVUVOOWkxelExMmpldzZLeERnUURJSFZwUXYx?=
 =?utf-8?B?bVRnckljbWxxRFl1bExMK0V0MlF3SmU5TWdrUnR4VDNFSEV0QXF2STI3U2J3?=
 =?utf-8?B?OFlzOUpFd0pzOWh4TzkyOHVpV3pFK1ptTkZiRFhReXhJNHVaeDloODkwMStz?=
 =?utf-8?B?UkZEMWFIWVF6U1ZRaFJlendwa3YyeVNvWHFVbHNxYkxheDMxNXdMQlIxZXF3?=
 =?utf-8?B?VGFEaERENUJZUFBSTEp5RGc3cW5wQXdBcU9EUzI1S1JJQXN1VG9QVDRGNWsz?=
 =?utf-8?B?UTgzRlhKN29oQkJpbUlRL3dwYUo3SXFRdlVPVmhFQ0ptN05xS1QzZTJDSlow?=
 =?utf-8?B?Q3lkbWYvVGg1S1h3UGQzM3Q1MXZzbGtyd2F5R0EvZnV0QVJ1aHRZTkxJMENu?=
 =?utf-8?B?bCtncHRuaEZTSVdLN2M0QjlHUTV4MXBORGlEaUtKRXVkZDltU0lUQktQVVBz?=
 =?utf-8?B?NTF5VnI1d2c5Q0U2ajZiTmdrQTAxdkZnWFJieHFGMzR2UnFZWmVMUGpOdzlh?=
 =?utf-8?B?Q2pucmxqVWEvUVVsSjBoajQ3RVp4WS8rTjZaY1JxNkc1SjJmZnNZcmRvU3g4?=
 =?utf-8?B?RlhTVzhlaFNuU1ExNnpyc0grSHVsaUp6TzBFNDRxaUVjQVUxZGZraVpVd0ln?=
 =?utf-8?B?aDZ0TTNTK3AxUzdpVnUzUW5VV3NGWFJvZE5kYmU3RVdId3dJakhBYlNXVzZO?=
 =?utf-8?B?T3JQVHdaYk9rTm9QSlZUTVRROFl2WVRNb1l4Q0tiSXR1d3U4SW54ZUE0QnVv?=
 =?utf-8?B?ZE5uSlBnRFY5VzBnVEtrM3JqNkpWdklMdVB3VHhOV0R5c3JYMi9jV2R3Q2pk?=
 =?utf-8?B?RW9TNzE5bVNvNzBxQVVEVkFEd0pJbkJzUHhvWm1ieWtEU3FtQUlCY3VkSjJ5?=
 =?utf-8?B?MWN2OGR1anloaWllRVF1NlhzMUxKWGhGc0M2WEFRQ0h4OXFQS3pRNzZ2Zy9p?=
 =?utf-8?B?aTk5OU9Cd3RZNnpmU29Gd2tnZnNkSHZEaFRHRzU0WTZhdDZnVm1mWnljSlli?=
 =?utf-8?B?dmpSdFJoNEVvOXZsMXpFSm5pMHdLUVNIUENKVFM0b2t6K0RKeEMzdVNJbnB6?=
 =?utf-8?B?RktYMDA4clhsV3puR3h0dDN1OERMdTV4ZUU3bkpaQmxMQllJeDhLRmFacXVS?=
 =?utf-8?B?Skh6QUpYL3I3cnJWeDBxY2dNVG16cDc2OWROa0l1bzBPcmV2QjU5M1VMS240?=
 =?utf-8?B?Q2Yxa1czR2ZHaWJvVmpraDBnSUc0VTZCeS8zSzZXNGFaN21kOGFjNWhJVk1a?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a08fee-28af-4c66-edc0-08db62c001bf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 16:48:20.7897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHbC/AEbkq03PsFh0muFQHbiOFgV3R92DMctiM5c5DakcsHdVXfepimGYz5AA+IL65tgb/+3RikbnpjkWDkkhiLA1VEGyMGoBXgvyi+wpn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6908
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/5] drm/xe: uAPI cleanup
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

On Thu, Jun 01, 2023 at 01:21:06PM +0300, Oded Gabbay wrote:
>On Wed, May 31, 2023 at 11:29 PM Lucas De Marchi
><lucas.demarchi@intel.com> wrote:
>>
>> On Wed, May 31, 2023 at 07:02:51PM +0200, Francois Dugast wrote:
>> >On Wed, May 31, 2023 at 09:23:45AM -0700, Lucas De Marchi wrote:
>> >> +Oded
>> >>
>> >> On Wed, May 31, 2023 at 03:23:33PM +0000, Francois Dugast wrote:
>> >> > This series addresses some feedback on xe_drm.h provided here:
>> >> > https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>> >> >
>> >> > It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
>> >> > likely break CI.
>> >>
>> >> As I said on the previous reply, this is not going to fly. Now we have a
>> >> patch series against xe-rev1-2023-05-02, pushed as xe-rev2 branch with
>> >> *no recorded reviews*, doing things that already conflict with other
>> >> fixes that landed in drm-xe-next. Examples: the 32b compat for uapi,
>> >> the mmio refactor, the oob WAs, the probe refactor, etc etc.
>> >>
>> >> Also, there are other fixes queued as fixups, which is still the process
>> >> being used in drm-xe-next. It's also where CI is running. Due to display
>> >> being moved up in the branch it's basically the only sane thing to do.
>> >>
>> >> I think we need we are shooting ourselves on the foot and this review
>> >> process needs to be fixed / agreed upon before we create a mess out of
>> >> it.
>> >>
>> >> Lucas De Marchi
>> >
>> >Yes I understand the concern. The intention is to address Oded's feedback on the
>> >revision that was reviewed, so that the next review iteration is manageable and
>> >not based on a moving target, which could lead to and endless effort.
>>
>> and then what are we going to do next? rebase the rest of drm-xe-next on top?
>> How do we guarantee the fixes on top of xe-rev is not breaking stuff?
>> What about the changes that are already there changing the commits that
>> are on xe-rev?
>>
>> >
>> >Maybe I created confusion by sharing on the mailing list but at this stage the
>>
>> no, that was the right part of it. Reviews on the patches happen on this
>> mailing list. The wrong part IMO was to push it as a branch before it
>> got the necessary review and before we know how we are going to
>> reconciliate things. Rebasing drm-xe-next on xe-rev doesn't
>> really work for the reasons mentioned above.
>>
>> >idea is not to get this series merged, only to get Oded's validation that it
>> >fixes the issues that he reported. Yes this means more work will be required to
>> >rebase and create fixups later for drm-xe-next but it seems acceptable for the
>> >work that has been done so far.
>> >
>> >Do you see a better way that would still satisfy the "not moving target" goal?
>>
>> 0) Ignore the "not moving target" goal
>
>Hi Lucas,
>I would like to say a few things.
>
>The first point is that the current xe-rev1 branch was something that
>Rodrigo and I set-up. If you feel this is not a good starting point
>for the review, let's talk and decide on a new starting point. Even
>though I have already invested multiple hours in reviewing it, I can
>understand the point you are making and I'm willing to re-start the
>review with a new starting point.
>
>The second point is once we make a decision regarding the code
>baseline (keep using the old or moving to the new), I want *all* of us
>to agree that newer patches that are sent to the mailing list will not
>be part of the initial Xe upstreamed code. There are mainly two
>reasons for that:
>
>1. There is a long-standing process of upstreaming a new driver to the
>Linux kernel and that process assumes a code baseline that doesn't
>change between revisions, except for addressing code review comments.
>As a person who has undergone this a couple of times from the side
>being reviewed I would like to follow this same process here as well
>:)
>
>2. The Xe driver is one big driver, with a large team behind it that
>continuously sends patches. The code keeps getting re-factored and
>acquires new features at a high rate. If every revision of the review
>the baseline code will change, the changes from the previous revision
>will be too large to review independently. I will have to review the
>entire driver again... Not to mention how will I be able to easily
>verify that my comments were addressed properly (btw, I also wrote it
>here https://lore.kernel.org/intel-xe/CAFCwf124UMR3VQ=Tr6mT_eTRQi9ssqZqEH4jys1bGggHJjboLw@mail.gmail.com/).

Let me use a few examples:

	22ad50d184c0 ("fixup! drm/xe: Introduce a new DRM driver for Intel GPUs")

Do we want to leave the commit "drm/xe: Introduce a new DRM driver for
Intel GPUs" as part of the original and then have a Fix commit leaving a
few hundreds of broken commits?  On other "first driver submissions"
I've seen that would be frowned upon and it would be expected that this
is fixed inplace instead of leaving broken commits behind.

	a00a92181ab1 ("fixup! drm/xe: Introduce a new DRM driver for Intel GPUs")

Same thing: a nasty memory corruption lurking there. Do we leave it
broken?  With the previous (current(?)) process we were actually adding
these fixups that are later moved back in the git history so things like
this are never part of the upstream code. Looking at xe-rev2 branch
being pushed without any code review, why is 83ac6e02bf5e ("drm/xe:
Remove unused define") more important that deserves being brought back
to the original submission?

Another one that comes to mind: the engine vs context name that you
raised on the other review and I pointed out to the history: would it be
something to be changed on xe-rev branch and invalidate the other things
on top?  Or would we better change this in drm-xe-next?

 From what I talked with Rodrigo before, we'd actually discuss and agree
about things that needed to be changed/fixed, particularly on the design
and interface of the driver (with drm subsystem and with userspace).
Line by line review with non-critical things would then become gitlab
issues, like when Matt Roper went through a similar line by line
review and Rodrigo created a bunch of gitlab issues that are being
solved in drm-xe-next.

>Therefore, I think we need to agree on some method that won't burn me
>out and cause me to tell Dave & Daniel I'm giving up on what they
>asked me to do. One way is to follow the rule above, but if you still
>disagree with this, I'm open to hearing other suggestions on how to
>enable a proper review in a timely manner that won't cause me to pull
>my hair out.
>
>In that context, I feel your "Ignore the not moving target goal"
>statement to Francois was inappropriate. We need to have an agreement,
>you can't decide that on your own.

What am I deciding on my own and why was that inappropriate?  I went
back to read again what I wrote to check if it was badly phrased, but I
don't see it that way. He asked my opinion on a different method, which
you are also asking when you say "I'm open to hearing other suggestions
on how to enable a proper review in a timely manner that won't cause me
to pull my hair out". If you hear and disagree, I'm totally fine with
it, but asking for it and then saying it's inappropriate to disagree
with the premise seems odd.

I went on and explained *why*, saying that the moving base is already
there and IMO a better method would be to accept the moving base, with a
different review method. And if you look at the proposal below, I'm
actually removing the "moving base" factor between what's being reviewed
and where the rest of development is happening, CI is running, other
review comments are being handled, etc.

What I'm currently seeing and I don't agree with:

- Commits are being pushed to a xe-revN branch bypassing code review

- Since CI is running on drm-xe-next, it's also bypassing CI. I was
   part of enough upstream submissions to know our ability to break
   things when handling code review comments, which is only noticed later
   when the rest is rebased on top and CI is running again

- drm-xe-next and xe-revN are not on the same baseline. If they were,
   then comparing both would be trivial and we'd probably not have
   this discussion. Question here on your process: currently xe-rev
   is on top of drm-next-2023-04-27, which is on top of v6.3-rc4.
   Is your intention that fixes (to only your review commens) are
   accumulated  on xe-rev* and then propose this to be merged to drm-next
   when that is finished, without any rebase?

- changes to "the original submission" that from my pov some are good,
   some would better be discussed and some that are not critical
   taking precedence over others that should really be there. And that
   is happening because there is this disconnect between drm-xe-next and
   xe-rev as per above.

- the disconnect will only get worse as we are on 1/6 batch of review
   comments so I don't see the process scaling well.

Lucas De Marchi

>
>Thanks,
>Oded
>
>
>
>
>>
>> 1) The review should be on very a recent rev, not something old with a
>>     lot of commits on top. That doesn't scale and there will be another 100
>>     patches before the next review round.
>>
>>         $ tag=xe-rev1-2023-05-02
>>         $ s=$(git log -1 --format=%s $tag)
>>         $ commit=$(git log --grep "$s" -n1 --format=%H)
>>         $ git rev-list $commit..HEAD | wc -l
>>         208
>>
>>     Then as outcome of the review we have more patches to land, rebase
>>     the rest, etc, etc.  This is a much worse "moving target" and IMO
>>     it's worse for both reviewers and committers.
>>
>> 2) The xe-revX should have the same baseline. That makes for a really
>>     simple way to check "what changed since I last looked". This can be
>>     checked on the overall diff with `git diff` or on the amended fixes
>>     with git range-diff.
>>
>>     Currently drm-xe-next is on drm-tip due to the display integration.
>>     Being on drm-next is important for merging the branch upstream, but
>>     not so much for these kind of reviews
>>
>> 3) Not merge things in the xe-revX branch that is not already
>>     in drm-xe-next.  Ideally if there are things that really need to
>>     be changed back in the xe-rev branch, it should be a fixup on
>>     drm-xe-next that is then brought back to the xe-rev branch.
>>
>>
>> Lucas De Marchi
>>
>> >
>> >Thanks,
>> >Francois
>> >
>> >>
>> >> >
>> >> > v2: fix ordering of defines and fields in uAPI (Lucas De Marchi)
>> >> >
>> >> > Francois Dugast (5):
>> >> >  drm/xe: Use SPDX-License-Identifier instead of license text
>> >> >  drm/xe: Group engine related structs
>> >> >  drm/xe: Move defines before relevant fields
>> >> >  drm/xe: Document usage of struct drm_xe_device_query
>> >> >  drm/xe: Fix some formatting issues in uAPI
>> >> >
>> >> > include/uapi/drm/xe_drm.h | 171 ++++++++++++++++++++------------------
>> >> > 1 file changed, 90 insertions(+), 81 deletions(-)
>> >> >
>> >> > --
>> >> > 2.34.1
>> >> >
