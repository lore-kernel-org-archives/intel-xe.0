Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5337C606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 05:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fFV/CFbG;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Bpw7IoXM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D15510FAA0;
	Fri, 27 Nov 2026 05:58:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5B710FAA0;
 Fri, 27 Nov 2026 05:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759102; x=1827295102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NxhMGo9PjDwhmHmeobCjDG4etnCasCEyhG6GXdvaYg0=;
 b=fFV/CFbG7AtMlk//7PXcIPFM7UOa09b39+yE1F2EmhLVpPZIjn9As/nz
 Mk9iwVkiAAAfHR06z19JQk7yNjdd/ltDVO/5eM1amFEoKu5H/1YmTqbjy
 og93KlTJ64qd4gXkKgP0Clw5tsMVa8ryEe5zdZ0lqjC5nfrDR7sQegq5M
 jg2goGYSTWqIOhw9Lk9JTpKWeV5U3VrL+3il8QBSzJuKOdIoEEizmX466
 3ENr6unkRUd906ch1UDoBJDmua1T6VHAKeIrGTDv3fTKEwqOjwR/WMPnY
 8DM7FppkNcEwPIzQ6l9GzGpzGdzIQ13QvmyNsOifPofGBT2Sc1yM4aewe w==;
X-CSE-ConnectionGUID: wT7jTUHnRCmgQ9pwd4nmLQ==
X-CSE-MsgGUID: kwU+hB5MToOIgDC7wparEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4575843"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4575843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:58:22 -0800
X-CSE-ConnectionGUID: cIf761awTwmpjko3Zty3BQ==
X-CSE-MsgGUID: 8BNny9EwS6qLFEfaL2oz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12176110"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:58:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:58:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:58:21 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:58:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+1B/X5A/wi3djDU6VX+sxvGCFLIp8k5X0Ov8eS8EfXOHMkDjIW48hDHXFLdtUsFSDmPhPuF2Bk7GxgygPb3bsmy/y8i/tn/JnbgCyqm0++GQhrrfb+J99m16IiG5bes0ZQHgEZSOZ/Wub+G5rgmoJtBt3YczVaGgqGLN7JpWeYdi2IRZzCNUEesW1oo5aEDBjzt5UxzCQi5OIG/87ZHw1ebjl9VuaZ+sWddxABjVmnqzu9fZTcVro9kivMuK6U5qeuJY+WobZq6ANpmxsMdX8jOJW3VSAmdebAgJoRehSh3BmC89cFyFZmja5rzDhiuNSpcrP5dbgbWOTtM0khatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6rFxFxOadPgkPu8MHxqycvpR2lVyrelRbYrQZ6FNis=;
 b=L3TPfweR/IDcHwKVB7tLXQ9VX2wltU09RtDIKnOd3WvB1zP6QI0TdbSN2iTfa38f9zKA4Bj/6BC0tj/pqumt25IFojzqMhzZ4PgV4ZEewGq2vBqDyqsw/IuAS9YU8afn1XM6AaKbED4SWCBEMzXnmv/ndM7JlJz/7d0IBzElJ5Blr+4Bqu0hZXBwibDO/GS2IEqAbkNLi2r5sKZ9XYljDo/r0G64As8B3CAjU4Wj1om9k6w80ji3ks9qQ/fLu+kwEaKO6MwpIDzKXpfONV7XmKAG50k9enTeC/2hjXzNtgyeY2S46bFlPA+7i059mzHJeTjaNr/HRZ9gnvUAGUc8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6rFxFxOadPgkPu8MHxqycvpR2lVyrelRbYrQZ6FNis=;
 b=Bpw7IoXMPsBsIjrrl2FYWBB+dnJ1i/Rr+CFpoLDnNgoKSsQqjEKnMJPPuwlUDIesOIbeRwiQ7Dg7j0lyY6xG4lkGD26agkXEXHmmro+fB+jEibU4CziXMYKLR6fa6sEK2gFWI5wr/CsAZiGPBoIJy7GCzXo7c62j6Mw0nICexM0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:58:17 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:58:17 +0000
