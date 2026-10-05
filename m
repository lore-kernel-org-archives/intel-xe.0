Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9197ECA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 13:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528B910ED0D;
	Mon,  5 Oct 2026 13:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOzJBdKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AF510ED0D
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791207292; x=1822743292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qrMRj3oJVl6SVxRrbaVLxGeNsqMr1Ar74Ny7vnGL6uk=;
 b=SOzJBdKaNDPDpV/IkTuW9Cp19ssZV3lqWJ6XWAOZGtKYuTV59RsLYGbq
 4oJTHfQdCCi6EIfRb5UZeXhVnwQ5K35vptyfhE4zTuy1qAIkAomtDJQs9
 ADJvIRFD4U6sIkidtsRRXm+rZjy81cYFJ4kolrtjC4BHoUI+uXmSG1LQn
 OUcfBxnMnMjM7tC8bani9Ook45LcmJiw9uJbJ3taXif0doGuOo3YSYTn9
 gkLfl4B/h9faeq5V3KxEbPV/OWtnpQywQvZUr+4mr0eFuo2DgfFbkNfoP
 Vr4+V7F8VjVW8mW94Z81YnmNrCuZgFfiqTdYFdudLwrtAFGobJ0TLPMGD Q==;
X-CSE-ConnectionGUID: Bp4T5epSSBSaI9kVIu1aMA==
X-CSE-MsgGUID: kxv46hd1RuuIezwy8bBm1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90645838"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="90645838"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 06:34:51 -0700
X-CSE-ConnectionGUID: ABx9mjT6QP+b5qXJCWBwRQ==
X-CSE-MsgGUID: F5bj2yIRQ/+mHzd0fBG2qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="280558942"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 06:34:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 06:34:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 06:34:51 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 06:34:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzRanYJENrL3MNqVMPIuL4xRs8XE/yGQ2uxaV+fqxXuOhf7SUftELYuccqnaZEm5rcc5UUWjiaz6YnKzd2Unt/vTQ7pZ9OkfJlOP/Y891xJjU8+WuS78+/8BKj3BVLtDf7zBhMfvFUQPPslwz9xcdQT+ilWJMFvFHbBYnfWs+42gz+NyOYoHRlBYDkTazjPTH1o4TLpEykUUzpJMh4ywjPhfvzIby5jNwDDP9QuThjkDrll0+JN04Ir8QrmI9OjlnOPF/ZpAiIOPcdqY1VJgEBi4NL/djhxQzJ5jSBEPscOrqLEcd8Fp4DgmmeWyQFAluQEMmBl7dsRrOpwoFdw7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZRgrzaV4+p0bsfdATuxnVIAXXgziQy1To8ZM+ICjg8=;
 b=cG2Fw9VHD/l46+IXRSM5Lf3HNP+1LgWKhQh5cAdNYezl+SFWvw8+FmtJDQnP/sX1RL6XEcuAoTKdO5ggDOl55uqQZ3nPKvztxintdi5zMSsWTTXhnVDIMMsqaK12fx9Exd+cgCwVXLTgmbCzw+LUMMPlQi1YXSaWDzirvAgxfZodc/npFnzLUaXTKKgTkY+Jhivq2H5IKHjaL4MvaULdMWM7Hu/vASH6CEFpLJliA5TnOgX7hbTpMmZy0Vyk+KJB3u3HDy/YLePJvVE9VHe2/onl6hTGJBrlCUe0lCs6bWPueTqqquGkOAN2tE/THyBGV2Zt+dWx0jBX+4DRhQLFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SA0PR11MB4749.namprd11.prod.outlook.com (2603:10b6:806:9a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 5 Oct
 2026 13:34:42 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0451.026; Mon, 5 Oct 2026
 13:34:40 +0000
Date: Mon, 5 Oct 2026 09:34:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michal.wajdeczko@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 3/3] drm/xe/sysctrl: Add generic mailbox passthrough
 debugfs entry
