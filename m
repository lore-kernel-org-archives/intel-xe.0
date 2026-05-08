Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D495DCD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 21:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9020310F60E;
	Fri,  8 May 2026 21:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDS1I/43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301B010F604
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 21:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778277157; x=1809813157;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=66hki6gH6y80idu+S2Gwk0bUhierssL3vO1XHDSeZC8=;
 b=XDS1I/43j3Ur0otcKOxoxbugouodg00/O6FThZLchVgae+mxg8ayOsgS
 LaODdHMbmdGo3MCKUjlbmEIPK0CBbVHiiI40EMyncjfVwu3mhsq/PHZxE
 8nPAaChwWdT7upfjWMB6urjckOMDhXBcozSPhVXg6Qnx/ORCnnc37g/EO
 LnWMmBbXlIJ6pry/qlU7fUqhZ3XquiXt7g3pMJzeDYXta7K04tYWC4UL1
 +ABzvLK4JhUZNxQ8QvvbHJrEZ3MjpVo7j4pQsS+6bm1Fy2rhUOhN4KtN/
 jygqOFj88wnIpQt5PL7ryYdDhpzLT60TD2KjzgwgiMs2OswSf4ILBB1qI A==;
X-CSE-ConnectionGUID: KTA3BSE0RrSrU/BVsvHvfw==
X-CSE-MsgGUID: R/OytmFWSEqLfLofsaU/QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78282680"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="78282680"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:52:37 -0700
X-CSE-ConnectionGUID: cpF27jeFST6ZZ1U0AxObHA==
X-CSE-MsgGUID: sXOT7khERqyrvF9JEpW71Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="240859377"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:52:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 14:52:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 14:52:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 14:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2kRjdMoxL783yWUje/vPGtA2RrFsDGr2FuH/geQxzGsCYjzqYk1xOnpypRLaBIXg9X5buNEHWFSIoiaBD9iIckDguAkYMjXy8AP0NAcztCq5kBDyjt0Po6/QbKpaSM4VUOULCFKYMDnFdn/5/yNaRnrkQaSEyV703RcgEp94vxgO9fsPlT8KMImkseniuU0zQ977VLG0H9zjbDwurOig2o8UX8klfF67ja/HRZR9OfR6e5n778uxIBgb3EX8gou3FpGIz2gsWLeIYFl3E/44smU+gV7M1s79mGOqviYtFxUyqnnRUT1G+gDNecRGn8WhG/qbhYVcjm33KFZByWz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfTACcl/AN0cDjLu2+A1AqnczUrzbvDe53qN5RMrZAY=;
 b=L18WVveYK70G70Q7THQFjMlJUcchjQsG5Zo1t6/uFctLwzQD+dCL37VDavA7qeXfWRQ23DmHdGhZrE6vOHG0oAHyadmaAGE+6B2ZQljyF1zWUfEx4VPchIO4cW3xNsxVoGgYfs1KMv1XlobTAGu2lwzWB/ASmeMUGAGTjAVQfh+OolbSMnFzJUjSSjOCb+WamQB+4dYOnVVM0hzCuEtIsikdZNilNjEqhmrRU9WUVsa+9zwDdBQ2chJPFIC4VpwOVS1rSQZ4J7R0LbVK9Ibv+4zETb02lmzD2XM94uSmKUvWN55EAOUh2QaMLSaDtryYYJ3lSTD/ukO7y6if7UDzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CHXPR11MB9652.namprd11.prod.outlook.com (2603:10b6:610:2fb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Fri, 8 May
 2026 21:52:29 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9891.015; Fri, 8 May 2026
 21:52:29 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 12/12] drm/xe/reg_sr: Do sanity check for MCR vs non-MCR
In-Reply-To: <87ik91y7c1.fsf@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-12-d420b9c1a327@intel.com>
 <20260128235940.GW458797@mdroper-desk1.amr.corp.intel.com>
 <87ik91y7c1.fsf@intel.com>
