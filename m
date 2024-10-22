Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2972BD2CE07
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 17:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF0910E339;
	Tue, 22 Oct 2024 17:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfXFzPd6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACB310E339
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 17:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729616712; x=1761152712;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iCltP7amyxU98cy6CsPhTprviQZHUvk+a7D3X5W8uIc=;
 b=DfXFzPd6sTIkH6mT4gvIpjBGyhYqc9jekBh1RPvzQYWrWPTqa/vou0tP
 2KYNPjD7LAVhHHuu0pzMxbKWmzLZUiXLsAdVspXPBTif+xLAIxnJswYPT
 qyclhxeT1h+lp+sYo10OBPaFicYrycCwARu3Qk9E3aLldXV/i4g6CmII5
 MDVsQd9flXEYOO/7xWxRIEBbnrq2jXWycQ3SsWrcHmTpsTQBIctQpxFfU
 wbcjoKH3NPc/SeCQksBKGeiA/mvSqarRloGSOvpr00oUpjpHc5L5TaUeo
 0mIkyL1PPmh6mglnC03p9Ae+hvuW3Xss9l1sS9L9u/kftVXLpX/0JX7ei Q==;
X-CSE-ConnectionGUID: BMohz6hYT76gKw2qJ862OA==
X-CSE-MsgGUID: X8qFdvpPRNqXavjOzld/3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="28602595"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="28602595"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 10:05:12 -0700
X-CSE-ConnectionGUID: XPTXY0vFRL6MJ8qAtCqh9Q==
X-CSE-MsgGUID: hC4BPQdZRLuaJ1TmIP8Zxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84542016"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 10:05:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 10:05:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 10:05:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 10:05:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAlJvz3nrV4UB2KCsYlPcEUArUAEmJtjdZCV5fCFDmC3xMKDehHWjwsRuPBQIPgV7OznsD304SQY3d7EliedZ+a/G3JGxwi/breStUYzExnIHEC4BEcLguGuDP5KatJW8hzis/XiyoMRYGYJOE01Z7YzyWxiZwqAt7qmkJZxahv114yTwYBlvBr68HK1ZTECvf02FjoXBYxzHaHZpEi3TYQFcJmSue3EgfrRVDGwr/Caxb95RFdkxJN3N3JL60jox1DrpndhJKufjbWaV+o3c87jyydakxILv6mdbgg0T4/1YONOXy2UJTxOtsb9fxA260Scymk+AvNALqEXA4xoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8ECgH4R4eLooLLcQdC2w2Dhk0LonpQi6gtVhg7RzIQ=;
 b=yVCc7U4T6MJ5vrwf2TrOYCYcuGai5uS5xQLnHA0glWRJMycleZ+q0q+cgGodI6SyivoMY2KalXG0oVxGD2Td1aPAq3AOcDcIrfUz3eTwbWLgK0H/xY8sOB4+mxc1l6xfMnDu3mREcWZ1sXDYM60+aFIuAyJDg9KQmurVCA/WAInKMpiRLmKylKsxXMTvGA2kTiuaqxoWp39jxl3SCWdj2g51yMbG9EthEW64sbBQEqn9SMsWB8LVHrJa0rJMJAKEaNZFptj5Wg0ccUsozEE3/SBnv0Q2ZR3oygxKs6DrMmgbTHifAdwmUNUQcevJpmYI01WJnPrWabhnd2Q0FwXPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 17:05:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.020; Tue, 22 Oct 2024
 17:05:05 +0000
Date: Tue, 22 Oct 2024 13:05:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUg?= =?utf-8?Q?fo?=
 =?utf-8?Q?r?= drm/xe/guc: Prevent GuC register capture running on VF (rev3)
Message-ID: <ZxfbPq1GtwEcW4gL@intel.com>
References: <20241022010116.342240-1-zhanjun.dong@intel.com>
 <172958839201.1308984.10805647141787789043@2413ebb6fbb6>
 <d0e28830-0ce9-4dc8-a2c8-b4d310779fad@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d0e28830-0ce9-4dc8-a2c8-b4d310779fad@intel.com>