Message-ID: <asOnYMl_KCBe_0aX@intel.com>
References: <20260930133451.667270-5-anoop.c.vijay@intel.com>
 <20260930133451.667270-8-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260930133451.667270-8-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SI3PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:295::10) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SA0PR11MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed2ccee-b9b7-4891-25b2-08df22e56813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|3023799007|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JXGLtxlMyw2hrqmakimskasIqyn+gMdPV5upU03AuJeXGYjxW8/SHO6CfkyCleu1D83vAoKK8yn0snTaLMb90Y510moWjVIe+MOe4G9zqT5sf2uh02gwVfJ+FvcvPGOZWEW5BsbmWB49MA1mXyxl7uInsHIkszeHsSa47obOyMac8yV2fjvNYwG6yp3TGlPS/IewFLTpLqcL3xDaWeBe9JNk40Kbn3AanYISdiJQIGZxK/QJFcBhI1fyopfz61IIlllkFJPKWKosMqj5WD0dKoaW9DcAK3CVsUr7SK/kkOcVtew4xM4IcLXwdfjItUAyblArp2ErnOAL3a9QLIOrt8nsI9gYXMfhoWiXwS5KYW3E3Jj0iIXQODRoN11XPuDEHXLMSjaFxhbnJfN3drK7PIsvotrVpptrq25i/QS7fIi23pBOyLPZzqGStjmdofezG4mRoaXn/m35v0NhemQM0JzSI1Kyq4GxLCadEutarRcQnCuFutxTF6KB0Z9MiL4/W3tJyZav2jdUlp2N95rZFKBaWew0jaDTUUFlsQKP3hSzZr0at2li7QlnoboXPRHZ9kJdyQvWp5N46xGdhUogTND+zJWicNtQc9xYcqdBrug9HZql5ELt62xYcBJMIklPva7mfYw38JVSNzFHNCDtcQqNcXX23DZZeoLvG1fyjZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(3023799007)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?87MTI7x5cw06IKbJHXRT4Kk0j9seiTFVrrKk0q+TWG2ORERyl9qUacH1bkpn?=
 =?us-ascii?Q?iV/dVus8hmqkyVoRs5QFZuTDjtzkzYD8MbMRSX4wwPY/Ho9MPj3LiI5N72KT?=
 =?us-ascii?Q?53ycz31JoKBGwor+bnref8Vrn/SKhwt5FNOXQEAvYe1xVytZ4sWqzb8q/hng?=
 =?us-ascii?Q?iw8jw4evQGOfixLWkpmwSQV199afOGmXOUiWuoKUOtKw79mDocluxWfP1746?=
 =?us-ascii?Q?vdc1CQuhDiZU3rufZ3mMNEEQqeeV3Xue6h7udYUmNjyQhiMBI2I55xaImtLN?=
 =?us-ascii?Q?Y8IEW9QwkZxnBHZ+9QB79HQd0ANgB9uBDw9sQlrFH/1PIP2foRuTC6hz9asU?=
 =?us-ascii?Q?/EVQ2YwqbRhRoVr/VVN58qtVn/uf0VaQKvK8o7yCztXTn1heIl38q652D5+J?=
 =?us-ascii?Q?FBIit443I8D/5v3+ADhdbPcXcm02alKWpt8MCyoYJp6LU+72nTP2mNXhLkwZ?=
 =?us-ascii?Q?c3OTaSMkTg2lBOKjc0NlJtDE9eMso02aTFQd+F9+QFTEr9lKqtcmgUILGVRy?=
 =?us-ascii?Q?YdAEFocHamgSJdsaVfvg75jozIxrY4DW/jjwboTfedfz5DA9Y/HIhBt4Wifu?=
 =?us-ascii?Q?qJEPDufGhMMMB+aS6KBt9S2A15G4QaI1BdNqzjUs+GWrvrpiAcYQn1NHY8dL?=
 =?us-ascii?Q?6LEOALakmiEF/iKZGMnsx+Zi+7w+SjcUL+ln4JIytFfsc4SdBK/X3CBVmCAc?=
 =?us-ascii?Q?BCS1vUdb3D0UNH/y6m2KjkOewihSFx/gegq1eqrKdkYl3NdOdUow2LHjtR7w?=
 =?us-ascii?Q?nMpEeBsl/u9sRSm+jD/Z1PwzJvowIchU6MKSvb4qby/EmSl/61px3fSsK9Fn?=
 =?us-ascii?Q?TqA2obsa1n3gOhlmrSs9ooiIW5yceCAzeYH/v5GbEIoZJNFy8wruGImlORDm?=
 =?us-ascii?Q?FZMPT8ecPLWelcX7VKVklLjqbE+gRHLc/Q4y/jTKxu5V5bU6QRNDYc/o5Nyj?=
 =?us-ascii?Q?QJESpkOWj+xiJpp0vdy7unHrcV0+fDsTCIq3c57Q2dMtKgMXSNy2nJA4M68T?=
 =?us-ascii?Q?DOaaRMqcOxmmabOqBj8lNdbXFVnyHf5XTsWpkOIqZowd1xWKiXQVPPHTxpqb?=
 =?us-ascii?Q?Ovscindfc1de0MYqTDQuly3qSSrTHjatD89PDBadanE7PLRQYl7oaJl0UMJd?=
 =?us-ascii?Q?MlxtKVEe/oITe7xmrPqHu9RMN8l5bujgHghPTtlH1QMV8/Df8o+7S2bie7EH?=
 =?us-ascii?Q?ejbxIedNYU65HZBxM6jgA2iprsulxcXHL+qi7nM25R9+2FZ9DF/Ezb42WqY7?=
 =?us-ascii?Q?HJ7VEFcIxP3anjvch6A4temLbemVFGGwmVwU0pBjsaUkJDBhPT75rLYaq3SP?=
 =?us-ascii?Q?lQR4Zf/0FSaRYfcIavklrMFyqshccdh3Qmg7dpsoAqHHJ8KhahPtmJ9nbc3s?=
 =?us-ascii?Q?LJ8iVdmlQBx5TnNrGZdNEUTy4McGGYe4OPHJaTHHuiIhzw0cjtr1VdKKWyl1?=
 =?us-ascii?Q?9K1KyLJHGdO2NekB1upMIwlYNBhgmIrgQHYH7ijAcGK3VWwW36fcC8q9Te7p?=
 =?us-ascii?Q?Cm22KPvo1vk/M3UAfpYccLZhhpVHtoFGW38ICUij8j7hqpQI/5c9J3V7Bqii?=
 =?us-ascii?Q?1a1zUGJpXBJXuHD8jDpLLxhveGh+luhsISduw9tHSiAE2KlNXy63gIidiQ6g?=
 =?us-ascii?Q?GxC+5ccqT7jyIuSkPOVjxogCQjNoyqFaZrZINPv16qo3F2p1nSru09RiXViR?=
 =?us-ascii?Q?5p1wTyRXhxNSmY6aMC8r50K9HjFVIr5sWruKCUFC8y/iwG6s7LqWOUE3KuO7?=
 =?us-ascii?Q?kuPjVtvGSw=3D=3D?=
