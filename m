Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6639CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 06:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7646C10E72B;
	Wed, 15 Oct 2025 06:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcflGLJk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AA910E71D
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 06:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760510227; x=1792046227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zPJX/JI6s6m1YKLnolNA2Edy9qHgUsOOHtYcFI/M63I=;
 b=PcflGLJkXIwEYPQoKZxOsrW+2DvAkIO8FERozweb52iEJW7C36XiM957
 eSvJ5/ID2bOzQTR2i1ekXxaq6AkQtGczRqKOkdQzMc0Kv4Y3IUx3W2f+b
 VkK+L0LirRL4VOiEoMOAlAtPjyM6sNkopyU+KJUS3udBWdZBOJTz4PBlY
 VY2x8ZG7cg3U/gAcuh35jp7ntO0VutSbG/9RpnbBjLssK5zxaapBm/0OH
 sEWGptC0LGPCx8QmY0Lr+QUgp67blaZsub/ef8eU9J3Wr43St/ImrBFpS
 1ikfQ/xDebtf6VWXP8eV8x0Vbq+mNZ6ewLC/Y8TszF7odKGPzI0IVWDVU A==;
X-CSE-ConnectionGUID: OUFCECNPRtqZd/pYtvsNHw==
X-CSE-MsgGUID: djthpUZEStOMeo2HIKk+gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62719479"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62719479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 23:37:06 -0700
X-CSE-ConnectionGUID: +YIB6+Y5ShOwzpEH6M57Fw==
X-CSE-MsgGUID: ohg4ZzIZQd+GXwd+JnD/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="219220467"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 23:37:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 23:37:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 23:37:05 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 23:37:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6K+1s7dcA+jKK6fuLJ1ONpPZlF3DdMICl8H/u0s+f9wwvnK5bIZ+WKALmGxvwehUae4fX/XYVB2vzh628FGvEMsK9WcSkkrKjsO1vshhn2MwyK7cqSc/Rl2AArxhnO2o7QxWbihnl9CX2l1fgL8cgfClleonLIJUGmLhwWpjTatltBx+HLIv7yKaCWhRbQjol31eRhmjFT1g23CNU/VtESuX5DM/o5pWNrrIw5EsaPwiR7lMPpkq02LWfle/Pnz0RCaMtyn6nvjJAQ92AhvR/XiSoKnASwuTqb4bnT/rs9ew+gxA54zkNdoM0vBDfH+JBsEZv4sJrKQh10MddigRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7SOwaWFzvZbGW8yyg6V9wT2HuDEJbanVWdTbpBBru8=;
 b=tqy31tjfPEISUVvw0abJLL4j9DjCt6gKkOlgZ5k0Suu/0jdNBYNqYJwVqvd8e2oAo8948DNMWvNN6Ew0DwQK2nN9o8ydKHn54hfNjFcX7u2HPnl4oIqM0bKK3u89JhrqpIhMIxzNKlA7OYaKKCcQwPpS23bv9AMgD+OiMQH9kefybqDqwmfrBoRXnP1n3D6CquDrQD/s8gMQEA4YjgLN3PRGr+em5BsQK+qUbiykq5Q5qubGsDYGhQUaa+3Bhi4bxIIyAwDkueM3bl5DV9xw8j/tmaZYkScvrUXtETRoUJPWcoCGUbn/BwMxgGtF2Qcx+YpoxAH/ITbVdiAlQlf5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::853) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 06:37:03 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 06:37:03 +0000
Date: Wed, 15 Oct 2025 12:06:55 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 "Brian Welty" <brian.welty@intel.com>
Subject: Re: [PATCH 03/23] drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
Message-ID: <aO9BB6ZagPke7o71@bvivekan-mobl1>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-3-bfb74f038215@intel.com>
 <20251014163403.GO5409@mdroper-desk1.amr.corp.intel.com>
 <jkedmz7ocmab6vs5wchwuazhpmysh4synxcd6hrs3a7v5g2vlf@suwamovrz6jb>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <jkedmz7ocmab6vs5wchwuazhpmysh4synxcd6hrs3a7v5g2vlf@suwamovrz6jb>