Message-ID: <ab141256-8e63-426b-922b-81337e62055b@intel.com>
Date: Fri, 27 Nov 2026 11:28:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] drm/i915/vrr: Annotate live functions
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-8-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-8-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0243.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::17) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 01af47a6-36dd-4e88-6b14-08df4c4b6e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261021123027099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: TmV0N5Ok1MV1QrtwLVz3BbxGGEkmS/oOnGdz7RFNWdqzzbbLTnrIQkpcuPipcCHQ9+JugQ1saVd06VZM55nVhz/UF70C76U3qgO4QMBKzszxp2l5orCuYepTnodRQtJAms/sn6Ja/59okw3e1Y8yirVwHh32wYll7M9FZMlzjlqisQo2+dH5GEsw8U3DAVCyEO00Q2z6pTuAHeMrM1pKXdRA8qAVrG/YrC4F2dlvDP9UhlKhp+5qyCxNpgMHB0wE2vemQ3pEIS59863CDINHnR2+iv/qqsUwwYR7kCCGodZVuYWGYIt7Y1s7VFHHTeFPOmaKTwKU6T8iF3YnuDqZJlYtLh4JAhT3vdqYzGU9lBNjKI016HqTwoszOq4/SGEdmDLN0RZ5hvzfgBirtSAWRv1WHOFsEmsRH07CWxtx5CcVrlBXN+ElzwvXU/X0jD2+0uM3MPYsH+M5FQdo6m0O+mNBRPzPsE1C2Cnckgqx1HtzFzR729G9ogyMeLmFwR3nzbsJkCnhjbAqfXETutmDt91IWzUDCqf6uGM3q9Cpw5kdscVhH/7pRQ/IPhmQC4S6XSIEzeop6iaTa42Uc7yJFmQVHKfaIgtagtVhGHUCjOnEXa2P87Lw4uxqeWXzYqiLme7VLe38OMegwtTHaOagGh7XfjIs1wCJCGgDxz6Q844=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1VGbGdJRVpIaEVTS3FIOEc0NFVxeEUwT1ZZL2V6YzhlaHJ3UWc3TTBRK1ho?=
 =?utf-8?B?NWVKTTRNaEkrUkIreVAyYTZlTk9MMEVqOENTbERhRnlXakR6VlJHektDY0Qw?=
 =?utf-8?B?M0dWc29LeXRxQURZWGRmOWZGaC9kYUlOUG83WWlnN0tsZ2lEaFA3WVdta2dX?=
 =?utf-8?B?ZzczVEFYeWtVU0w0dnVYUnFxQ2VoamFieU53eS9oamZ6OG1nb1hJNGlpNVlk?=
 =?utf-8?B?aURnWUV1OStFMGc4c0QwUGlNSkl5OHErWFpZcnVxY2xPREdHSHNuM0JGTkR2?=
 =?utf-8?B?QVZIdGcxcVBaWlJydzd1MVBXbVRZNFViVGVZdjNmNVNmbnZQNWU5aTZWaldZ?=
 =?utf-8?B?OERKejdhMEo0Q1FpOEpadXNKaGFxWGdOTDJPWUFwbjJYc0ZFSGNYSGRZQ0Qw?=
 =?utf-8?B?ampYSVlKb2l4bmVFN0M4eUVaWHJTMEUxZW5EUTl1aUZnelhOOXN5S3lPdFM4?=
 =?utf-8?B?ZmxTRXNZbmRIZlRGa3dKMGlhbFp2OUd1SlcrSVg1cjdVSW5WTHZuNTdTYXRr?=
 =?utf-8?B?dXJhcGM5THYyNzQ0MnMvWDNLeS8rTDVtY0orQ0psckd5bWk3aVBoT2tHV2Ey?=
 =?utf-8?B?enBnV2xnaUZTMkxZZ2RlS1ozQmpsS2RXUUdkdWNFc2MxazQrcjhDdmtWbDFP?=
 =?utf-8?B?MFo3SW45ZHJVamplVmM5OTVWZGpNNW95V2NqSmxrdFlpL1hTN21QZU5zbEl1?=
 =?utf-8?B?b0ZQdTY5dG9td0JvU3ordXM1UTlIQnk0VTA1V0lPYUhPampzNmNHb3dHMlNJ?=
 =?utf-8?B?WTRvalduQXMwR1hsdExNdndtdVMxa0FDT1pmanNFZXZmYWNBVmJtbE03elBC?=
 =?utf-8?B?SWJFNkV5SDdNTU5UV0NTM1BnUlZFWGwydlFLSTlSbnFBYlFvV0hKeU1HTUpI?=
 =?utf-8?B?cEN5ZmpYd3JtWlQvVnF6MmVrQVh3SjhScnZGS3orMlVRa1BPK1ltMzVwckpt?=
 =?utf-8?B?SmduNmFuZytWSmZiSUpWRkY4aHd1YVA1VUM5cHdtK2l2OU9nT3luL2pYL3lM?=
 =?utf-8?B?cU9lcGVSc1cveUhtNjlQRmtVb2pLell1NW4zQmFRdGdOZzR2SG05dWhFZFM2?=
 =?utf-8?B?eW81S2FzWVJDdXBPMTBVdVhpZ0YrM2hrOGVaS3htZGtjT3VjRzhQK1V2bDYz?=
 =?utf-8?B?TWZuSFRIbjh6UW12N3JReGxqZjBnMVl1cTRtY2lGRHdDNzNVWG9YQlFnRkg2?=
 =?utf-8?B?bEJmWnFXNUl2RnVlWUNvZmJ1cFd1d2QrNEIzVk5sM0J3czBhY2xYOHN1YTA1?=
 =?utf-8?B?R3F4MWhkcEMrYXRic0J6K3N4cVBaYjZIakZuVUZzWktScTVOdXNiR09SZHNI?=
 =?utf-8?B?MnZHRllneFd1YTZxUG1IeHpNN25td2wyd0JyeGFBeWdUMXIwSmdMTkg3OS9t?=
 =?utf-8?B?ZEFoTHMrcVF2SEtRa3BjQk5oVU1mb25zOHRrR1dPQy93WXNRNkpzaDlaUWxy?=
 =?utf-8?B?SS9BSzlrMHpUQ1RidmcyN2FKZ2Z5eEFZejRPK0NkY2JXekRLYmQ5QWs4WlhG?=
 =?utf-8?B?emdkVmZMYW1CeXMvQTVoa0pUNWZNTDZibGFxSk1QQUp1Q2VTU0tQQ3RIdmxz?=
 =?utf-8?B?a2JPdW01NHZMMit1UlFaSnBXTUZlaGt2MEoyU3hmbnk2OWxkRmE5RW1KamRL?=
 =?utf-8?B?K2k4RGJZeURURXhoK3VsLzF5bHRZV2l2WldPQkQ4aXkreFc2YnRWUThUdDNt?=
 =?utf-8?B?VXVXNUtVUEc0TFJnTnZjU0tUS3ovS2JiaC9CaVNtWHRMdUFua2tvVVJ0S2Rl?=
 =?utf-8?B?aFhRZ3BrdUR5czhRaGVVSFJCZUw3ZEpGOEdFNGxnU0oxOEpwRXJwOW5GWVcz?=
 =?utf-8?B?eG83KzFYL202UENSUDg0TjJjSGpjUzE2VFZrajE4ejVzeWZWU3lhYkFUU3l4?=
 =?utf-8?B?dEhVOERaWDBTbWZjd1dBQVlWeUNQU01rTXFCR2lKcjViTVhYWTMzWUIrZk9R?=
 =?utf-8?B?OGhodXI4aW42bndSMGc3SnI5dG16dFM2YkNXK1BSV3hWSytpSzhjbmNjZlpS?=
 =?utf-8?B?M2dyUjFNMnpWREh5MFJLMmZSTmVDbURFa1VyN3ZmUW1CMmJmRTVZdzFkakJM?=
 =?utf-8?B?cTJadnZOVERuL2lDTmFSM1YyNEFEWlp4V0xMdjJ1bDNUTWlEU3FTajRPTEJO?=
 =?utf-8?B?cGVyN1FRaU5EU2RtOTNTNzl4aGFiYkQzMHZBcmRobzdMSWZ0YzhKMjFDbkVM?=
 =?utf-8?B?c1JIZTBIZEs0ZWRDaWdJUVBZcUlkaDEweEtWS2lqc1g5N0l4Tng2dkp5NTJy?=
 =?utf-8?B?MGJZU3BlUTB1MTdkQ3ZwS1RzM2hPK0dhMXdHWmE3aVJNOGUxUmhHYUppWEt2?=
 =?utf-8?B?WWIwWDA1dHVmMjEzM1BDMnB3eGprb2xpRjI4eHlHeVQyN3hCQkhaK2dEaWRz?=
 =?utf-8?Q?zaqR94V1HEWfRR1Q=3D?=