Date: Fri, 8 May 2026 18:52:26 -0300
Message-ID: <87fr41o9gl.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CHXPR11MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5ff7f4-2f61-46f8-2e3a-08dead4c1985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: JsvKe+dUy/US94MMLjwUAQ1aMhvRe1jX3jTjc1xuiNnUTI81MBYNraZ9QQTKyuvKbe5P+h6YbseFn9AkeLnqhmJjkdkdgzd6IXz+yrmXWFOKnVee0A20VkDQD1GcrZAec2zvjgjHb5K4TcQs1U7MckUZd9hAFOz65AfY7ok1ITDoKZT4U+oLeEGWVreO4uFeFoAYUDcDRMVqSQUOoM5s4I9GtXFBoMWYqScOYQ9Cec1x/E1LCIjP4QTuVzOfRkxDXhKxPl4g3C6Mj5igkf8lJxExX4V2c9y98Wi6DUs7kgbDeSZuZkAqwTMTe6LscqzEXNRBPou1AsNjKcuWAoPmuwba+RWZ+AVGEBksaT37kDhj5orrOjKVOQrbuOGdoQHA1FYWmPUoBBfRb+7jmAv9ziHECJXH1PPk/R0OsVIjy7wEevVuxM1E/dGRbE34O0DvCIy5ch+AC2Ibsp44nHgorS7qmzt8x6hnl9m6dSYRMXDIDsjHzrNyylyFijF23o0KHJHrAQ8FV7+kcsl3XXmOGBfVW2T7IT+yWeOQjvik3wKjbMqQ2v3jHBxCzEfe7mLdmZry/oJ0BGOq3CJBBdmQjcdxXNcic8qc/Ux+cWHNu9uBnlBihHzcwysmOe6w05iDfchgtMWAEmHPmsyg+LN+piiFPUVnELtqce2TknBdXNTmq7r2SaR+OFafzDdiLrS7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDVnRTJNM2dnN3JUc3hhQnh4TngwTUw1WmhDOUJzSFU2RStzTVp2U2pkeS9r?=
 =?utf-8?B?b0NaL3hxbTN5OUhCT2NmOURaV21NUzIybDB4eHoyWmtsaHQ3Mk9oM0VXRmx4?=
 =?utf-8?B?Tzg0eHE1RVpQR0JQdDZvcy92bXBKKytSMS85bTNHMG4rYUtsSGxldGdaZzFB?=
 =?utf-8?B?OVVYc2JhTm9sZ2psR1h1Vk1XNVU4VTNHT0hwRDJMWTh5amZIRzc4WjY5TG44?=
 =?utf-8?B?TW5NMzFDSmp2RUNQek9xVTZiMFdYTjVSeXN5RHVCcDJnWkpYU0Z5QTltaUlj?=
 =?utf-8?B?YzhOZCt3cmZ1Y2luVkpNRk5Tenp0eXZING9uYlB6NlAxWDV1aGRFUnVhNk5w?=
 =?utf-8?B?eWRFbDF2R0hKQXBhcHlJSVQ5MFFnalFoMVBzUDhiSndldzBSbzh2cFB1WllM?=
 =?utf-8?B?RFlUbVRlcDIyMTZJb2k0TUhLeEZkZy9PbTdxTWFabElYT0RaQUd5NGtabUN4?=
 =?utf-8?B?WlM1bVlwMnBDVTdacTFLQ3Vxai9SQ0ZQU05RM3I5SXFMMzE1Q1VEMmszWnhi?=
 =?utf-8?B?amwvQUZtN1JwY2s2cVlLSDlyRzBTUlhmdi9EcXJhQUt5Nm5DM1orSE9oSXpz?=
 =?utf-8?B?UEdmRWZnTDg5NEdNY28ydlNMWkI2a01ITVBZUTBFdGJyQTZZWXcyMTZUT3lr?=
 =?utf-8?B?U0xrUkIrdGM0dHVVRWNCQzdaTm1IZjA1d0hDRFRhamxkeXMyZHFhYlFlQUNV?=
 =?utf-8?B?TXlzYWRtYkpRZy9hVXg3bXdqa1JaNTdNaXdidmtoL2ZGZzF0dnh1bTlNcTRF?=
 =?utf-8?B?R3VFdmFpeXU0RjlhdHRsbE9iOXBOK2hPVWtRZmZ2SGRYWmRnYVkvbnJmdGZa?=
 =?utf-8?B?RXdVTStvc2g2eEVMVTJ6Z3VKVHB0eFRwV1ExRDdjcjh1UEgxYVdlczRRNDdS?=
 =?utf-8?B?bzFBVFNhMlgzTXNQN2RWVy9MQUQwZ1pxcGovcVpHMUR6NTlSNVdCWU5UQjIy?=
 =?utf-8?B?VU52RU92R3lRYkJBUmpSMER3YlkwQ1ROYlRWTHM4aW5jVklmLzh3SkY2YTc5?=
 =?utf-8?B?OEluRTBkNlZ6alhlMjM3VjZKNkx2T3BOUnpRSDZlQzA3UndjbXQxMytHYWJJ?=
 =?utf-8?B?MnY0Qi9VMm43RFJvVHJCUXdiVENiY3h2dStzcUJlRHBXNmxpMC83WXdjZ1Ns?=
 =?utf-8?B?ZE9Qd0N6enVhTGZsRXRYY1FXVi9TWWMzaUZ6Q3ltQ3RGY1BUcGpxckRBd1h4?=
 =?utf-8?B?TURzcksrbkNLblA0Sk1MYk1Ud1pmSlpKNnZLRFdQNWpEVUJoUTM3b2FOSHFr?=
 =?utf-8?B?OHY5UXJ0YytkbWVNK3FnQlpyMllEOUJOaXA2VjFlVENBNk1rT2Q2V050TGZF?=
 =?utf-8?B?TEkyeEhzM3dFbm8zb3BPRHVSbSthZXNvMU1iMDN6S2pPcTV2QWY0NlR0WjZz?=
 =?utf-8?B?ZVhKL1VWZ2FWNG82MWhoLzlJd1VhUFUrSkU3R25KMVRNQXg0T0RTVUJlcS9k?=
 =?utf-8?B?cjJNVG5PbkdVbTFnb3FtYTJOdklwQjc5WmliZGtBMW5xQ3VFaXZ5alhZdTBx?=
 =?utf-8?B?VnBjNE50TUJqWmNiZG1SNFlTVzZVbk5YMDJnMDBqQ1JxR3M5Uno3aVZ1TjF2?=
 =?utf-8?B?eWpJWVU1ck0vUEpoWHJEOGNzS3A4MEcvSzFLTlZBUmh5UE1lSjVNbTF5djZ6?=
 =?utf-8?B?Nm5YTmJlVnJRbnIwR2RZZXZyUGNnd09ndWRIdG8zM0dwb2tyTXZ4MkhFc0tq?=
 =?utf-8?B?bjJ5bDlMdWgzaHlvVE9KcjJLckZDN3dyd3ZwVnR4VlVDRGNNYTVkSUZGWXpz?=
 =?utf-8?B?QWJJOTMwTlZIdnpZSWg1ZldJMERxbE5CMUF2bDE1Q2xoWWs4TzdVRkUwaGtw?=
 =?utf-8?B?RHQvaDVkdlpUNGUvRkYzTktxNHloVTE3ejl3Wjh0MElmZHY3bGZNZC82Mmc0?=
 =?utf-8?B?TmkzbzUzNmZwR2pkcllNVTdwZVZQeGxpT1Rmemo1MXpUeXQyVzdhQWVNOFNR?=
 =?utf-8?B?cXNVaU9ZUVA0ano2T1U0KzExUllNKzR3Y0NjZjVGYXFxT1hZdUZGWmpnYldT?=
 =?utf-8?B?aFFhdm9sZVU2MHRqL0FaRElGK2lHUUV3Y1o5Q0tjY2wyMC81SXhIdUx6S01s?=
 =?utf-8?B?SUxHVjJEalBFVWs4TE56OUprdTc3TUJWVU81d2o5Wno3TGNGMFRwWEpIb3pk?=
 =?utf-8?B?di9sV0FqcllkM3N2V3NsZXhVTUJydlhTeWM0eE5MbEpPaVJNaUJ5SzdMZU5x?=
 =?utf-8?B?Y0xyYTZyMW1KblMrQ2x0Q2lNM1NlK1NTTDFYLzNNNkdEQWhwUTJlbXdQNmo0?=
 =?utf-8?B?amRKcnRZN1V5dVRsSy9ad0dYalJXY2xHY1p5bTJXVk9CTHN6MTZhN0NXZkNF?=
 =?utf-8?B?OHd1VXNQQStMb1pmOGVnNTVVcDlOaVR1dCtvV3lSV21vdmMwdlB2dz09?=