X-ClientProxiedBy: MA5PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: 118561ec-1fe1-4922-4654-08de0bb54051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzA2REVPZkJ1SE1pL0xBQ1lSSjZwMEdwM1d4bS90TkJ0anZkaDVEMWlOM0tk?=
 =?utf-8?B?dWIrVjdXSzYwd2EwWXd4NWc3VDNXSk9TT2t0ZGNVeklySEc1bmw3UnoxN1Mz?=
 =?utf-8?B?RC9Cb284TVVyYWpEK002VWttN3RVcWpDMUNyb1VJbXRJYVdnc3p0dkkvM1ds?=
 =?utf-8?B?Q3pjazJ4VXV5KzFOZFB4aUdOZ1lhWWEyY2M1RDJvWU13L29DNGxqTnBDMVFZ?=
 =?utf-8?B?Rkc1azVFZDcwM0VVRFdqam9ndVdZSWFUNmx2QUhmRGRUTjJ4R0Y2ck8wS2Zh?=
 =?utf-8?B?TkRjNGk5eDZCZHNjcE9sQlMrNW9icTZSQjY2NXMrSUdXVjA3TlZlRCtjNXYw?=
 =?utf-8?B?MUlHSFFGYXc2MGtVMDY0a3RFVE9BVjBtY1dwb3hlb081emxOZmVLS3R3UEVL?=
 =?utf-8?B?NHVoWFJLQVAvTEJXY1ZJY0prQ3R2ZmhmZXNreXVQcDhNTlNULzBFTmJWZzdr?=
 =?utf-8?B?dXhCRmRPMCtkZEZpWHpxemgvMmhnZmxkMitaK3FXVVpIWlN3YitaMVluNkl0?=
 =?utf-8?B?T1Vzcjl5ZVQ4eDVnZlBIK1NNN0tjeCtvQ25iWUhpQ0hibjdWRDBvSTk4UFJl?=
 =?utf-8?B?S3h1RENETDFvQytjbHg5dkFZdUN0Y1hBNVNkZS9jeE42aHlUYndzSE9yNitZ?=
 =?utf-8?B?eHFzTUIyQ3lUSHBPS3RjSGJ4NExsTnZMQXBnVkZncXhQZkZJRVZVbGNwTGR2?=
 =?utf-8?B?a05oNzJLSmUvREt1RHFKTnZkVUp6Y01XWUQvVjk5VnZxa2x0UG8rdXBrOVQy?=
 =?utf-8?B?cEZ4Zll2Mjl2TFZyWlBnb1YvaEc2d3lVU2lnUXExUU5tU0JGZ1R0dmNqKytE?=
 =?utf-8?B?MkhHL2EyYXgybUk5YUFEelo5TWt6VkRxRWkzd2NLNnVLenhWYlR6a0hmK2wz?=
 =?utf-8?B?SnFxbWR4cmprbFlBeTdCL1ltOE5hV3B1RWpZSjVlOHFoT1NCVGI1bG1qVG9P?=
 =?utf-8?B?MzkzSkVvdjBYU3hZZmRrMWxCNlk0aDhkeXdrZGpXcmZ5N1pjbmlHaWk2MUxI?=
 =?utf-8?B?SXpZMjkwdkhSWW5YZ094Qkk5Sk9xaEhIbVEzM0dJMmJIWWtMR25wUlJlc05C?=
 =?utf-8?B?R2tFa25MQ0FLV3djTGFEL3dIazQ4WFIyQnBKOU9lOW14Z21FNE8wL2R4YU1q?=
 =?utf-8?B?SlpZZkZHRTdxdUtlMElsb1Z3UXhPZVl2Nm1vd1BTZVBIWm5aNTVwSXFEOTR1?=
 =?utf-8?B?MGdYL3dKdkRuSnJNYWJBV29SZWZRUDZYT2NGRUluazZtcjE1cjV1bE1NQ0ll?=
 =?utf-8?B?RmJtaEs0LzhJOHh3UitKY0RsTXBveTF2NEkxSndWaDczNkdqRGRvelpRT1Jn?=
 =?utf-8?B?b0dlcVQwVXFmbDZnbnYwQnJTQzRQenlEYWsvVGlmSU5qT0RnS2k3TnlyeHpT?=
 =?utf-8?B?YWV3aVIrcjJuZXlmenJXNlE1ZFZOYy93UG0wdk04VU9EdTJ4OUVOeXdNK1RY?=
 =?utf-8?B?SVNQVm9GMmNNa3kycTBCTW85dnZJMUJJZlRVYmJMYUpsdzBncFY5c3UwcjJF?=
 =?utf-8?B?N2UyRlpyWmVrd3NsakhpOVM2VmlzM3pvc05MWVQ1eGpiaDlvU0NicEFnUHFQ?=
 =?utf-8?B?VWVOdktsUEY3V0gxNzVPYmlCUC9LYk4xdTZyWkdTU3FMaGRWMzVCQ0hGOFYw?=
 =?utf-8?B?ck9kbDNYeE9Bczljb2hJV2lXazNubjlxczl5T2tvRkwwMzFvcFJJV3VrSjc1?=
 =?utf-8?B?djdlWG9lVUxFN0p0QVV3YlI3RXR0clM2QThZUjlDbFFkcmFDbXRhVHprUitD?=
 =?utf-8?B?Y0dCL3o4UW5LM2swcTVIZEw5K241RktXLzlWekpCd1NUSDA4Q2pxY0JaRTFH?=
 =?utf-8?B?K2xtWWwwMWJDU0pjRm5QOHFNK25pMkxEL0R2R3JUdVNRSWJXcGwxeld6UEht?=
 =?utf-8?B?SjU4bjBXc21VYmxVbnF6TUlTWGlRVXJNcWdDdlFqQ3EzbWo1SHhvMVdiaG5W?=
 =?utf-8?Q?FyQzIBfV2SSwalf40fjib9KRD/hgSBvC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2JLZGcyckxpckQvMUJ4WmpDYjk2emJPNEpvbFIxK24vL1o5K3orNVM2TUN0?=
 =?utf-8?B?dEw3dWF1eFhWSkhzeEhsUXIyTVR1YURFc1V5alBqSE9UaERWM2dYa3NLbHlP?=
 =?utf-8?B?NTFPQVZtdWppVUNWdEFTNzVSak9sbTYyc2ZiamxTZmNheCt6aDNZVjdEREwz?=
 =?utf-8?B?SlZxanZIZEsxZlJKbUFrNTFEeXBuQUNBcUdPend4eWdhYU1sa2VsK1ozVklO?=
 =?utf-8?B?clA4eTJnVTRqeWFFalp6ZnB6K1pxNWp3VG5hSVpPZy81RTJScTFnOStNMEQr?=
 =?utf-8?B?K3JjVldQakt1WkZhdDNFMko1S0thQWd1cXd6UTc3RW5qczB4OVhhb0ZOZTlF?=
 =?utf-8?B?N0VEdUtaY09RMitVb0N3S3JxRHlwRHZDcTcwK05WeWg2aUx5cytEWU9Wd0tE?=
 =?utf-8?B?SnVXb0lVQ3pLWmExdG5yQ0d0VjdUT0UxYzVhNVhhY3Y0RlN0enRvV3phNW9E?=
 =?utf-8?B?b0p4UTFWdm9wV2tEM2dpWmpENWQyQXk1OTNKRXhWYkZGYVpSVUc2SDU5cldX?=
 =?utf-8?B?OU5EOTJwVUZVQm5MOE02ZkhrTTdhVU91TW5taG4rdy9oenpmK0luLzRSd1o3?=
 =?utf-8?B?SmRKV29rNkx5ejNGbXAwTm41Q2FxQ1ZzSzR1b1QybzQvQ3hpczhoU3hMRU9Y?=
 =?utf-8?B?VDI1WVRPb3ZkbHAvRjRxaVNrY3JINHFrdEF5OW5xMC93d3gvZlp2S3VTUFB6?=
 =?utf-8?B?Q0luY1JGSjRVK0FyOEw0cUxMOFBpTjR1SGlYZ2s5c1dSUnp5WXozYzdOZitP?=
 =?utf-8?B?b2RlZFh0ejZ1Zk9ydHpCVC9BTDdGdXNWSjhCSEJaZ0h6UHN4bXhHZHNwY2h3?=
 =?utf-8?B?eWtmTjMrakh5VkMyM1Brb2dMRndLV1FJbm8wWHlMUlZjeU8xWXVzeGZ4bzFh?=
 =?utf-8?B?NGQ1UW5EYTkwcUl1LzhacW9HOU5YcXZMVnY1Q1BBR2dURFpqbys5czFaRlM2?=
 =?utf-8?B?cEw0bG9XYi9ES3pyVHVvUS9HamJMVXJpUldYQURYSWxRSzdaUGNBRFpkTHRt?=
 =?utf-8?B?YytMU0NrMFZnM282K3U5blFaZXFzWlFnZ0UzWWZIcUpyTkFhTjRtVUNHZnVV?=
 =?utf-8?B?blBtZHFZZ2Mxb1BTbjB3N052OHZKeVlXZC9rWFl0S1Vma3gwQm5jcWR3RURo?=
 =?utf-8?B?QkJFdGhBbXovdFdMYTUzNXNEcVlQaWNkdDYvVU5xK1ZqQ1Y3YkI5S0hNMVVt?=
 =?utf-8?B?ZkZ5THp2Mjk5OSsvTGJ6YXRoNlVJTDEvZGJXQnBVMXpEUnN0K3BmUG9sbXE0?=
 =?utf-8?B?UnIyOHN6TmtoQnhqekoybXVhdE02ci8rd0J6d01yMW9ybTFkd1pUeVNDOUtS?=
 =?utf-8?B?OHIrWWpOTzA0VGROeXpuVW9ZYmRBOUc1NFROTVB5NWU4OVZnYmJVS2FpbUlQ?=
 =?utf-8?B?RXg5N2UyQjRveEIyRkpvVGpWVWs2L250eVdVSFZncHp6cWdMcDQ1UVBkcDJX?=
 =?utf-8?B?cG9uQzlRMmJZSFlRREkxd3dOZTZrK0N2ay9EWmlobEtoTjYzQm85MWdsSk9P?=
 =?utf-8?B?U3plSC91SHY3NSt3dzhBYmtyeTlOOGdnM3hUWGNKMS9Jam5aWkpFRkdUSWdB?=
 =?utf-8?B?Q24rR3BpdnJhOTJNVVBESERGakg5ekUxbGh2M0dmcFBVYXlTMW1ybS9zK0hP?=
 =?utf-8?B?TktpaWRUMVpoQW0yRDJuNDkyeFBGYlZSYi9vSG1qUHBtdGozbTBCYzFxMjA4?=
 =?utf-8?B?eGVrS1NXa3M4WXlFUzF6eDFNVlUremJkd1FRUEVwNi9RVUlDbTZOOGpveEhS?=
 =?utf-8?B?K1Y4d0JTQ0JQa3pISzByUXNpZzFoR2hxNnNpWjdSanpiTktEN2VYV1VkbU9t?=
 =?utf-8?B?SWJhZDU5OXVVYUcwQWhRUlNEQStBYzhFcFIwTG5qSG15dTdPQWxWNzZMbGNh?=
 =?utf-8?B?OFZsTDZzTWVUb2ZSckw3Zkx4MHRydjRxYUhKSG1NWTB1WGZsbEFGRWptczRw?=
 =?utf-8?B?VFNRa0Izblh2Ni93NG11OUhUNnlISnNqVlIxcS9BZUJOSHFYTGdVbllCL2JG?=
 =?utf-8?B?VTNxeHkxbDNYcmdDbVh0cDdVODZHUk5uUS9mMEMrTG94ZlJtMDVDczhjWWJp?=
 =?utf-8?B?b2FjeHhMRG05elFHUGp0R2NmWmJwNnhka3VDRXVrclZxRXRjc2JKR1ZudXNk?=
 =?utf-8?B?Wit5RzcwcllzMFV4VER6RHNUa2YzOTZyNENlRnBLTzBOd09mMnZFYVR3RjlJ?=
 =?utf-8?Q?VDAiF0m2CifB+SRlq3G4B7Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 118561ec-1fe1-4922-4654-08de0bb54051
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 06:37:03.0563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q83UkPUE3ba8rSHkigb6AzJNM6HduDl0TaqtNiCxD4NuhHjMhBqDUJPsf143Ilh6mCA68WtBA2WaLoXdENxwYkFYY4C7uJ89kizXt8ojuKNz2Dscn+RrrDrCqJOelW6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
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