X-Exchange-RoutingPolicyChecked: R3T67mHkTPZyqEyyaFWXUhMZ8lQbVq78sZOPw1TFDlabdVaO/YKJLWuOGbGu1tWcGkeZ000/kpmkcqka3vozobsJb7+7paq0SHw0xSmU98OiPy2YNCoknk6ALGdnpN+aD9V0M8L7wQCZMEnSZ8mTUg6M3xB7FAMB8uoWIDjPUcX1xgeT/rLcCJ0XzUdoshLQPSiL4r99Mpg6zgQKrl+i4gqAEZKVNv64rNJRHvOVevek5HCSKk1lguiT4CaxwPLgpt1N18//x3v6dFQkN53fzGmtf9gOUnmuteAmVxMrPnvH50KkgBYLb5ol32lXUGTK0Wc+e7yZexokKdr31+Fi7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed2ccee-b9b7-4891-25b2-08df22e56813
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:34:40.4917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8FfnLgCxdadSiTR7HHD1R+bcP0dhi8atY+z7EAf5VJoSuro2G8DL/+KwhG32T9q+zxfcLgDuYHXdlViYZAHmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4749
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

On Wed, Sep 30, 2026 at 06:34:54AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add a "mailbox" debugfs entry that allows any System Controller
> mailbox command to be issued for bring-up and debug. group and
> command are supplied by the caller as the first two tokens of every
> write, followed by optional per-command response timeout and
> response-length overrides and the payload bytes:
> 
> - Usage: echo "<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]" \
>              > /sys/kernel/debug/dri/0/sc/mailbox
>          cat /sys/kernel/debug/dri/0/sc/mailbox
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v8 (Sashiko AI):
>  - Fix multi-space mailbox token parsing
>  - Tighten mailbox response-length validation
> 
> v7:
> - Add optional per-command mailbox response timeout override
>   ("timeout=<ms>") to the generic mailbox debugfs entry
> - Add optional per-command mailbox response-length override
>   ("resplen=<N>") to the generic mailbox debugfs entry
> - Rename the local response-capacity variable to resp_len and
>   default it to XE_SYSCTRL_MB_MAX_DATA_SIZE (accounting for the
>   mailbox header size) instead of XE_SYSCTRL_MB_MAX_MESSAGE_SIZE
> - Reject resplen=0 (would pass a non-NULL response buffer with a
>   zero length to xe_sysctrl_send_command(), tripping its
>   data_out/data_out_len xe_assert())
> - Skip empty tokens after timeout= so a resplen= token separated
>   by multiple spaces is still recognized (Sashiko AI)
> 
> v6 (Rodrigo):
> - Reject non-zero offset writes for mailbox entry
> - Account for mailbox header size when validating input payload length
> 
> v5:
> - Add per-entry locking for debugfs accesses
> - Skip empty mailbox group/command tokens

thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed to drm-xe-next

> 
> v4:
> - Added a generic mailbox debugfs entry
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 172 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   1 +
>  drivers/gpu/drm/xe/xe_sysctrl_types.h         |   6 +
>  3 files changed, 179 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> index 8964a2d843eb..e0db099ef0ad 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -299,10 +299,179 @@ static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_deb
>  	entry->command = command;
>  	entry->response_len = 0;
>  	entry->status = 0;
> +	entry->timeout_ms = 0;
>  
>  	debugfs_create_file(name, 0600, root, entry, fops);
>  }
>  
> +static char *sysctrl_mailbox_next_token(char **tmp)
> +{
> +	char *token;
> +
> +	do {
> +		token = strsep(tmp, " \t\n");
> +	} while (token && *token == '\0');
> +
> +	return token;
> +}
> +
> +static ssize_t xe_sysctrl_mailbox_write(struct file *file, const char __user *ubuf,
> +					size_t len, loff_t *offp)
> +{
> +	char *kbuf __free(kfree) = NULL;
> +	u8 *input __free(kfree) = NULL;
> +	struct seq_file *m = file->private_data;
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	char *token, *tmp;
> +	unsigned long val;
> +	unsigned int timeout_ms = 0;
> +	size_t input_len = 0;
> +	size_t max_input;
> +	size_t out_len = 0;
> +	size_t resp_len = XE_SYSCTRL_MB_MAX_DATA_SIZE;
> +	u8 group, command;
> +	int status;
> +
> +	if (*offp)
> +		return -ESPIPE;
> +
> +	if (len == 0 || len >= PAGE_SIZE)
> +		return -EINVAL;
> +
> +	kbuf = kmalloc(len + 1, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	max_input = min_t(size_t, len, XE_SYSCTRL_MB_MAX_DATA_SIZE);
> +	input = kmalloc(max_input, GFP_KERNEL);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +	kbuf[len] = '\0';
> +
> +	tmp = kbuf;
> +
> +	token = sysctrl_mailbox_next_token(&tmp);
> +	if (!token || kstrtoul(token, 0, &val) || val > 0xFF) {
> +		xe_err(xe, "sysctrl: invalid mailbox group id\n");
> +		return -EINVAL;
> +	}
> +	group = (u8)val;
> +
> +	token = sysctrl_mailbox_next_token(&tmp);
> +	if (!token || kstrtoul(token, 0, &val) || val > SYSCTRL_HDR_COMMAND_MAX) {
> +		xe_err(xe, "sysctrl: invalid mailbox command id (max 0x%x)\n",
> +		       SYSCTRL_HDR_COMMAND_MAX);
> +		return -EINVAL;
> +	}
> +	command = (u8)val;
> +
> +	token = sysctrl_mailbox_next_token(&tmp);
> +	if (token && strstarts(token, "timeout=")) {
> +		if (kstrtouint(token + strlen("timeout="), 0, &timeout_ms) ||
> +		    timeout_ms > XE_SYSCTRL_MB_MAX_TIMEOUT_MS) {
> +			xe_err(xe, "sysctrl: invalid mailbox timeout (max %u ms)\n",
> +			       XE_SYSCTRL_MB_MAX_TIMEOUT_MS);
> +			return -EINVAL;
> +		}
> +		token = sysctrl_mailbox_next_token(&tmp);
> +	}
> +
> +	if (token && strstarts(token, "resplen=")) {
> +		unsigned int resplen;
> +
> +		if (kstrtouint(token + strlen("resplen="), 0, &resplen) ||
> +		    !resplen || resplen > XE_SYSCTRL_MB_MAX_DATA_SIZE) {
> +			xe_err(xe, "sysctrl: invalid mailbox resplen (1-%zu bytes)\n",
> +			       (size_t)XE_SYSCTRL_MB_MAX_DATA_SIZE);
> +			return -EINVAL;
> +		}
> +		resp_len = resplen;
> +		token = sysctrl_mailbox_next_token(&tmp);
> +	}
> +
> +	while (token) {
> +		if (input_len >= max_input) {
> +			xe_err(xe, "sysctrl: mailbox payload too large (max %zu bytes)\n",
> +			       max_input);
> +			return -EINVAL;
> +		}
> +
> +		if (kstrtoul(token, 0, &val) || val > 0xFF) {
> +			xe_err(xe, "sysctrl: invalid mailbox payload byte '%s'\n", token);
> +			return -EINVAL;
> +		}
> +
> +		input[input_len++] = (u8)val;
> +		token = sysctrl_mailbox_next_token(&tmp);
> +	}
> +
> +	scoped_guard(mutex, &entry->lock) {
> +		entry->group = group;
> +		entry->command = command;
> +		entry->timeout_ms = timeout_ms;
> +
> +		xe_sysctrl_create_command(&cmd, group, command, input_len ? input : NULL, input_len,
> +					  entry->response_buf, resp_len);
> +		cmd.timeout_ms = timeout_ms;
> +
> +		guard(xe_pm_runtime)(xe);
> +		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +		entry->status = status;
> +		entry->response_len = status ? 0 : out_len;
> +	}
> +
> +	return status ? status : len;
> +}
> +
> +static int xe_sysctrl_mailbox_show(struct seq_file *m, void *data)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	size_t i;
> +
> +	guard(mutex)(&entry->lock);
> +
> +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
> +	seq_printf(m, "Timeout: %u ms%s\n", entry->timeout_ms ?: XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS,
> +		   entry->timeout_ms ? "" : " (default)");
> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAILED" : "SUCCESS");
> +	seq_printf(m, "Response: %zu bytes\n", entry->response_len);
> +
> +	if (entry->response_len) {
> +		seq_puts(m, "Response data:\n");
> +		for (i = 0; i < entry->response_len; i++) {
> +			if (i && (i % 16) == 0)
> +				seq_putc(m, '\n');
> +			seq_printf(m, "%02x ", entry->response_buf[i]);
> +		}
> +		seq_putc(m, '\n');
> +	}
> +
> +	seq_puts(m, "\nUsage:\n");
> +	seq_puts(m, "  echo \"<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]\" > mailbox\n");
> +	seq_puts(m, "  cat mailbox\n");
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, xe_sysctrl_mailbox_show, inode->i_private);
> +}
> +
> +static const struct file_operations xe_sysctrl_mailbox_fops = {
> +	.owner = THIS_MODULE,
> +	.open = xe_sysctrl_mailbox_open,
> +	.read = seq_read,
> +	.write = xe_sysctrl_mailbox_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
>  /**
>   * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
>   * @sc: xe_sysctrl instance
> @@ -325,4 +494,7 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
>  	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
>  				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
>  				  &xe_sysctrl_ras_error_inject_fops);
> +
> +	xe_sysctrl_register_entry(root, &sc->debugfs.mailbox, sc, "mailbox", 0, 0,
> +				  &xe_sysctrl_mailbox_fops);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 2554848e7484..a0628eb47bff 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -155,5 +155,6 @@ struct xe_sysctrl_mailbox_command {
>  	(XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(u32))
>  
>  #define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
> +#define XE_SYSCTRL_MB_MAX_TIMEOUT_MS		60000
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 8ea6e1f29ddd..f12455f2886d 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -39,6 +39,9 @@ struct xe_sysctrl_debugfs_entry {
>  
>  	/** @status: Last command result */
>  	int status;
> +
> +	/** @timeout_ms: Last mailbox response timeout used (0 for default) */
> +	unsigned int timeout_ms;
>  };
>  
>  /**
> @@ -71,6 +74,9 @@ struct xe_sysctrl {
>  
>  		/** @debugfs.ras_error_inject: RAS error injection test entry */
>  		struct xe_sysctrl_debugfs_entry ras_error_inject;
> +
> +		/** @debugfs.mailbox: Generic, user-parameterized mailbox entry */
> +		struct xe_sysctrl_debugfs_entry mailbox;
>  	} debugfs;
>  };
>  
> -- 
> 2.43.0
> 