X-ClientProxiedBy: MW3PR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:303:2a::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM6PR11MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e0ff1f-4662-47cb-1998-08dcf2bbac70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f8SjERZvBCqMdYgBv/BIGibaBH3FozdETmEFJstGh0flSGG0JoCDmnPfkxQc?=
 =?us-ascii?Q?eiLl79f10wVSqW4LlBMdMsNDv50oKHeFrc9AznoPVNK25x4SpQfZcHkpHh5p?=
 =?us-ascii?Q?AZyS3vG8KcjHgZjim2e/TZVmIHqAOY8RXtbRpqIuKTf8ZdwJ9nkJ9g68dJL6?=
 =?us-ascii?Q?+JG4D6kNhoSMZl5eUdoh/msZqk28I6uBk+wcsOjgpkYUkD1WaVnTwhTw9Rsm?=
 =?us-ascii?Q?EqAMbKCXXZA6WQXvxP7I+++samj0Ys+r3bZvoIcTqk/Q5zbUgUNoPB8u0w69?=
 =?us-ascii?Q?8l7YrRLhWkejnZdfhh30fN9lYvDrEz9chTva0V5Jk9TDIxeLUZ+UbvrfnxnR?=
 =?us-ascii?Q?+XRxWOWW0W7y5bYAzV3Tm7cVhEGe733l0ncB/7twcV0ujUSe0Vh5mThhawYj?=
 =?us-ascii?Q?Vv7XZej712dOZ4QwCF++FzqT6Mm2yB8WELsc+99KfYxEHBdLIpHPmIqzVdvk?=
 =?us-ascii?Q?g+u6H5xuIXZS5DmdMFjJJS3sE5jP0bhoNJ/K2Na9RbXuh/aHg3sHgpNQzLUP?=
 =?us-ascii?Q?phHRUCLMGC9ZLdyymJoajxk//gweVB2s1+KP/BA7Sx1MR6gWBP9aqqQ5bwdH?=
 =?us-ascii?Q?bIpWVe9YU8N2TvSi8e7uApUyUoNfFYbQDGEd9BmtL1Fv7PtFfuELiB9TfCT8?=
 =?us-ascii?Q?+5ESuZJVWXHvNVUXvTKoqAPWQfclEPOCL1oHZ89HyzqJxqhxS6nhmJuIeWLd?=
 =?us-ascii?Q?dlhsOvrVsuW2RtLp7PQcDv5YSwfk5sI8D9KCOs1Oescfs90lAlgdFXwAruo2?=
 =?us-ascii?Q?IOZRBKn81p3mIYdxfeCltWyDZspTL69FGZLiNUzOsgOJcZsk6wFTqdOGD6bU?=
 =?us-ascii?Q?SrY7U0rED9iWpn7jNx/wrCcQ4P+gJNgPQ3fv/AGbct/q1kgxFDMstrFHtHZv?=
 =?us-ascii?Q?IfRtwnhqkNnlw2OTpuxNssPA+RvwIQlS9+PqkdRpUjb5UMChP5VSOOFAM6Rq?=
 =?us-ascii?Q?xxuh+YJQhQb3sxVZiMYiNYNaGYDs0rJ67G0wcsIhWn3eRuWE+U2RHMfOA0as?=
 =?us-ascii?Q?dE4EbXNSx1Mw3fodxaPpQbKOTl+ubp8C9it1URx+Exk0aC/nTFrAstimOMZ0?=
 =?us-ascii?Q?KwMV5EfvtXBUNhNC4DLavHBP1B+veBYzZ+X9TR2Ca8CIWJjSwxujkjjGTh9f?=
 =?us-ascii?Q?2xbJ24MCHLl6uani4AavPtdU3d8lIkrA5+Vs2dsMShoCF2vY1d81MoqJinV/?=
 =?us-ascii?Q?7AZcmt+dE1yIgDS2WHViJtzmOkkJsuzkicjIDG0ZwiW8ggnFMdjBlu4P55oi?=
 =?us-ascii?Q?Yep08GXSRvgH3vGBg/rhO+jqrW3L4JiyoqYYSbtDCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?56ZvAGx8GixFsny0N8LCqZQ6R2R0F1X0RnfCiT/c0PQByohffo3XkqZAB+b3?=
 =?us-ascii?Q?M0O/XVeU364cNl1tD2WweAw5Hmpjl65yLyotYSg6NicfrQQv3ju4oBLudenA?=
 =?us-ascii?Q?+n3/Oi1C9V4snNlihkYn1NmSfI1NKXn01tcho02BkBpd8Lti/hshhGRDhlYF?=
 =?us-ascii?Q?T9FgU6jFAaEdm9Xhtjn0en0t1duCrtRhVob07Yg/4X9IbxJQvlnDi/FiFwIJ?=
 =?us-ascii?Q?/74z6LKcxz32DvUpaqhfamVc62dqolWhMQNA3hkD282IYyyGEEhQw0adPMoW?=
 =?us-ascii?Q?HD/SiyVIYpT9/HARsiqDVWz26qzGTtT5kMc2BTsD2IahP+02NgHtzB5rVjM2?=
 =?us-ascii?Q?6ZmbY/U3dgVz9neA4+kQalxPv5Jls7fvwaPaNcPHTWB82ywOedh15PODf6Xj?=
 =?us-ascii?Q?PrOY3l5nr1S3EIqphwbkCpDrFujOrRdAtz+aYfT0M0kQ6DXpjAO+vJb/vlQA?=
 =?us-ascii?Q?4WOxmsdlTouBdT6EhcsW7xOd0t/W2WrMiEmeKMXuUUsgcoHOtlh3zrm0BKM7?=
 =?us-ascii?Q?eAsdTIcI4ql4kYZRj2NMIuWGIKMIQScMPOXGPAPMoIvwvR8v5Rg1IWuj+ip8?=
 =?us-ascii?Q?mXZ+Qp6JUco/ljOHkcXIebDQrPoEnKsIXdiQU39UAnuQMCh2RX3Quj9Vap1e?=
 =?us-ascii?Q?MYSuRDhoCKG8oiTYOAQFgeT3Xm7GTxCCVDIhMR43MH50sQNsV/HjSksnxnZs?=
 =?us-ascii?Q?5RdbCI9BllrdvRYkG99kr8tKzgc4YJ+fJx9KNdXWhN+yZs8xAGzxPD68mz6F?=
 =?us-ascii?Q?ajp5OPh1NOaaK+54+eDwxVFvwSqGj2c/5nCABIM01IIxS8HxxifCCmKc1wuc?=
 =?us-ascii?Q?dqJlyxQzKF6JFV9zaxLPliTjaz+TgYiV++4aP4FSqoquTsuAFQkjlObh7yWO?=
 =?us-ascii?Q?gdWNB/m9t2kJLk8P/nwnNMezfUpbwvtOuobrSDj1I/AQ1GMJ6r6wD+NFOVcD?=
 =?us-ascii?Q?DsFemec4vk+AZW01FYjzjC+UbPb3pxRGvtooqb19wirTIGpYwHx702Zp4w1b?=
 =?us-ascii?Q?Z4QVwh9E60g8SxFmouIw0Yw8+AOntcAVycJCHKWQKMbA6ipyB1p1DMfvBiYf?=
 =?us-ascii?Q?Nfjt5CkJk9zJPNj1OI5Iwqf+oBEb/6hOw6CA6rxOHiu/sBv53iUPsyJT+Tf6?=
 =?us-ascii?Q?Mm7J64cy/xqlBeBSdHY2a2u/U/K4pcgYosee0rWUOQPknH44RdV9r+soy9dy?=
 =?us-ascii?Q?f535cwaO8izOxhOQWGu9EP7FoBfAiuykx9xueV2ZoZ8+m+EptlpcASSBJVtn?=
 =?us-ascii?Q?HBR1Jn80Hsk6Ryds+K4ZbIrRNVgu2ZNU6fP3+02rWQK/zSrYKVeUgFB6zsqJ?=
 =?us-ascii?Q?QUjxks14QznPB4CE5EUrEiQgl131FZk+2MRaqaA/xjV6eJQ7YC0j9OM9Uq+9?=
 =?us-ascii?Q?giMlYM2pG+nuUMhkio95wpQlQkg5wNX0aQWXqBz2FFOkKcfXLqURMQ1qg6AR?=
 =?us-ascii?Q?UI7U7UO3CTvUHw1bPEQpH9RiqjzDEksjCJDM2t3asug4cd/jvllBDG89Cfsf?=
 =?us-ascii?Q?F7/waXD9beqZTq9g7SCIluaUKVoTqtg0XhYuAUI1ceoIq36ieicmZE5a0/Pu?=
 =?us-ascii?Q?GE/RH0ssp8NeyNB9pRfnihBeXVZQQEI2GA/X5J1H/R23kVY1vd6+TKYnigLv?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e0ff1f-4662-47cb-1998-08dcf2bbac70
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 17:05:05.0716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioVw1aqdiW4MDUM2vZuzI53KOrbvvf52tGAs5K1shR2E1ZrUY0Zm99c4RB5/20JQXFzPjSOtlUs7Ub0IxHQf9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4514
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