On 14.10.2025 21:28, Lucas De Marchi wrote:
> On Tue, Oct 14, 2025 at 09:34:03AM -0700, Matt Roper wrote:
> > On Mon, Oct 13, 2025 at 08:24:35PM -0700, Lucas De Marchi wrote:
> > > From: Brian Welty <brian.welty@intel.com>
> > > 
> > > Starting from Xe3p, there are two different copies of some of the GAM
> > > registers:  the traditional MCR variant at their old locations, and a
> > > new unicast copy known as "main_gamctrl."  The Xe driver doesn't use
> > > these registers directly, but we need to instruct the GuC on which set
> > > it should use.  Since the new, unicast registers are preferred (since
> > > they avoid the need for unnecessary MCR synchronization), set a new GuC
> > > feature flag, GUC_CTL_MAIN_GAMCTRL_QUEUES to convey this decision.  A
> > > new helper function, xe_guc_using_main_gamctrl_queues(), is added for
> > > use in the 3 independent places that need to handle configuration of the
> > > new reporting queues.
> > > 
> > > The mmio write to enable the main gamctl is only done during the general
> > > GuC upload.  The gamctrl registers are not accessed by the GuC during
> > > hwconfig load.
> > > 
> > > Last, the ADS blob for communicating the queue addresses contains both a
> > > DPA and GGTT offset. The GuC documentation states that DPA is now MBZ
> > > when using the MAIN_GAMCTRL queues.
> > > 
> > > Signed-off-by: Brian Welty <brian.welty@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
> > >  drivers/gpu/drm/xe/xe_gt.h           |  6 ++++++
> > >  drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc.h          |  1 +
> > >  drivers/gpu/drm/xe/xe_guc_ads.c      |  6 +++++-
> > >  drivers/gpu/drm/xe/xe_guc_fwif.h     |  1 +
> > >  6 files changed, 43 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 51f2a03847f9d..47e13a3fb9072 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -545,6 +545,9 @@
> > >  #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
> > >  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
> > > 
> > > +#define MAIN_GAMCTRL_MODE			XE_REG(0xef00)
> > > +#define   MAIN_GAMCTRL_QUEUE_SELECT		REG_BIT(0)
> > > +
> > >  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
> > >  #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
> > >  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 5df2ffe3ff838..9d710049da455 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -22,6 +22,12 @@
> > > 
> > >  #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
> > > 
> > > +#define GT_VER(gt) ({ \
> > > +	typeof(gt) gt_ = (gt); \
> > > +	struct xe_device *xe = gt_to_xe(gt_); \
> > > +	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
> > > +})
> > > +
> > >  extern struct fault_attr gt_reset_failure;
> > >  static inline bool xe_fault_inject_gt_reset(void)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index d94490979adc0..37e3735f34e63 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -91,6 +91,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
> > >  	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
> > >  		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
> > > 
> > > +	if (xe_guc_using_main_gamctrl_queues(guc))
> > > +		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
> > > +
> > >  	return flags;
> > >  }
> > > 
> > > @@ -1255,8 +1258,13 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
> > > 
> > >  int xe_guc_upload(struct xe_guc *guc)
> > >  {
> > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > +
> > >  	xe_guc_ads_populate(&guc->ads);
> > > 
> > > +	if (xe_guc_using_main_gamctrl_queues(guc))
> > > +		xe_mmio_write32(&gt->mmio, MAIN_GAMCTRL_MODE, MAIN_GAMCTRL_QUEUE_SELECT);
> > > +
> > >  	return __xe_guc_upload(guc);
> > >  }
> > > 
> > > @@ -1657,6 +1665,25 @@ void xe_guc_declare_wedged(struct xe_guc *guc)
> > >  	xe_guc_submit_wedge(guc);
> > >  }
> > > 
> > > +/**
> > > + * xe_guc_using_main_gamctrl_queues() - Detect which reporting queues to use.
> > > + * @guc: The GuC object
> > > + *
> > > + * For Xe3p and beyond, we want to program the hardware to use the
> > > + * "Main GAMCTRL queue" rather than the legacy queue before we upload
> > > + * the GuC firmware.  This will allow the GuC to use a new set of
> > > + * registers for pagefault handling and avoid some unnecessary
> > > + * complications with MCR register range handling.
> > > + *
> > > + * Return: true if can use new main gamctrl queues.
> > > + */
> > > +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
> > > +{
> > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > +
> > > +	return GT_VER(gt) >= 35;
> > 
> > Revisiting the spec on this, I'm not sure whether using GT_VER() here is
> > actually the right thing to do.  As far as I can see, the media GT does
> > not actually have a "main gamctrl" register range at all (i.e., bspec
> > 76445 only lists MCR gamctrl ranges, and 0x38EF00-0x38EFFF falls within
> > a reserved/unused block).  That means that registers like
> 
> true
> 
> > MAIN_GAMCTRL_MODE that we're trying to write during xe_guc_upload above
> 
> We do have MAIN_GAMCTRL_MODE for xe3p_lpm in bspec 73540.
> The tagging is odd, but there is a reference to the register at
> 0x38EF00. It wouldn't make sense to have a 0x38xxxx register instance
> for primary/graphics GT.
> 
> So either
> 
> 1) we don't have it like you said
> 2) we have it and there's something missing in the MCR ranges
> 
> > don't actually exist for the media GT.  Furthermore, the tagging on the
> > register detail page 73540 also seems to imply that this only applies to
> > the primary/graphics GT.
> 
> so... in that case we'd need to check both the gt type and graphics ver,
> so we load GuC with those different flags. I will take a shot at that
> and check if anything breaks.
> 
> Bala, since you did the patch following this, do you remember of
> anything related to this?