X-Exchange-RoutingPolicyChecked: hupE7Jm8XwgRdnei/hM1S5gyB2zjU+2IkllEAWBDEHfR3OXI2rilHgV0sTzTu/AzXk/5u6wdsogc9PVv4HjCcvtwlpS1mGLVZjk+A0niqH8WtIe3HCMZdKfqZqV7yTm2XjkUontOJ1O9OjGmkRv99/GdjckkJapPC8l4B6AXX4wkvVFcYJNGIn/rfE6Z0t4+RYGCnnGaufRpnHJnAc1JrTewFrgqwLkOLF66TK9MJ8OgrTIuTk8BwLWtTugTgRjlWXD5ObAZmpxmMlZqQSs3qbxC4Mwd8gnThWbRbEHMyJo7IosrY8rlFJFENiqZxP6DZaae1/YhKFzbGIDcHpvkMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5ff7f4-2f61-46f8-2e3a-08dead4c1985
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 21:52:29.3169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tUrrE3TivUaB5ehkaEk0axc4NK8IPiivCstac1Ro95akTTkud9egOQjgn3JFzxi9zQqhGDI0n5I7MiLhCPmCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9652
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Matt Roper <matthew.d.roper@intel.com> writes:
>
>> On Fri, Jan 16, 2026 at 07:12:20PM -0300, Gustavo Sousa wrote:
>>> The type struct xe_reg_mcr exists to ensure that the correct API is use=
d
>>> when handling MCR registers.  However, for in the register save/restore
>>> functionality, the RTP processing always cast the register to a struct
>>> xe_reg and then apply_one_mmio() selects the MMIO API based on the "mcr=
"
>>> field of the register instance.
>>>=20
>>> This allows the developer to commit mistakes like passing a MCR registe=
r
>>> for an RTP action for a platform where the respective register is not
>>> MCR; and vice-versa.
>>>=20
>>> To capture such scenarios, do a sanity check in xe_reg_sr_add() and
>>> raise warnings if inconsistencies are detected.
>>>=20
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 71 ++++++++++++++++++++++++++=
++++----
>>>  drivers/gpu/drm/xe/tests/xe_wa_test.c  | 11 +++++-
>>>  drivers/gpu/drm/xe/xe_gt_mcr.c         | 21 ++++++++++
>>>  drivers/gpu/drm/xe/xe_gt_mcr.h         |  1 +
>>>  drivers/gpu/drm/xe/xe_reg_sr.c         | 36 +++++++++++++++++
>>>  5 files changed, 132 insertions(+), 8 deletions(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/x=
e/tests/xe_rtp_test.c
>>> index d2255a59e58f..80bd83f56d04 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> @@ -9,24 +9,30 @@
>>>  #include <drm/drm_drv.h>
>>>  #include <drm/drm_kunit_helpers.h>
>>> =20
>>> +#include <kunit/static_stub.h>
>>>  #include <kunit/test.h>
>>> =20
>>>  #include "regs/xe_gt_regs.h"
>>>  #include "regs/xe_reg_defs.h"
>>>  #include "xe_device.h"
>>>  #include "xe_device_types.h"
>>> +#include "xe_gt_mcr.h"
>>>  #include "xe_kunit_helpers.h"
>>>  #include "xe_pci_test.h"
>>>  #include "xe_reg_sr.h"
>>>  #include "xe_rtp.h"
>>> =20
>>> -#define REGULAR_REG1	XE_REG(1)
>>> -#define REGULAR_REG2	XE_REG(2)
>>> -#define REGULAR_REG3	XE_REG(3)
>>> -#define MCR_REG1	XE_REG_MCR(1)
>>> -#define MCR_REG2	XE_REG_MCR(2)
>>> -#define MCR_REG3	XE_REG_MCR(3)
>>> -#define MASKED_REG1	XE_REG(1, XE_REG_OPTION_MASKED)
>>> +#define REGULAR_REG1		XE_REG(1)
>>> +#define REGULAR_REG2		XE_REG(2)
>>> +#define REGULAR_REG3		XE_REG(3)
>>> +#define REGULAR_REG4		XE_REG(4)
>>> +#define BAD_REGULAR_REG5	XE_REG(5)
>>> +#define MCR_REG1		XE_REG_MCR(1)
>>> +#define MCR_REG2		XE_REG_MCR(2)
>>> +#define MCR_REG3		XE_REG_MCR(3)
>>> +#define BAD_MCR_REG4		XE_REG_MCR(4)
>>> +#define MCR_REG5		XE_REG_MCR(5)
>>> +#define MASKED_REG1		XE_REG(1, XE_REG_OPTION_MASKED)
>>> =20
>>>  #undef XE_REG_MCR
>>>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr =3D 1)
>>> @@ -48,6 +54,23 @@ struct rtp_test_case {
>>>  	const struct xe_rtp_entry *entries;
>>>  };
>>> =20
>>> +static bool fake_xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg r=
eg)
>>> +{
>>> +	/*
>>> +	 * All supported platforms in this imaginary setup will always have R=
EG4
>>> +	 * as a non-MCR register and REG5 as MCR, meaning that BAD_MCR_REG4 a=
nd
>>> +	 * BAD_REGULAR_REG5 represent programming errors to be captured by ou=
r
>>> +	 * tests.
>>> +	 */
>>> +	if (reg.raw =3D=3D BAD_REGULAR_REG5.raw)
>>> +		return true;
>>> +
>>> +	if (reg.raw =3D=3D BAD_MCR_REG4.raw)
>>> +		return false;
>>> +
>>> +	return reg.mcr;
>>> +}
>>> +
>>>  static bool match_yes(const struct xe_device *xe, const struct xe_gt *=
gt,
>>>  		      const struct xe_hw_engine *hwe)
>>>  {
>>> @@ -304,6 +327,38 @@ static const struct rtp_to_sr_test_case rtp_to_sr_=
cases[] =3D {
>>>  			{}
>>>  		},
>>>  	},
>>> +	{
>>> +		.name =3D "bad-mcr-reg-forced-to-regular",
>>> +		.expected_reg =3D REGULAR_REG4,
>>> +		.expected_set_bits =3D REG_BIT(0),
>>> +		.expected_clr_bits =3D REG_BIT(0),
>>> +		.expected_active =3D BIT(0),
>>> +		.expected_count_sr_entries =3D 1,
>>> +		.expected_sr_errors =3D 1,
>>> +		.entries =3D (const struct xe_rtp_entry_sr[]) {
>>> +			{ XE_RTP_NAME("bad-mcr-regular-reg"),
>>> +			  XE_RTP_RULES(FUNC(match_yes)),
>>> +			  XE_RTP_ACTIONS(SET(BAD_MCR_REG4, REG_BIT(0)))
>>> +			},
>>> +			{}
>>> +		},
>>> +	},
>>> +	{
>>> +		.name =3D "bad-regular-reg-forced-to-mcr",
>>> +		.expected_reg =3D MCR_REG5,
>>> +		.expected_set_bits =3D REG_BIT(0),
>>> +		.expected_clr_bits =3D REG_BIT(0),
>>> +		.expected_active =3D BIT(0),
>>> +		.expected_count_sr_entries =3D 1,
>>> +		.expected_sr_errors =3D 1,
>>> +		.entries =3D (const struct xe_rtp_entry_sr[]) {
>>> +			{ XE_RTP_NAME("bad-regular-reg"),
>>> +			  XE_RTP_RULES(FUNC(match_yes)),
>>> +			  XE_RTP_ACTIONS(SET(BAD_REGULAR_REG5, REG_BIT(0)))
>>> +			},
>>> +			{}
>>> +		},
>>> +	},
>>>  };
>>> =20
>>>  static void xe_rtp_process_to_sr_tests(struct kunit *test)
>>> @@ -522,6 +577,8 @@ static int xe_rtp_test_init(struct kunit *test)
>>>  	xe->drm.dev =3D dev;
>>>  	test->priv =3D xe;
>>> =20
>>> +	kunit_activate_static_stub(test, xe_gt_mcr_check_reg, fake_xe_gt_mcr_=
check_reg);
>>> +
>>>  	return 0;
>>>  }
>>> =20
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe=
/tests/xe_wa_test.c
>>> index 3311f05a6fc2..326278488cdb 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>>> @@ -13,6 +13,7 @@
>>>  #include "tests/xe_mmio_intercept.h"
>>>  #include "xe_device.h"
>>>  #include "xe_gt.h"
>>> +#include "xe_gt_mcr.h"
>>>  #include "xe_hw_engine.h"
>>>  #include "xe_kunit_helpers.h"
>>>  #include "xe_pci_test.h"
>>> @@ -38,8 +39,10 @@ static int xe_wa_test_init(struct kunit *test)
>>>  {
>>>  	const struct xe_pci_fake_data *param =3D test->param_value;
>>>  	struct xe_pci_fake_data data =3D *param;
>>> -	struct xe_device *xe;
>>>  	struct device *dev;
>>> +	struct xe_device *xe;
>>> +	struct xe_gt *gt;
>>> +	int id;
>>>  	int ret;
>>> =20
>>>  	dev =3D drm_kunit_helper_alloc_device(test);
>>> @@ -52,6 +55,12 @@ static int xe_wa_test_init(struct kunit *test)
>>>  	ret =3D xe_pci_fake_device_init(xe);
>>>  	KUNIT_ASSERT_EQ(test, ret, 0);
>>> =20
>>> +	/* Needed for sanitize_mcr(). */
>>> +	for_each_gt(gt, xe, id) {
>>> +		xe_gt_mcr_init_early(gt);
>>> +		xe_gt_mmio_init(gt);
>>> +	}
>>> +
>>>  	kunit_activate_static_stub(test,
>>>  				   xe_mmio_intercept_read32,
>>>  				   xe_wa_mmio_intercept_read32);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_=
mcr.c
>>> index e7eb3c6da234..c6d9766b6cc6 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> @@ -3,6 +3,8 @@
>>>   * Copyright =C2=A9 2022 Intel Corporation
>>>   */
>>> =20
>>> +#include <kunit/static_stub.h>
>>> +
>>>  #include "xe_gt_mcr.h"
>>> =20
>>>  #include "regs/xe_gt_regs.h"
>>> @@ -623,6 +625,25 @@ static bool reg_in_steering_type_ranges(struct xe_=
gt *gt,
>>>  	return false;
>>>  }
>>> =20
>>> +/*
>>> + * xe_gt_mcr_check_reg - check if a register is recognized by this GT =
as MCR
>>> + * @gt: GT structure
>>> + * @reg: The register to check
>>> + *
>>> + * Returns true if the register offset falls within one of the MMIO ra=
nges
>>> + * classified as MCR for the GT.
>>> + */
>>> +bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg)
>>> +{
>>> +	KUNIT_STATIC_STUB_REDIRECT(xe_gt_mcr_check_reg, gt, reg);
>>> +
>>> +	for (int type =3D 0; type <=3D IMPLICIT_STEERING; type++)
>>> +		if (reg_in_steering_type_ranges(gt, reg, type))
>>> +			return true;
>>> +
>>> +	return false;
>>> +}
>>> +
>>>  /*
>>>   * xe_gt_mcr_get_nonterminated_steering - find group/instance values t=
hat
>>>   *    will steer a register to a non-terminated instance
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_=
mcr.h
>>> index 283a1c9770e2..d6b50b52b1d5 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>>> @@ -26,6 +26,7 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct=
 xe_reg_mcr mcr_reg,
>>>  void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr=
_reg,
>>>  			       u32 value);
>>> =20
>>> +bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg);
>>>  bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>>>  					  struct xe_reg_mcr reg_mcr,
>>>  					  u8 *group, u8 *instance);
>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg=
_sr.c
>>> index d3e13ea33123..89d35301defa 100644
>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>> @@ -68,14 +68,49 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>>>  #endif
>>>  }
>>> =20
>>> +static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
>>> +				  const struct xe_reg_sr_entry *e,
>>> +				  struct xe_gt *gt)
>>> +{
>>> +	struct xe_reg reg =3D e->reg;
>>> +	bool is_mcr;
>>> +
>>> +	/*
>>> +	 * We need the gt structure to check MCR ranges.
>>> +	 */
>>> +	if (!gt)
>>> +		return reg;
>>> +
>>> +	is_mcr =3D xe_gt_mcr_check_reg(gt, reg);
>>> +
>>> +	if (is_mcr && !reg.mcr) {
>>> +		reg.mcr =3D 1;
>>> +		xe_gt_warn(gt, "xe_reg_sr_entry using non-MCR register for address 0=
x%x, forcing MCR\n",
>>> +			   reg.addr);
>>> +		reg_sr_inc_error(sr);
>>> +	}
>>> +
>>> +	if (!is_mcr && reg.mcr) {
>>> +		reg.mcr =3D 0;
>>> +		xe_gt_warn(gt, "xe_reg_sr_entry using MCR register for address 0x%x,=
 forcing non-MCR\n",
>>> +			   reg.addr);
>>> +		reg_sr_inc_error(sr);
>>> +	}
>>
>> This sanity check (and fixup) is going to happen not only on the
>> non-live kunit test, but also on true device probes on hardware, right?
>> In this case, we might want to consider downgrading these messages to
>> notice level rather than warn.  The kunit results should let us know if
>> we have a problem here (even before we have real hardware CI setup), but
>> if a mistake somehow sneaks by, having warn (or error) level messages
>> printed in dmesg will cause CI to consider the entire device probe a
>> failure and will prevent any further testing from running on the
>> platform until it's fixed.  That seems unnecessarily harsh since a
>> mistake here shouldn't really impact most of the other CI results we
>> could be receiving.
>
> Yep. I agree. I'll downgrade it to notice level on the next iteration of
> this patch.
>
>>
>>
>> Actually, related to the earlier patches in this series, I wonder if we
>> truly need to mock up register accesses for non-live kunits.  It seems
>> like we might still wind up with some FUNC() rules that incorrectly
>> disqualify RTP entries that we want to check.  I'm thinking of oddball
>> rules like xe_rtp_match_gt_has_discontiguous_dss_groups that either come
>> from previous parts of driver initialization, and/or have somewhat
>> non-obvious relationships to register values. It seems like for the
>> purposes of checking MCR vs non-MCR status, the _only_ thing that
>> matters is IP version:  IP version determines which MCR tables are used
>> on the platform and IP version is the only RTP rule that actually
>> matters to confirming that we're using proper register definitions.
>> E.g., for an RTP entry with rules:
>>
>>    XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>>                 GRAPHICS_STEP(B0, D0),
>>                 FUNC(check_foo()),
>>                 FUNC(check_bar()))
>>    XE_RTP_ACTIONS(SET(CHKNREG, SOMEBIT)),
>>
>> we don't care what check_foo() and check_bar() are, or even what the
>> stepping is.  Only the IP version rule is necessary to determine whether
>> we should check CHKNREG's status against a specific IP version's MCR
>> table and for the purposes of the kunit we can treat all other rules as
>> 'true' without trying to process them.
>>
>> So maybe a simpler approach would be to have an alternative version of
>> xe_rtp_process_to_sr() intended for use in non-live kunit tests that
>> just ignores everything except the IP version rules and treats
>> everything else as an automatic 'true.'
>
> Makes sense.  Let me play around with that idea and see if I can send a
> new version of this series with that solution.

