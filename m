Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5EAC55838
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 01:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1446710E139;
	Wed,  5 Aug 2026 01:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OX6HQ4ez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFE210E122
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 01:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785893787; x=1817429787;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CDurxS3Rhx6S7BGYuNsDgKauSMVXTi6xt3Kpcxm3ODM=;
 b=OX6HQ4ezg1yvK09D0koZtHGlszKwFDxJQhbRGskcErZtpKVDijTZzb8h
 N8eM96th4NEfUcErhhBbnRn3sKDar8j2+/EtdAQ3YFXY4BeQqLiUF6VAL
 T+LkRvP0V2IQk7eIQz2BeDICYGJfr4HtS72KPazMokpu7Q1xrSMtC1pJY
 EWIMZlJK5w7Ex2weFM3VrTvDNQeaT12e9R0sDnB4M/N3J6r+kl/G1ljUq
 cTaXKBpaLTPbaQYsB1Lr+xkcp6mbEFyUBjTWaXjsuWqxy4jKsn0sAR19s
 P1dqQ/u6fVT3iDlGonPgTS/DBzMiYPyO65QU9EYjxyEwM6mkBqJ+XUVwY Q==;
X-CSE-ConnectionGUID: xP91/CS3Q46gN/9NGBITlw==
X-CSE-MsgGUID: 5sA07HpfTl2yaKmOZiyCQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90133082"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="90133082"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 18:36:26 -0700
X-CSE-ConnectionGUID: 6IH4HZHHTiui3kvffkYAZg==
X-CSE-MsgGUID: uS3S25irTRGl6hlMF2+HDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="261098716"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 18:36:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:36:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 18:36:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eirrBudTwV5AMC5bYs9jT2JD4s4LVpEn4gv5JgDJNoyTTCpwnpZ35pfdXEWO/YZ3i1wjQ6x/J47FfDmwSIvm1OpChRQTA7JVkJ/jnceLD3sivnJxCmgRGZr/9IHz4Rddq4hmrHoUo31CZtLddx51JxhX9VOO3S2LQh4GFwsWz+w109VGbH2BQTRby4aAjg+mC9sg6QhC07Qn98Pu+bYES/pkfb5Q8R9Zh5tuy4Mi27ZKnC5cNXCghzK7Qr1PUllrp3Hw12WomCQM0z7D0Lur1DarEcOOD3poLEAzEI2TqFpwe4oZPPA5kABHfW9FhknQe8TBVzofXXCCHOc0ypVwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDohISPJbuPTu4Sn0QvOVB1rMqJptZRtqxZyFhbeBgQ=;
 b=ycwYyBuP99JGuq+ZadG0FTuCEDIJ8iMVG3gYafZ1zPNVx6WJTE4/ATyaIc2LWNbPm+VIR7bp2IjpYSuoVGqKkwi3OSMCUnNom7INsE/Jt3n6To/OwM1m80nTIHTUto2D7N9i+D3Ko5gXyqdwdAC7FkVpc2mr0SYFwLAQ5VvCd0glUQ3TdxFNXX3uNtAwsGaWPLl4b1YRhTx034GaVgPhs/qyJkNTODhnqMSfSPF3ramJY0qHggAF1E64ssx3yugoceacF4lOV6KmnRYXVpfiH9b9n7D3Gv/5Hb+hM0kJeLtaoBL1017OT5d7+tRZWqKYKFXA8M0Ri0ivmw4OgG53GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH0PR11MB9727.namprd11.prod.outlook.com (2603:10b6:510:399::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 01:36:21 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 01:36:21 +0000
Date: Tue, 4 Aug 2026 21:36:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "Levitt, Yoni" <yoni.levitt@intel.com>
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
Message-ID: <anKTkC-thNA53RWy@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
 <522ab2835b03dcd101d52fb752b3fb839ed0c15c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <522ab2835b03dcd101d52fb752b3fb839ed0c15c.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH0PR11MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 06186949-8a13-4b2c-2d00-08def291f398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|4143699003|5023799004|3023799007|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Q7BtXaWOacflrRskK6s6XCQpBWxllLxvVb4VE/GceWtPAgpuy3f81dB3rpI/BMuBXLqC6BkPvLN0UyfEvoTBAZKORbpabZyr+0aDsYT1OiCfQ79fAROeKf8WK9mdPF6woRPDfXLDIOoDc1stWhYmGvupN3KfodoL6YOYSOL8sF5e4s0pnyhft4nTRrToD4Lu4p/j7rvQxkhPHGLKb4Y266d+Hxt/waFqG8FB9RRbKxWaVb6pIsJsWgFdobUvPPE8SycHij9eHrI5gvrLlS0VZRtFubgr9qv2wWjlrNGART5GfSPBoZu7B4qqAFw8bL68AB6qJzb8RdSdm5yCdnNWlnmDqtV1C5+deR+DHkpX4E6t7DrjZdGXnivABsILuSpM4zMi0c7fcqksJDPeIhkbgJiAb6YRjQCivupVSlGsDTwZUfnuNHpVBidaIvbKToP7lbTzUgj3u+FnYWHjv6EpETFdUkFDG6m1D+ahKnjGUmbq3D0uaZCAwmF+GkMBQzWr4rpJ3YDU/Q4vHXqXhLP/o3lQK1mWk9PAuvjd2bhjKf4qyaEREkpbzrO03Ss8ESExVoh+fXx9oyricct+mSVYNNoL44ZSQzoYy2UlLb7j+ddJ4zJ7etI7n7Mx5AokDJsm87M+ZRnLfoFriA4zEXoEUSlx0biFcxHn5SbnMCVWz+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(4143699003)(5023799004)(3023799007)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/wyr+VXQaHiRFytACZKKQpS/9DE9c16wqCyFt4vAozQml7psK8ZI+U6n6Y?=
 =?iso-8859-1?Q?awD/wnI4wD3CWecNuzbp2VSWo0T6pF2oceb5PO74MOyQT3kkw9jLMH205T?=
 =?iso-8859-1?Q?zhux/ObyNLOBLCWswmcUxcy2kDWM5HAchQjOZVxmc4H1xy/P0hIQ2hc+Zx?=
 =?iso-8859-1?Q?+VPChot7h14sfxLtV+4B7x6L2amifyr/QOfYYxJeSnZEhgB7TWwKHZiEzj?=
 =?iso-8859-1?Q?DtRD3oUXzBRCiftmz7Ph6zlm4NWmqQJqEUVzCHgkifkDxWRE+jVVyGpJJy?=
 =?iso-8859-1?Q?e800eUZHjfxDP/FwWRrg8kWn9h/odXI9oIodCEdr+kYBprS4zoXy1+0cac?=
 =?iso-8859-1?Q?pZrOXdT6t4mgoAe+Tp0FcYo4cMl4vc9ASCTFeDe7slHBLxExrj9BglGRjo?=
 =?iso-8859-1?Q?lovOjgPbgLx1GTLF+x3ccxfHig7zQo4oeN0ArnaSA9sbh7BU7XusuT/G3u?=
 =?iso-8859-1?Q?inQXM07kKf5fduZucyGNR5bu8MQY2ngH0Wq08kHAaFIperbVViw5Sd894f?=
 =?iso-8859-1?Q?gm5JR3r1Orip3nyCvvIvCzF/GCifpCevv999OFJJwDWrmC234+SzKxPK8i?=
 =?iso-8859-1?Q?/4Gp0HjW1p9WukGk3IzeK6JVL9zCwmNVCUrO3pqCxrqvXNhCGKCKr614pe?=
 =?iso-8859-1?Q?tLmz62zBxxnPGWS6ft/V4RAvNALnK1CDsP/kUyXZRGLwdoEWIAMFMOUP0i?=
 =?iso-8859-1?Q?BKFGTHz7KNokiZoW/nfFAjMsPjH+lR+tnIH0/7FoUnaBZgrAMhjp8rE0xa?=
 =?iso-8859-1?Q?rZTNUM3YulORVFR/+I2/ZIaw/CvYjweBI7Gd+xKNdRVh54yyc3Qgfq6JpR?=
 =?iso-8859-1?Q?k3R09r24RAFek6TX9tfvAR6JibtG/tG8I929OME5uhAaK5kxwH0HGT0cgn?=
 =?iso-8859-1?Q?Zb+4BGcZxRDqB+r522jngwJC/ka9hsi8k2vs7IOFigLPV+WsJDoSZui1u0?=
 =?iso-8859-1?Q?lCqTPEXIbAxiBrNoFCW92fxQDq0VwLz5G3wAPjZWrH1VLZZKZsOExE+Jed?=
 =?iso-8859-1?Q?Ul60YvHv8OywUx8ZS6NxnEkihC8HrxircQnlw5RPbyCriAYvCltGp1ZbVU?=
 =?iso-8859-1?Q?lKUusiZ1LLyDEl4y9Ag0BebIWLARiRfcUv3N5flUFh8kQFL7QnWCPew/rw?=
 =?iso-8859-1?Q?cNffv0k+2img4blDgLgz7uBFxMHBAay2rTMNx4AbWwi1xViwz7xQ7ZpING?=
 =?iso-8859-1?Q?un7uUyhkxEYm4hGhxMRwSHkwFx3vERw+m+pRSRM0af8gPyFQUink733ELS?=
 =?iso-8859-1?Q?6fVLxH2H106Celm5G2zQdCaq4Z9sU1OOh2W2zvuqQTM1g3jDik0xj973xf?=
 =?iso-8859-1?Q?N1yJ7Qd3HDyLGaZ+Ur4LuiY7Tnim8neDpFPO8ec0zjICr/AR4J2LA+Rimm?=
 =?iso-8859-1?Q?IO7EPZUZ8Z/daxlSShyqqpvjQ+6OJSn36vo/DB7i+f2GLk1RLjLWzZlIav?=
 =?iso-8859-1?Q?Uet829hobeSIF5eiay2iy59pcQFMSAa3iAR6iaceURmCFjCXDiF2NrGzTq?=
 =?iso-8859-1?Q?2mdOak7Ou2KrIP5R27vxlaObglig9Y1ynRDtFBWE61YyKxQhWzSoOeZ/cg?=
 =?iso-8859-1?Q?tajBWuL2JbKqS/VKMpE0M1i2L6up/Rj1AcJiOLZFZRD/dFW39E22fvx+q3?=
 =?iso-8859-1?Q?9XNxlN7WtzWvahDok0GN6WI50CtllseCzNseBVIv8ZXTcgJzFwB/6sb1hH?=
 =?iso-8859-1?Q?7hzwPeGqox/jN9ZWwtytdHJE6zJi6m2XCpFgwGh3GCIbDAMMdyaT7Bn4Zq?=
 =?iso-8859-1?Q?8u1z6O5/3RjrvKGCffg/TqK6/N9fqESkR+bF1XtcHO5MJukXamF0rtu8W6?=
 =?iso-8859-1?Q?Oh9SM5/qmw=3D=3D?=
X-Exchange-RoutingPolicyChecked: NB+lV0KR6VqBHqEYXMZ6SeGGQysIXTb462RbD3iMVYvmFwrJ5RVLGLN8tx9fafXZ7J90o4rQYpafX9U2UMy/DP+q693JEiS42G3FHMIdaF/UHtp+lYCcz/FWN4R6E1vjYYAsrb/j8E0CZdH1+AD9a5iD0O1fC3tsjepgRYsRYPigQNL+UTeJax80NPgxriFAc+zcGGPNvQqIFwOgnZlF/qupSYwlNVpwvv+gjbAVGRLMQTnw444Rk8fvsgkR+LPCiAS9Bkj7RrHIWAjD9gdAwbJ2jY6sC45MkZ4HiOwXNY+PSG1TeRvR/Du4iVxUIXVi2wG6BEsmh1gQcPMlfXDffQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06186949-8a13-4b2c-2d00-08def291f398
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 01:36:21.1133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFhpBhrom7GIHFDXHsOfYGbDWLjcvDFnHr0DrDgUomrtOY5J1svExWCAKOMadVuS1R23HtuFAEqCksZWV7ep5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9727
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

On Tue, Aug 04, 2026 at 05:21:05PM -0400, Summers, Stuart wrote:
> On Thu, 2026-07-30 at 17:20 +0200, Michal Wajdeczko wrote:
> > From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > 
> > Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> > strings that have no stable shape. That is readable for a human, but
> > it
> > gives fleet tooling nothing durable to match on: the wording changes
> > between releases, lines can be rate-limited or dropped under an error
> > storm, and there is no consistent way to ask "which recognised fault
> > just happened?".
> > 
> > Introduce a signature identifier (SIGID): a small, stable integer
> > that
> > names one recognised Xe fault situation and serves as the primary
> > handle
> > for triage. A SIGID maps, through published end-user documentation,
> > to a
> > description and a recommended action; the driver only has to emit the
> > right SIGID next to the usual human-readable text.
> 
> I'm a little worried

I understand your feeling. We've been all through that:

https://lore.kernel.org/intel-xe/amqhoFzQaf1HsuFq@intel.com/

> we're introducing some ABI with this that isn't
> really maintainable in the long term:

I understand the fear and indeed the first proposals I got was
unmaintainable. My first record of pushing back on having something
like this was November last year.

But I respectfully disagree here. This latest version is imho
organized and concise.

> we might decide to change the
> flow or change the way an error is reported or the situation that
> triggers this error from firmware or hardware might change for some
> reason.

You are right, dmesg is not ABI and it will never be. these logs
are aimed for developers and developers are free to change them as
needed. This was a big counter-requirement I gave to the original
idea.

We are not moving all the logs to this format we are not promising
dmesg stability.

The numbering stability however needs to be somewhat stable for
the CPER log in tracefs, that's the ABI. But then that meaning
shouldn't change if the code has to change. A new number should
be needed if the component/location/severity or recommended
recovery needs to be different.

But like I told Raag as well, no developer needs to invent any
number, if they don't know just use regular log messages.
We are not going to move all the logs towards this thing.
Also, the location of the issue is what triggers the ID...
it is very simple by nature. And we need to keep it simple.

> Does this lock us into a solution for all of this? I still need
> to go through the full patch series...

Yes, please take a look to the series. All reviews are welcomed.

> 
> The dmesg entries are generally for human debuggability. I get the
> desire to make these easier to parse for an AI tool or generated
> script, but we also don't want to prevent debug related changes for
> error handling and reporting.

We are not promising this. The stable ABI is only the CPER on tracefs.

We need to always keep this in mind as stated in
Documentation/core-api/printk-index.rst:

"""
The kernel messages are evolving together with the code. As a result,
particular kernel messages are not KABI and never will be!
"""

Thanks,
Rodrigo.

> 
> Thanks,
> Stuart
> 
> > 
> > Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > Assisted-by: Copilot:Opus-4.8
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> > Cc: Yoni Levitt <yoni.levitt@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Cc: Raag Jadav <raag.jadav@intel.com>
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > ---
> > v2: CORRECTED is still an error (Michal)
> >     prepare to decorate dmesg with comp/loc (Michal)
> > ---
> >  Documentation/gpu/xe/index.rst        |   1 +
> >  Documentation/gpu/xe/xe_sigid.rst     |  14 ++
> >  drivers/gpu/drm/xe/Makefile           |   1 +
> >  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183
> > ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_log.h           |  20 +++
> >  6 files changed, 354 insertions(+)
> >  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
> >  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_log.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_log.h
> > 
> > diff --git a/Documentation/gpu/xe/index.rst
> > b/Documentation/gpu/xe/index.rst
> > index 665c0e93601c..0247a255f7e6 100644
> > --- a/Documentation/gpu/xe/index.rst
> > +++ b/Documentation/gpu/xe/index.rst
> > @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe
> > is provided by
> >     xe-drm-usage-stats.rst
> >     xe_configfs
> >     xe_gt_stats
> > +   xe_sigid
> > diff --git a/Documentation/gpu/xe/xe_sigid.rst
> > b/Documentation/gpu/xe/xe_sigid.rst
> > new file mode 100644
> > index 000000000000..45d84a62f185
> > --- /dev/null
> > +++ b/Documentation/gpu/xe/xe_sigid.rst
> > @@ -0,0 +1,14 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +========
> > +Xe SIGID
> > +========
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > +   :doc: Xe Error Signatures (SIGID)
> > +
> > +Signature Identifiers
> > +=====================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > +   :internal:
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index 67ada1d6c2fb..7ac3954737f9 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
> >         xe_hw_fence.o \
> >         xe_irq.o \
> >         xe_late_bind_fw.o \
> > +       xe_log.o \
> >         xe_lrc.o \
> >         xe_mem_pool.o \
> >         xe_migrate.o \
> > diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > new file mode 100644
> > index 000000000000..99717fdf74a6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > @@ -0,0 +1,183 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _ABI_XE_SIGID_ABI_H_
> > +#define _ABI_XE_SIGID_ABI_H_
> > +
> > +/**
> > + * DOC: Xe Error Signatures (SIGID)
> > + *
> > + * What SIGID stands for
> > + * ---------------------
> > + *
> > + * SIGID is short for *Signature Identifier*. A SIGID is a small,
> > stable integer
> > + * that names one *recognised Xe fault situation* -- nothing more.
> > It is the
> > + * primary handle used for triage: a SIGID maps to a human
> > description and a
> > + * recommended first action. A coarse first-order action is
> > documented in-tree
> > + * per SIGID (see "First-order action" below) so the id is
> > actionable on its
> > + * own; published end-user documentation refines it with finer,
> > cross-product
> > + * detail. The driver's only job is to emit the right SIGID next to
> > the usual
> > + * human-readable text.
> > + *
> > + * Why this exists
> > + * ---------------
> > + *
> > + * Today the driver reports faults with ad-hoc ``drm_err()`` /
> > ``xe_gt_err()``
> > + * strings that have no stable shape. That is fine for a human
> > reading dmesg,
> > + * but it gives fleet tooling nothing durable to match on: the
> > wording changes
> > + * between releases, lines can be rate-limited or dropped under an
> > error storm,
> > + * and there is no consistent way to ask "which recognised fault
> > just happened?"
> > + * A SIGID answers exactly that one question, identically across
> > driver and
> > + * firmware versions, and (eventually) across other Intel devices in
> > a node.
> > + *
> > + * What a SIGID is (and is not)
> > + * ----------------------------
> > + *
> > + * A SIGID names *which situation* is being reported. It
> > deliberately does not
> > + * encode the detailed reason or the outcome. Those are carried
> > alongside it::
> > + *
> > + *   SIGID    -> which recognised situation is being reported
> > + *   severity -> how serious this instance is (see below -- not
> > fixed per SIGID)
> > + *   errno    -> the failing operation's error, shown with %pe
> > + *   message  -> free-form human-readable context
> > + *
> > + * Severity is independent of the SIGID. The same situation can be
> > reported at
> > + * different severities depending on the instance and the recovery
> > taken, so a
> > + * SIGID is never tied to one severity; the reporting site chooses
> > it by calling
> > + * the matching xe_log_*() helper (see xe_log.h).
> > + *
> > + * How to pick a SIGID (the uniqueness rule)
> > + * -----------------------------------------
> > + *
> > + * Pick per *report site*, not per incident. Each site emits the
> > single most
> > + * specific recognised situation *for that site* -- so the question
> > is never
> > + * "classify this whole failure", it is "what does this site
> > detect?", which has
> > + * one answer. A single underlying failure therefore legitimately
> > produces a
> > + * *chain* of reports from different layers, each with its own SIGID
> > -- e.g. a
> > + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by
> > the firmware
> > + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path,
> > and an
> > + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain
> > lets triage
> > + * follow a fault from origin to final effect; it is not a
> > duplicate.
> > + *
> > + * If a site does not match any defined situation, keep using the
> > ordinary
> > + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a
> > SIGID: a wrong
> > + * or over-broad classification is harder to retire than a missing
> > one. When a
> > + * new situation is genuinely worth triaging, add it to the list
> > below.
> > + *
> > + * Scope: software-emitted signatures only
> > + * ---------------------------------------
> > + *
> > + * This header enumerates only the situations that the *driver
> > itself* detects
> > + * and reports from software: probe abort, wedged, survivability,
> > driver-
> > + * detected firmware failures, engine TDR, memory faults and IO/bus
> > faults.
> > + * These are the only values the driver assigns.
> > + *
> > + * Signatures that *originate* in firmware or hardware are a
> > different thing:
> > + * they are produced and identified by the firmware or the hardware
> > itself
> > + * (e.g. via their own records or error counters), and the driver
> > merely logs
> > + * them as they are given to us. They are deliberately *not*
> > enumerated here --
> > + * minting a driver-side id for a firmware/hardware-reported error
> > would only
> > + * duplicate an identifier the reporting layer already owns. The two
> > + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
> > + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the
> > driver*
> > + * observed a firmware problem, not a signature reported by the
> > firmware.
> > + *
> > + * Numbering
> > + * ---------
> > + *
> > + * SIGIDs are a single flat list numbered sequentially within the
> > assigned range,
> > + * in the order the situations were introduced. Values are stable:
> > once assigned
> > + * they are only ever appended, never renumbered or reused.
> > + *
> > + * A retired situation is deprecated in place, never re-purposed.
> > + *
> > + * First-order action (resolution buckets)
> > + * ---------------------------------------
> > + *
> > + * So that a SIGID is actionable on its own, each one is tagged with
> > a coarse
> > + * *resolution bucket*: the first thing an operator should do on
> > seeing it. The
> > + * bucket is a stable, driver-owned hint; external documentation may
> > refine it,
> > + * but the in-tree value always stands on its own. Every new SIGID
> > must pick a
> > + * bucket, which forces the question "what should someone do about
> > this?" to be
> > + * answered up front. The buckets are::
> > + *
> > + *   COLLECT  -- capture logs and open a bug report
> > + *   RETRY    -- transient or already recovered; watch for
> > recurrence
> > + *   UPDATE   -- a firmware update / flash is required
> > + *   RECOVER  -- an explicit recovery step is needed (rebind, bus
> > reset)
> > + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
> > + *
> > + * The bucket is documentation only -- it is recorded per SIGID in
> > the enum
> > + * kernel-doc below and is not printed on the (deliberately lean)
> > dmesg line.
> > + *
> > + * When to use SIGID logging
> > + * -------------------------
> > + *
> > + * The xe_log_*() helpers are for these recognised fault situations
> > only --
> > + * important, operator-relevant faults and events. They are not a
> > replacement
> > + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off
> > diagnostics;
> > + * using them for ordinary logging would dilute the fault stream.
> > Not every
> > + * ``xe_err()`` needs to become a SIGID report -- only those that
> > correspond to
> > + * a published situation.
> > + *
> > + * dmesg vs. the machine record
> > + * ----------------------------
> > + *
> > + * The dmesg line stays close to a normal xe error message so it
> > remains
> > + * readable for admins; the only stable, machine-matchable token on
> > it is
> > + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the
> > surrounding
> > + * text may change freely, and lines may be dropped. The durable
> > record for
> > + * tooling is the CPER record carrying the same SIGID (generation is
> > a planned
> > + * follow-up).
> > + */
> > +
> > +/*
> > + * Top level Intel Error Signature Identifiers.
> > + */
> > +#define INTEL_SIGID_INVALID                    0
> > +#define INTEL_SIGID_GPU_START                  100
> > +#define INTEL_SIGID_GPU_END                    999
> > +
> > +#define INTEL_SIGID_GPU_XE_START               100
> > +#define INTEL_SIGID_GPU_XE_END                 299
> > +
> > +#define INTEL_SIGID_GPU_XE_SOFTWARE_START      100
> > +#define INTEL_SIGID_GPU_XE_SOFTWARE_END                199
> > +#define INTEL_SIGID_GPU_XE_HARDWARE_START      200
> > +#define INTEL_SIGID_GPU_XE_HARDWARE_END                299
> > +
> > +/**
> > + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> > + * @XE_SIGID_SW: Software component failure. [COLLECT]
> > + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
> > + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer
> > usable. [RECOVER]
> > + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode.
> > [UPDATE]
> > + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure,
> > GuC/HuC/GSC. [RETRY]
> > + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure,
> > PCODE/sysctrl. [RETRY]
> > + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery
> > (reset). [RETRY]
> > + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
> > + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
> > [RECOVER]
> > + *
> > + * The situations the driver detects and reports in software. Values
> > are
> > + * numbered sequentially, are only ever appended, and are never
> > renumbered or
> > + * reused. The tag in brackets is the default resolution bucket (see
> > the `Xe
> > + * Error Signatures (SIGID)`_ section).
> > + *
> > + * Firmware- and hardware-originated signatures are not listed here;
> > they are
> > + * logged as reported by those layers.
> > + */
> > +enum xe_sigid {
> > +       XE_SIGID_SW                     =
> > INTEL_SIGID_GPU_XE_SOFTWARE_START,
> > +       XE_SIGID_PROBE                  =
> > INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> > +       XE_SIGID_WEDGED                 =
> > INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> > +       XE_SIGID_SURVIVABILITY          =
> > INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> > +       XE_SIGID_RUNTIME_FW             =
> > INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> > +       XE_SIGID_DEVICE_FW              =
> > INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> > +       XE_SIGID_GT_TDR                 =
> > INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> > +       XE_SIGID_MEM_FAULT              =
> > INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> > +       XE_SIGID_IO_BUS                 =
> > INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_log.c
> > b/drivers/gpu/drm/xe/xe_log.c
> > new file mode 100644
> > index 000000000000..70a41bdf1a01
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_log.c
> > @@ -0,0 +1,135 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include "xe_log.h"
> > +#include "xe_printk.h"
> > +
> > +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum
> > xe_sigid sigid,
> > +                         u32 component, u32 location, const void
> > *data, size_t len,
> > +                         struct va_format *vaf)
> > +{
> > +       /* TODO */
> > +}
> > +
> > +static bool is_hw_sigid(enum xe_sigid sigid)
> > +{
> > +       return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> > +}
> > +
> > +static bool is_sev_error(int cper_sev)
> > +{
> > +       return cper_sev != CPER_SEV_INFORMATIONAL;
> > +}
> > +
> > +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> > +{
> > +       return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR
> > : "";
> > +}
> > +
> > +static const char *log_sev_prefix(int cper_sev)
> > +{
> > +       switch (cper_sev) {
> > +       case CPER_SEV_FATAL:
> > +               return "FATAL ";
> > +       case CPER_SEV_RECOVERABLE:
> > +               return "";
> > +       case CPER_SEV_CORRECTED:
> > +               return "CORRECTED ";
> > +       default:
> > +               return "";
> > +       }
> > +}
> > +
> > +#define __LOG_DRM_PRINTK_FMT(fmt, args...)     "[drm] " fmt, ##args
> > +#define __LOG_DRM_PRINTK_ERR_FMT(fmt,
> > args...) __LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> > +
> > +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev,
> > struct va_format *vaf)
> > +{
> > +       if (cper_sev == CPER_SEV_INFORMATIONAL)
> > +               pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> > +       else
> > +               pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> > +}
> > +
> > +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev,
> > const char *fmt, ...)
> > +{
> > +       struct va_format vaf;
> > +       va_list args;
> > +
> > +       va_start(args, fmt);
> > +       vaf.fmt = fmt;
> > +       vaf.va = &args;
> > +
> > +       log_dmesg_vprintk(pdev, cper_sev, &vaf);
> > +
> > +       va_end(args);
> > +}
> > +
> > +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum
> > xe_sigid sigid,
> > +                          u32 component, u32 location, const void
> > *data, size_t len,
> > +                          struct va_format *vaf)
> > +{
> > +       const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> > +       const char *sev_prefix = log_sev_prefix(cper_sev);
> > +
> > +       /* TODO: add component/location details */
> > +
> > +       if (IS_ERR(data))
> > +               log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe)
> > %s%pV",
> > +                                sigid, sev_prefix, data, hwe_prefix,
> > vaf);
> > +       else if (data && len)
> > +               log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN)
> > %s%pV",
> > +                                sigid, sev_prefix, (int)len, data,
> > hwe_prefix, vaf);
> > +       else
> > +               log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> > +                                sigid, sev_prefix, hwe_prefix, vaf);
> > +}
> > +
> > +/**
> > + * xe_log_emit() - Emit a structured SIGID log entry
> > + * @pdev: the &pci_dev device
> > + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE,
> > ...)
> > + * @sigid: signature identifier, see &enum xe_sigid
> > + * @component: component identifer
> > + * @location: location details of the @component
> > + * @data: pointer to the additional details, or ERR_PTR, or NULL if
> > not applicable
> > + * @len: length of the @data in bytes, or 0 if not applicable
> > + * @fmt: printf-style format string
> > + * @...: format arguments
> > + *
> > + * Emits a dmesg line that includes a single stable, machine-
> > matchable token
> > + * ``SIGID=<n>`` followed by the optional severity token (like
> > ``FATAL``) and,
> > + * when @data pointer is set, either the error printed with %pe or a
> > packed hex
> > + * dump of the @data binary blob. The dmesg line will also include
> > printf-style
> > + * text message.
> > + *
> > + * Note that the full dmesg line, with the free text message, is
> > only a debugging
> > + * aid, not an interface! Only the ``SIGID=<n>`` token is stable
> > there.
> > + * The durable machine record is the CPER carrying the same SIGID.
> > + *
> > + * Note: generation of the CPER record is a planned follow-up.
> > + *
> > + * Examples::
> > + *
> > + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO)
> > Invalid GuC reply
> > + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT)
> > Engine 'rcs0' hung
> > + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability
> > mode
> > + */
> > +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid
> > sigid,
> > +                u32 component, u32 location, const void *data,
> > size_t len,
> > +                const char *fmt, ...)
> > +{
> > +       struct va_format vaf;
> > +       va_list args;
> > +
> > +       va_start(args, fmt);
> > +       vaf.fmt = fmt;
> > +       vaf.va = &args;
> > +
> > +       log_emit_dmesg(pdev, cper_sev, sigid, component, location,
> > data, len, &vaf);
> > +       log_emit_cper(pdev, cper_sev, sigid, component, location,
> > data, len, &vaf);
> > +
> > +       va_end(args);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_log.h
> > b/drivers/gpu/drm/xe/xe_log.h
> > new file mode 100644
> > index 000000000000..d475e816ee0b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_log.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_LOG_H_
> > +#define _XE_LOG_H_
> > +
> > +#include <linux/cper.h>
> > +
> > +#include "abi/xe_sigid_abi.h"
> > +
> > +struct pci_dev;
> > +
> > +__printf(8, 9)
> > +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid
> > sigid,
> > +                u32 component, u32 location, const void *data,
> > size_t len,
> > +                const char *fmt, ...);
> > +
> > +#endif
> 