There seems to be a conflict between the Bspec and the HSD. HSD
16017994409 and the HAS claim the MainGAMCTRL is supported in Xe3p Media
IP whereas the Bspec page 73542 and the Steering table show the
MainGAMCTRL register range as not available for Xe3p Media.

For me it looks like a Bspec update issue. We have tested and verified
the current implementation which enables MainGAMCTRL for Media.
I would say lets keep the code as it is though it conflicts with the
spec and raise a Bspec issue to get it clarified.

Regards,
Bala

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > +}
> > > +
> > >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > >  #include "tests/xe_guc_g2g_test.c"
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > > index 1cca05967e621..e2d4c5f44ae34 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > @@ -52,6 +52,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc);
> > >  void xe_guc_stop(struct xe_guc *guc);
> > >  int xe_guc_start(struct xe_guc *guc);
> > >  void xe_guc_declare_wedged(struct xe_guc *guc);
> > > +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
> > > 
> > >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > >  int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > index 22ac2a8b74c80..bcb85a1bf26d9 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > @@ -820,16 +820,20 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
> > >  static void guc_um_init_params(struct xe_guc_ads *ads)
> > >  {
> > >  	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
> > > +	struct xe_guc *guc = ads_to_guc(ads);
> > >  	u64 base_dpa;
> > >  	u32 base_ggtt;
> > > +	bool with_dpa;
> > >  	int i;
> > > 
> > > +	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
> > > +
> > >  	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
> > >  	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
> > > 
> > >  	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
> > >  		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
> > > -			       base_dpa + (i * GUC_UM_QUEUE_SIZE));
> > > +			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
> > >  		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
> > >  			       base_ggtt + (i * GUC_UM_QUEUE_SIZE));
> > >  		ads_blob_write(ads, um_init_params.queue_params[i].size_in_bytes,
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > index 50c4c2406132e..c90dd266e9cf9 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > @@ -113,6 +113,7 @@ struct guc_update_exec_queue_policy {
> > >  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> > >  #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
> > >  #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
> > > +#define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
> > >  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
> > > 
> > >  #define GUC_CTL_DEBUG			3
> > > 
> > > --
> > > 2.51.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