On Tue, Oct 22, 2024 at 10:55:35AM -0400, Dong, Zhanjun wrote:
> All failures is not related to this patch.

Please avoid top post email.

Please avoid cover-letter for a standalone patch.

Patch merged to drm-xe-next. Thanks for that.

> 
> Regards,
> Zhanjun Dong
> 
> On 2024-10-22 5:13 a.m., Patchwork wrote:
> > *Patch Details*
> > *Series:*	drm/xe/guc: Prevent GuC register capture running on VF (rev3)
> > *URL:*	https://patchwork.freedesktop.org/series/140208/
> > <https://patchwork.freedesktop.org/series/140208/>
> > *State:*	failure
> > *Details:*
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/index.html
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/index.html>
> > 
> > 
> >   CI Bug Log - changes from
> >   xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56_full ->
> >   xe-pw-140208v3_full
> > 
> > 
> >     Summary
> > 
> > *FAILURE*
> > 
> > Serious unknown changes coming with xe-pw-140208v3_full absolutely need
> > to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-140208v3_full, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> > 
> > 
> >     Participating hosts (4 -> 4)
> > 
> > No changes in participating hosts
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in
> > xe-pw-140208v3_full:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >   *
> > 
> >     igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp2:
> > 
> >       o shard-bmg: NOTRUN -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp2.html>
> >   *
> > 
> >     igt@xe_exec_threads@threads-cm-shared-vm-rebind:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html>
> >   *
> > 
> >     igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute:
> > 
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-8/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-1/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html>
> > 
> > 
> >         Warnings
> > 
> >   * igt@kms_content_protection@atomic:
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-435/igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_content_protection@atomic.html> +1 other test timeout
> > 
> > 
> >     Known issues
> > 
> > Here are the changes found in xe-pw-140208v3_full that come from known
> > issues:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Issues hit
> > 
> >   *
> > 
> >     igt@intel_hwmon@hwmon-write:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@intel_hwmon@hwmon-write.html> (Intel XE#1125 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125>)
> >   *
> > 
> >     igt@kms_async_flips@invalid-async-flip:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
> >   *
> > 
> >     igt@kms_async_flips@test-cursor@pipe-a-dp-2:
> > 
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@kms_async_flips@test-cursor@pipe-a-dp-2.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-1/igt@kms_async_flips@test-cursor@pipe-a-dp-2.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1 other test dmesg-warn
> >   *
> > 
> >     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test fail
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> > 
> >       o shard-adlp: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
> >   *
> > 
> >     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13 other tests skip
> >   *
> > 
> >     igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3 other tests skip
> >   *
> > 
> >     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:
> > 
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html> (Intel XE#2436 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) +3 other tests fail
> >   *
> > 
> >     igt@kms_chamelium_color@ctm-green-to-red:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
> >   *
> > 
> >     igt@kms_chamelium_frames@dp-crc-multiple:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_chamelium_frames@dp-crc-multiple.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
> >   *
> > 
> >     igt@kms_content_protection@dp-mst-lic-type-1:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
> >   *
> > 
> >     igt@kms_content_protection@srm:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_content_protection@srm.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
> >   *
> > 
> >     igt@kms_cursor_edge_walk@128x128-top-bottom:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@kms_cursor_edge_walk@128x128-top-bottom.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-1/igt@kms_cursor_edge_walk@128x128-top-bottom.html> (Intel XE#2577 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577>) +1 other test fail
> >   *
> > 
> >     igt@kms_feature_discovery@display-4x:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_feature_discovery@display-4x.html> (Intel XE#1138 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
> >   *
> > 
> >     igt@kms_feature_discovery@psr2:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> > 
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2 other tests fail
> >   *
> > 
> >     igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
> >   *
> > 
> >     igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp4:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-464/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
> >   *
> > 
> >     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +1 other test skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
> >   *
> > 
> >     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
> >   *
> > 
> >     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
> >   *
> > 
> >     igt@kms_pm_rpm@cursor:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_pm_rpm@cursor.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-7/igt@kms_pm_rpm@cursor.html> (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) +2 other tests dmesg-warn
> >   *
> > 
> >     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test skip
> >   *
> > 
> >     igt@kms_psr@fbc-pr-primary-page-flip:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_psr@fbc-pr-primary-page-flip.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
> >   *
> > 
> >     igt@kms_psr@psr2-cursor-plane-onoff:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1 other test skip
> >   *
> > 
> >     igt@kms_psr@psr2-primary-page-flip@edp-1:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-7/igt@kms_psr@psr2-primary-page-flip@edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-4/igt@kms_psr@psr2-primary-page-flip@edp-1.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1 other test fail
> >   *
> > 
> >     igt@kms_vrr@flip-suspend:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_vrr@flip-suspend.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests skip
> >   *
> > 
> >     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
> >   *
> > 
> >     igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other tests skip
> >   *
> > 
> >     igt@xe_evict@evict-beng-mixed-threads-large:
> > 
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
> >   *
> > 
> >     igt@xe_evict@evict-threads-large:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-463/igt@xe_evict@evict-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-466/igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
> >   *
> > 
> >     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
> >   *
> > 
> >     igt@xe_exec_fault_mode@many-execqueues-rebind:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-rebind.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1 other test skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@twice-userptr:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
> >   *
> > 
> >     igt@xe_exec_reset@parallel-gt-reset:
> > 
> >       o shard-dg2-set2: NOTRUN -> TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>)
> >   *
> > 
> >     igt@xe_oa@oa-tlb-invalidate:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_oa@oa-tlb-invalidate.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
> >   *
> > 
> >     igt@xe_pm@s4-basic:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@xe_pm@s4-basic.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-9/igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
> >   *
> > 
> >     igt@xe_pm@s4-multiple-execs:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
> >   *
> > 
> >     igt@xe_pm_residency@idle-residency-on-exec:
> > 
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-8/igt@xe_pm_residency@idle-residency-on-exec.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-1/igt@xe_pm_residency@idle-residency-on-exec.html> (Intel XE#2655 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2655>)
> >   *
> > 
> >     igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_enhance:
> > 
> >       o shard-dg2-set2: NOTRUN -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-436/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_enhance.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
> > 
> > 
> >         Possible fixes
> > 
> >   *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html> +3 other tests pass
> >   *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
> >   *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html>
> >   *
> > 
> >     igt@kms_color@ctm-negative:
> > 
> >       o shard-bmg: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@kms_color@ctm-negative.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-5/igt@kms_color@ctm-negative.html> +3 other tests pass
> >   *
> > 
> >     igt@kms_color@legacy-gamma-reset:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-4/igt@kms_color@legacy-gamma-reset.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-9/igt@kms_color@legacy-gamma-reset.html>
> >   *
> > 
> >     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> > 
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> +5 other tests pass
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> > 
> >       o shard-bmg: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html> +3 other tests pass
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
> > 
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html>
> >   *
> > 
> >     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
> >   *
> > 
> >     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html>
> >   *
> > 
> >     igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> +5 other tests pass
> >   *
> > 
> >     igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
> > 
> >       o shard-bmg: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html>
> >   *
> > 
> >     igt@kms_hdr@bpc-switch@pipe-a-dp-4:
> > 
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-435/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html> (Intel XE#3197 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3197>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html> +1 other test pass
> >   *
> > 
> >     igt@kms_plane_cursor@primary:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-1/igt@kms_plane_cursor@primary.html> (Intel XE#1471 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471> / Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-8/igt@kms_plane_cursor@primary.html>
> >   *
> > 
> >     igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-1/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html> (Intel XE#1471 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-8/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html>
> >   *
> > 
> >     igt@kms_psr@psr2-cursor-blt@edp-1:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html> +3 other tests pass
> >   *
> > 
> >     igt@kms_vrr@flip-dpms:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-5/igt@kms_vrr@flip-dpms.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-8/igt@kms_vrr@flip-dpms.html> +3 other tests pass
> >   *
> > 
> >     igt@xe_evict@evict-beng-mixed-threads-large:
> > 
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html>
> >   *
> > 
> >     igt@xe_evict@evict-mixed-many-threads-large:
> > 
> >       o shard-dg2-set2: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html>
> >   *
> > 
> >     igt@xe_evict@evict-mixed-many-threads-small:
> > 
> >       o shard-bmg: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html>
> >   *
> > 
> >     igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
> > 
> >       o shard-lnl: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html> (Intel XE#2687 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-5/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html>
> >   *
> > 
> >     igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html> (Intel XE#358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html>
> >   *
> > 
> >     igt@xe_pm@d3hot-basic-exec:
> > 
> >       o shard-lnl: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@xe_pm@d3hot-basic-exec.html> (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-lnl-7/igt@xe_pm@d3hot-basic-exec.html> +2 other tests pass
> >   *
> > 
> >     igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_decode:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_decode.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-436/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_decode.html> +1 other test pass
> >   *
> > 
> >     igt@xe_vm@large-split-binds-2097152:
> > 
> >       o shard-adlp: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@xe_vm@large-split-binds-2097152.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@xe_vm@large-split-binds-2097152.html> +1 other test pass
> > 
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>)
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> > 
> >       o shard-adlp: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> > 
> >       o shard-adlp: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) +1 other test dmesg-fail
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
> > 
> >       o shard-adlp: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>)
> >   *
> > 
> >     igt@kms_properties@connector-properties-legacy:
> > 
> >       o shard-bmg: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@kms_properties@connector-properties-legacy.html> (Intel XE#3189 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html> (Intel XE#3108 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3108> / Intel XE#3189 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189>)
> >   *
> > 
> >     igt@kms_tiled_display@basic-test-pattern:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v3/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
> > 
> > 
> >     Build changes
> > 
> >   * Linux: xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56 ->
> >     xe-pw-140208v3
> > 
> > IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56:
> > aa0898115bcff3eda6d021cc66eb8a1c3b264c56
> > xe-pw-140208v3: 140208v3
> > 