I started working on this, but then I realized that it would require
more refactors for a proper implementation, so I decided I will send
this specific part as a follow-up series.

--
Gustavo Sousa

>
> --
> Gustavo Sousa
>
>>
>>
>> Matt
>>
>>> +
>>> +	return reg;
>>> +}
>>> +
>>>  int xe_reg_sr_add(struct xe_reg_sr *sr,
>>>  		  const struct xe_reg_sr_entry *e,
>>>  		  struct xe_gt *gt)
>>>  {
>>>  	unsigned long idx =3D e->reg.addr;
>>>  	struct xe_reg_sr_entry *pentry =3D xa_load(&sr->xa, idx);
>>> +	struct xe_reg reg;
>>>  	int ret;
>>> =20
>>> +	reg =3D sanitize_mcr(sr, e, gt);
>>> +
>>>  	if (pentry) {
>>>  		if (!compatible_entries(pentry, e)) {
>>>  			ret =3D -EINVAL;
>>> @@ -96,6 +131,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>>>  	}
>>> =20
>>>  	*pentry =3D *e;
>>> +	pentry->reg =3D reg;
>>>  	ret =3D xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
>>>  	if (ret)
>>>  		goto fail;
>>>=20
>>> --=20
>>> 2.52.0
>>>=20
>>
>> --=20
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