X-Exchange-RoutingPolicyChecked: j79BlCmXxg/G3Fg4NrA5KdAj2+V4XZxrK31ofOjJ/stX7tecCaOxhB3l+6IWPyoQQhsq/26ys/5HV85lHd8KBoJxDHHjLSwQ50WwPXDtjFyRWYTJ89TzBhSW3ovl2od3G4Jd82CHq6R3mMEFs4xRQQGc+MSUpWYsAxU0Sr6Ls5hKY3/PmIk/Pc4Ujn1HDKBmNnmK6iYWs/JsCoynLbb7ZmU0yiFIZEPVeHE+dBbkpm9a8cfZecCLRgVU3jHEtXANPjEjXvLvhyXdVHd5xFPYOZviXc9hlZ9a31RtFdpd4bYoKE+SCRnXKURDXKV1f9uylQraceVacgelpudLLHpr+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01af47a6-36dd-4e88-6b14-08df4c4b6e64
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:58:17.1253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zx6NSXo80QhYLoperlM55eiAPuXNzvimlG6u4Ap4M0QZy1WUjPMeLnIsY8RLCd0FTjskEwRV/A0Y1XiVuQli4HhxMmKASH6ecnGaxP1bCO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/2026 10:27 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Due to DC balancing various VRR functions are now accessing
> the hardware, which might surprise the casual reader.
> Annotate all such functions with _live which hopefully
> provides enough of a hint that special things are happening
> under the hood.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dsb.c    | 10 +++++-----
>   drivers/gpu/drm/i915/display/intel_vblank.c |  8 ++++----
>   drivers/gpu/drm/i915/display/intel_vrr.c    | 18 +++++++++---------
>   drivers/gpu/drm/i915/display/intel_vrr.h    | 10 +++++-----
>   4 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index 299d778520a2..e055e4ef9311 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -776,7 +776,7 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
>   		int vblank_delay = crtc_state->set_context_latency;
>   		int vmin_vblank_start, vmax_vblank_start;
>   
> -		vmin_vblank_start = intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
> +		vmin_vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
>   
>   		if (vmin_vblank_start >= 0) {
>   			end = vmin_vblank_start;
> @@ -784,7 +784,7 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
>   			intel_dsb_wait_scanline_out(state, dsb, start, end);
>   		}
>   
> -		vmax_vblank_start = intel_vrr_dcb_vmax_vblank_start_next(crtc_state);
> +		vmax_vblank_start = intel_vrr_dcb_vmax_vblank_start_next_live(crtc_state);
>   
>   		if (vmax_vblank_start >= 0) {
>   			end = vmax_vblank_start;
> @@ -792,12 +792,12 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
>   			intel_dsb_wait_scanline_out(state, dsb, start, end);
>   		}
>   
> -		vmin_vblank_start = intel_vrr_dcb_vmin_vblank_start_final(crtc_state);
> +		vmin_vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
>   		end = vmin_vblank_start;
>   		start = end - vblank_delay - latency;
>   		intel_dsb_wait_scanline_out(state, dsb, start, end);
>   
> -		vmax_vblank_start = intel_vrr_dcb_vmax_vblank_start_final(crtc_state);
> +		vmax_vblank_start = intel_vrr_dcb_vmax_vblank_start_final_live(crtc_state);
>   		end = vmax_vblank_start;
>   		start = end - vblank_delay - latency;
>   		intel_dsb_wait_scanline_out(state, dsb, start, end);
> @@ -932,7 +932,7 @@ void intel_dsb_wait_for_delayed_vblank(struct intel_atomic_state *state,
>   		 */
>   		intel_dsb_wait_scanline_out(state, dsb,
>   					    intel_vrr_safe_window_start(crtc_state) - 1,
> -					    intel_vrr_vmin_safe_window_end(crtc_state));
> +					    intel_vrr_vmin_safe_window_end_live(crtc_state));
>   		/*
>   		 * When the push is sent during vblank it will trigger
>   		 * on the next scanline, hence we have up to one extra
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> index 99cb648cab73..aa108ed27de7 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -667,17 +667,17 @@ static int vrr_vblank_start(const struct intel_crtc_state *crtc_state)
>   	}
>   
>   	if (is_push_sent)
> -		vblank_start = intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
> +		vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
>   	else
> -		vblank_start = intel_vrr_dcb_vmax_vblank_start_next(crtc_state);
> +		vblank_start = intel_vrr_dcb_vmax_vblank_start_next_live(crtc_state);
>   
>   	if (vblank_start >= 0)
>   		return vblank_start;
>   
>   	if (is_push_sent)
> -		vblank_start = intel_vrr_dcb_vmin_vblank_start_final(crtc_state);
> +		vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
>   	else
> -		vblank_start = intel_vrr_dcb_vmax_vblank_start_final(crtc_state);
> +		vblank_start = intel_vrr_dcb_vmax_vblank_start_final_live(crtc_state);
>   
>   	return vblank_start;
>   }
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 6aa99bcec448..1042d00d1732 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1200,27 +1200,27 @@ int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
>   }
>   
>   static int
> -intel_vrr_dcb_vmin_vblank_start(const struct intel_crtc_state *crtc_state)
> +intel_vrr_dcb_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
>   {
>   	int vblank_start;
>   
> -	vblank_start = intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
> +	vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
>   	if (vblank_start < 0)
> -		vblank_start = intel_vrr_dcb_vmin_vblank_start_final(crtc_state);
> +		vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
>   
>   	return vblank_start;
>   }
>   
> -int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state)
> +int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
>   {
>   	int vmin_vblank_start = crtc_state->vrr.dc_balance.enable ?
> -			intel_vrr_dcb_vmin_vblank_start(crtc_state) :
> +			intel_vrr_dcb_vmin_vblank_start_live(crtc_state) :
>   			intel_vrr_vmin_vblank_start(crtc_state);
>   
>   	return vmin_vblank_start - crtc_state->set_context_latency;
>   }
>   
> -int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_state)
> +int intel_vrr_dcb_vmin_vblank_start_next_live(const struct intel_crtc_state *crtc_state)


Does it make sense to mention something like: _live variants read the DC 
balance registers' double-buffered

copies, since DMC can write the programming-side registers ahead of the 
delayed-vblank db point?

I will leave it to you. Change LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> @@ -1234,7 +1234,7 @@ int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_sta
>   	return vrr_vblank_start(crtc_state, VRR_DCB_ADJ_FLIPLINE(tmp) + 1);
>   }
>   
> -int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_state)
> +int intel_vrr_dcb_vmax_vblank_start_next_live(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> @@ -1248,7 +1248,7 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
>   	return vrr_vblank_start(crtc_state, VRR_DCB_ADJ_VMAX(tmp) + 1);
>   }
>   
> -int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state)
> +int intel_vrr_dcb_vmin_vblank_start_final_live(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> @@ -1259,7 +1259,7 @@ int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_st
>   	return vrr_vblank_start(crtc_state, VRR_DCB_FLIPLINE(tmp) + 1);
>   }
>   
> -int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state)
> +int intel_vrr_dcb_vmax_vblank_start_final_live(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 19c7990be1b2..3928554c0424 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -49,12 +49,12 @@ void intel_vrr_dcb_reset(const struct intel_crtc_state *old_crtc_state,
>   			 struct intel_crtc *crtc);
>   bool intel_vrr_always_use_vrr_tg(struct intel_display *display);
>   int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state);
> -int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state);
> +int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state);
>   
> -int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_state);
> -int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_state);
> -int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
> -int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
> +int intel_vrr_dcb_vmin_vblank_start_next_live(const struct intel_crtc_state *crtc_state);
> +int intel_vrr_dcb_vmax_vblank_start_next_live(const struct intel_crtc_state *crtc_state);
> +int intel_vrr_dcb_vmin_vblank_start_final_live(const struct intel_crtc_state *crtc_state);
> +int intel_vrr_dcb_vmax_vblank_start_final_live(const struct intel_crtc_state *crtc_state);
>   
>   void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc);
>   
