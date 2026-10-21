Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2451606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VLgUJEc6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DF810E0BF;
	Wed, 21 Oct 2026 05:05:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9D610E0BF
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 05:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792559097; x=1824095097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=35AF0G5mkxEvlpqxXlW3WunUpuVWUt/lR16gH/yXOwQ=;
 b=VLgUJEc6XRV0Zv1VmFSWk2Vsly7kv/GV75mxF48KaUvhsWrvM694UUXL
 znRAZCb9DVOBHeMeHEOD4Su8/KCC42wN82MStxMFCgbxS1qKGwn+afSY9
 BLPjT63F6gxbL2JSdIBq9qio5fRDVk3tuWS3siNLeQBB5hypR9ipDbnNS
 MpQvUoqTS6JRMxcXi7cbterw9sBHPC7BiFXcPUomjVcJWZ87ppbkhoWm3
 Xno5aBrRsopqruibqUMgeVcGByzaAOAyJWn0beEDpWbi9jTleEsH3CEpk
 mnuooJURIOY0NXh+xKVqp/3aLtmKslzxttJfRspVVRkYnDiV+6dbpgzFZ w==;
X-CSE-ConnectionGUID: lyxsHto5S/SaTAOLLbsL+Q==
X-CSE-MsgGUID: jT0PkGwQToy67eHiZFBzTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1173966"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1173966"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:04:56 -0700
X-CSE-ConnectionGUID: 4O+pHLbqRkCqKgJMoY21og==
X-CSE-MsgGUID: MGAaE+qpSqeNmQXOiMblOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3038178"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:04:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:04:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 22:04:55 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFTCNS0QS/iAK2C4RI9FhXihEeiWbaRzDpSAkFRkRFyqh5FeCdd3v4V9cnZYiFkko3Wbzxyhl4azbaFCVbHaZtzR1rAIi67PjfWX/WEwLRAOHhuUA3IVk83ViIt9l3Zhf/GIalOzoGwzSto3AZzFcVLCu7gY0DvWkY3i+HweaTdv8MnwH9OkaCuY+UIRhwNBlTM2c38b/xTo7/DAGUYVMBWD9bPY+ulDH7t6M6itMBNxHOfm/SBsNNS7NGzew2Mjx0eOXpqAxiLUl9L2IO8rMGEfrOsoC2+omONbA8SzcpVlAHLgraiw0i7nFjbLe3IqjxUihdIvtYsW2xDo5IVWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwrBjoxGUsE+ilCE4z4J1J88TdciPX1CcIuU8REzbFw=;
 b=xUjDxzAtnBpxvLfqmSbi46cDvi/PSPgS8X/tqa6GkLkOEvjzppU3yGT/uZ7F7LZ9r9ZGaOxDArax17wQG5CJELJQ9TY7A9xSGTU77cptEIPgjm1TiPv7fdr90QFXqM6u7pVqZ3KIsMj1JLGMa2pDnNRbEjj9tehOgxXxKxhULQer9zNj/g9/eXX3kP3kNYPw65FLbv6PYRrf8PfVsyFkxNB8FDbyZlM4UieQSFesbUE9vGnJPZ+sDntBO4t8+JWzXtv2UehkzibKw+y28YkFKjtCZzOF+gbijf+e37a5F20M+diuE5A6XYFA1pZhRJjaKr/XGS7tth/z+5fw80yRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by SJ0PR11MB6670.namprd11.prod.outlook.com (2603:10b6:a03:44a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 05:04:52 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 05:04:52 +0000
Message-ID: <8ad8e21b-f13a-4df7-b6c7-b69240da08ab@intel.com>
Date: Tue, 20 Oct 2026 22:04:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use a dedicated workqueue for VM rebinds
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20261019230142.1112281-1-jia.yao@intel.com>
 <ateYILtvzWfEkwoi@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yao, Jia" <jia.yao@intel.com>
In-Reply-To: <ateYILtvzWfEkwoi@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To PH8PR11MB8040.namprd11.prod.outlook.com
 (2603:10b6:510:238::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8040:EE_|SJ0PR11MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 748069cd-41a2-4a01-aa12-08df2f30d6f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info: LT+R1dA9zHWssqZFjo86lIXGqNuEHxHYw1kf9ZY6ahWhXfuP5A9jJfSI35qWIQN70QzwbBhGAOg9W6yKDcLTznaD39Ae397LN5Z4wtzle+NnBsFczNWie70pluGtSPFPxn4tN6uU4JOW4SMr7f+znliDGCRVej0inJcTaC91Wf4ldxfRuOqgewUPlTwbiWU1nHH/KoA0y5BcjdWwgfohwHTZykXdO31sJb59H4lGT6QI1CNKlL0g4d+GkXUbD888ZYuTYeypaRy315f/GWKLs75RBDjV6ZRNd2ATRfLVEa8wazhDdAyIDCj24x0OmIwJRf8yqWbHXxUOzb8Wd+/jS7FVyNM4gKqtjE3v/PODhl9AAgvTkMMHfPGxPazJkusThiu/OQclaT2xNQDxglVs8ODOmslkpGV2o8p3G/KcEfyJ+GC52/ORouqTPt6OxfL7BwENisODUt7TX7+Bdz8qhRAunIKhjDcaUgSawxSrWkx1a1CqknVdyBlVhEK7kI6pHxK4H48xdJn24yeYAzLqTg2+rwR1zwlDDOxa0XWj5uInKUWsvTe+NUncKI0G1qOgMi68qwdsMNu7RAiGNrizf6ZaGVURaHicXCDFuf9sec1TOqR5m9r6gh44z9JtKKLnIeT/WMy+dVQNg2ELi/Dy04c9D5CMXaDYXTS5q6ZFLUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJLZEI4RVA4dXdVM2p2bDJUQWdTM1JvNGtRL0k1K3AyUUNySzd5LzFwN0JE?=
 =?utf-8?B?RGhwSC84T2sxRFlLSTRKKzNGbmJVZkM1UnZrby9IZ1ZJWG4xdHRjVzk0cTlP?=
 =?utf-8?B?aGkwVC9yTVQ3SWhhQVVpY2JaaUxjWmlTK2pscjl1Q1VYRW5hWWZFSm5FenhS?=
 =?utf-8?B?Y2xhMi9ER3F0SC9EYXZ1Qk9raDZ2ZnovQXNIT016Qmw3cGg1S1NPcXNtSUNa?=
 =?utf-8?B?dFBGUnBCNko1OWdtKzJzM0VTZG5YNDRBOXJkV0x1akR1SDJ2NDg1eWpnTnVR?=
 =?utf-8?B?Rmd1L255WTZkTDBNY3dabW9xeGpYUzN5a1JUSVJKb2g3NFBOS0NFTm1EVUFv?=
 =?utf-8?B?UlZOa1l6bXBYL2pmQUJseU5RS1JVL0xXR05JU3hSalgzeUZYYnk1YmhMSWly?=
 =?utf-8?B?eGtvd3R1dXc2SGd3QS9tOWpneThzUXlTNXZ4ZFYxbXZWYmxwYUtYeWhiMHJU?=
 =?utf-8?B?M0EyZDl5QTRMTkhjeWlqbXhoZDg2QjdrYmQyRHUwZ1pFS0dPQVZEQnNzV0N0?=
 =?utf-8?B?L25nYTlZR0pjTHUwcnRCK29LeGhGVVEvdE5zbGVXblZCQ29sb0NuSWlUTUFR?=
 =?utf-8?B?TWJxVXhtaURGQUx3QU0zRUdyTHNieC9iemErUy9GMjM1WVh3Q3dEcTBnQWUr?=
 =?utf-8?B?WlN6eCtiRjJ1UXc1WVlLNlhwczkwWlV0dTVENWFjbmh1TmxRUmIyUW9OODNM?=
 =?utf-8?B?aXpXM2doeWZPQVR2eGRwZTE0YjJDUGpzaU1DdVdsQkxPcTBHRmRXRnBjS2dW?=
 =?utf-8?B?WkxjcWUxdkpTYUtoTVZPeFlVK0g4U3ZtMkxtRWUzd3FpVklpV2c0bVVNVFNI?=
 =?utf-8?B?UkpPKy9wcmsvYmI5MDZCeTdBakZkVW0zU2hOTHNLYXJMVFdYTzIwS1Mwb2Fa?=
 =?utf-8?B?ZHAxVGZVSUNXV1NxNHdLeWRTZGdzZ0swcndjbmlhbGwvSG5qblBWV0VTNXJr?=
 =?utf-8?B?allDYjFyWWdlWEkrVmx5dko0ZG05a3ZtbmVTNEY0QjlZYjB1OXFMY2NFMmRw?=
 =?utf-8?B?U3M3a3pmWVdoVFVCRUY3UGV2MGtHdFA2cnRoQkRqNkdZZU5mZWV4WU5EY2U0?=
 =?utf-8?B?TWE5d2pUMHFmamZMazJGdU5SLzlCVTcwVk9raURqOTF3L0U4eURISWZCeGh0?=
 =?utf-8?B?S2YrZmtBMEFzdVlhekNCTWlNcHliWjRqby9uZThFSWFLZnFKUVJ0L3RKbFJj?=
 =?utf-8?B?SlNiY1RlZGpTOHRTK0ltMUQ0aWhNd2xJa2ZacXQ1ZlZSV3E2NllocjVaNWVw?=
 =?utf-8?B?T2Fia2EyR2cyZGtUY21xalpsZWNROG9DRUlKNEZpS2Q4ZEROcDJVR0I2d0o0?=
 =?utf-8?B?Qy9SUkxka2NRMjRVTHQrWVhGcloyODUycVUwRU9PbUdiVUpWR2dCL1hGb0pE?=
 =?utf-8?B?bTZGOEFzZWVOLzdZVjlCYXBmVEdoU21kQWNDWjRDcDJhUnROeHA2NEk2czY2?=
 =?utf-8?B?WlFrcnZBdnRDL3l4MjZTSFh0YkRIYWt2RkhBaHlTaGlsRVRyTmtwTldsK24z?=
 =?utf-8?B?amdsdDhCRWpadzAwdURLYnF0Qm9vcFE1M2pqSzc0Sm1XWjEvbnMyTjdQVC9U?=
 =?utf-8?B?MjJjZVVVaWVzbGh0QTB1OVRpbHFHRkJRZmVuU0lVM3hMVm05dWhGUzBkaE44?=
 =?utf-8?B?UEoralFWMTZvOHRwQmU3aXBJYm5SREtNWVV0TDNpTG05UGRKYmZzLzdjejVn?=
 =?utf-8?B?YjhlMlpyaTFyY2RaZ3hWYU5DRENlT3ZzS2NBWXZFR0VxSjR4ZGYwZ085eW9w?=
 =?utf-8?B?Q1ZPZGt4WXpSeEM4cmx5aGNOcEtmdTJhd2RKNkJFV2hIL1BGN3ZuU0tTWkZX?=
 =?utf-8?B?V0hld3h6UWxWK3drNXFKYWsvYjN4cTRMNUI1YlAwVC93QWhkRlBzUkNhSlp3?=
 =?utf-8?B?dUxhNzhQN1N5VVM4b1d1YWxrTDE1K0UrV2dLb1ZVUzJCQTFNbDBsbGp2Ynhy?=
 =?utf-8?B?Mnd1SHpLeVg2QTkxTXl1ZDczSUJvcWdMVHhXWWtzc1ZFVFhiUVNtcUUwdXlI?=
 =?utf-8?B?NnlldHZzT2hmMWVEclFkTmc5ZU5hbUdCejZCU0JoaWtIWnJibWRobVFCQ2dj?=
 =?utf-8?B?U0FvcUtyRElXQWF2OUN0Vk1VV204ajVKcFkrYnk2NTRPb014N2EwMjZXMWFj?=
 =?utf-8?B?TlZtR00rSUhkRE13UjFyUFluZHMrbHdDakJXVXJvRU9UM0UrSkdVd2ttWTl0?=
 =?utf-8?B?OU1uK2FidVVVZlF1SEJZSFY3Vmw3bmZxRUREL21jb0pRZGdFOVNPY3IzWitG?=
 =?utf-8?B?RXRuSkdsTzd2cnd6Y0tWSVg2T3IrTDhWNFJhWXhmZmNkSFh3WXRYMnR1dnB0?=
 =?utf-8?Q?LFJEWDbDVeBqAcdYk6?=
X-Exchange-RoutingPolicyChecked: n0TN0VP6hQTxvtbVTNyjFzQ+Y5JJyR/8iIA/dvLqAWIcQBPjPPEwZWoGQ4tLhoQDQCRT+VRE3jiw+H7S49YtZhOCLt7pERMOcdZptyYcXcAfLR9MrwEzrsRzB89n+kQcpBtt30huPGLjjwW8PgeXUa69egOZFAT4IBsXzceevmUeoVCKGh6sbZUZEeaT7aB1dLrjzeucz22PSQLPupYAqrb7EJW01a+Fp6mjMxMcRV2PWy4gFrYpTQVJrl6fksCMjYn0gQw7EI31vdUg2zZ2bmTnB96Kj3/SoIy+TwYY2p0wix0ej7C3YBvVjFHvq5ClA717ZtTdvhTOPUy3v9nZNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 748069cd-41a2-4a01-aa12-08df2f30d6f1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 05:04:52.2535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/mflp5rLd9J3m3rXUh4WhlL9DexRrvLBlM4Zl6kkGXbbVsS9E0gKhJS+TGyvUVETdSU5BkWuElpmrcxGlKzwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6670
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/20/2026 9:34 AM, Matthew Brost wrote:
> On Mon, Oct 19, 2026 at 11:01:42PM +0000, Jia Yao wrote:
>> VM rebind workers may block while handling HMM faults or waiting for VM
>> fences. Running them on ordered_wq can stall user-fence notifications
>> and VM TLB timeout work queued behind them, preventing forward progress.
> I don't see how ' VM TLB timeout work' is related. Those are scheduled
> on the GT ordered work queue.
You're right. I'll remove it from the commit message and the 
corresponding comments.
>
>> Move rebind workers to a dedicated ordered workqueue. This keeps rebinds
>> serialized across VMs while allowing fence-related work to run
>> independently.
>>
> So this isn't a deadlock rather just a delay in user fences signaling?
Yes, no deadlock observed, I'll clarify the wording to avoid implying a 
deadlock.
>
>> Signed-off-by: Jia Yao <jia.yao@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       | 12 +++++++++++-
>>   drivers/gpu/drm/xe/xe_device_types.h |  5 ++++-
>>   drivers/gpu/drm/xe/xe_vm.c           |  2 +-
>>   drivers/gpu/drm/xe/xe_vm.h           |  2 +-
>>   4 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index db0b883322ef..f1dd4b7842a9 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -385,6 +385,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>>   	if (xe->preempt_fence_wq)
>>   		destroy_workqueue(xe->preempt_fence_wq);
>>   
>> +	if (xe->rebind_wq)
>> +		destroy_workqueue(xe->rebind_wq);
>> +
>>   	if (xe->ordered_wq)
>>   		destroy_workqueue(xe->ordered_wq);
> How about s/ordered_wq/userfence_wq to make this clear what is used for
> and nothing else should be scheduled on this.
>
> Matt

Good suggestion. Once rebind work is moved out, this queue is dedicated 
to user-fence notifications. I'll rename the device-level ordered_wq to 
userfence_wq and document that no other work should be queued on it.

Jia Yao

>
>>   
>> @@ -515,9 +518,16 @@ int xe_device_init_early(struct xe_device *xe)
>>   	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>>   						       WQ_MEM_RECLAIM);
>>   	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>> +	/*
>> +	 * Rebinding can block in HMM or wait for VM fences. Keep it off the
>> +	 * queue serving user-fence notifications and VM TLB fence timeouts,
>> +	 * which must be able to make progress while a rebind is waiting.
>> +	 * Preserve serialization between rebind workers on different VMs.
>> +	 */
>> +	xe->rebind_wq = alloc_ordered_workqueue("xe-rebind-wq", 0);
>>   	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
>>   	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU | WQ_MEM_RECLAIM, 0);
>> -	if (!xe->ordered_wq || !xe->unordered_wq ||
>> +	if (!xe->ordered_wq || !xe->rebind_wq || !xe->unordered_wq ||
>>   	    !xe->preempt_fence_wq || !xe->destroy_wq) {
>>   		/*
>>   		 * Cleanup done in xe_device_destroy via
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 5553415afeaf..705c487e3c6f 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -387,9 +387,12 @@ struct xe_device {
>>   	/** @preempt_fence_wq: used to serialize preempt fences */
>>   	struct workqueue_struct *preempt_fence_wq;
>>   
>> -	/** @ordered_wq: used to serialize compute mode resume */
>> +	/** @ordered_wq: ordered user-fence and VM TLB timeout work */
>>   	struct workqueue_struct *ordered_wq;
>>   
>> +	/** @rebind_wq: serializes compute mode rebinds and resume */
>> +	struct workqueue_struct *rebind_wq;
>> +
>>   	/** @unordered_wq: used to serialize unordered work */
>>   	struct workqueue_struct *unordered_wq;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index e7f421a43516..88b4f6b19fdd 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -501,7 +501,7 @@ static bool vm_suspend_rebind_worker(struct xe_vm *vm)
>>    */
>>   void xe_vm_resume_rebind_worker(struct xe_vm *vm)
>>   {
>> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>> +	xe_vm_queue_rebind_worker(vm);
>>   }
>>   
>>   static void preempt_rebind_work_func(struct work_struct *w)
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 06138c3c4315..25c8760e2392 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -259,7 +259,7 @@ int xe_vm_validate_protected(struct xe_vm *vm);
>>   static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>>   {
>>   	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>> +	queue_work(vm->xe->rebind_wq, &vm->preempt.rebind_work);
>>   }
>>   
>>   /**
>> -- 
>> 2.43.0
>>
