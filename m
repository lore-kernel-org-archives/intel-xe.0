Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C26606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sz6EcJLT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAC610E2EF;
	Tue, 10 Nov 2026 23:42:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B826E10E2EF
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794354166; x=1825890166;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=24VdHskXWKjFS/SOsGKyGX+5ewrzP7qW/3m0d3px910=;
 b=Sz6EcJLTH6zKoILo9XNmswKBmZ/IMrk0m6Jbe+tSsS8mnpDeP0RKUPg8
 5O+jDE5X316tIQsreUi0sxQ7aFde98Sk/vzbXmNvQVjvpDfy/6dMbW6YV
 FVubPks33oPmn8RdYq64DwUZYTgqrHGmxv4WsNEV2RALBzUxSDUqI18bo
 Q/OE1GYAMjp4lGP0FXvV381a8A2WrhOLXsZd3MoZ61PfDunEyP85KYCmo
 us1bUMznSOS5YWBFC3eXAWWMrrEBeJObD6tEGULLW2LiIxlzWxnwa+Q+G
 KJobBmEy1GCKadXRT4blgL4L2q12bBzR4RaqvKWB1r/sBvCw9c+VJ/moL A==;
X-CSE-ConnectionGUID: mjMN/UOgSQiV/ndv7gnQQg==
X-CSE-MsgGUID: f0wpSuPeQn2qeAK2nnOUFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3000323"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3000323"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:42:45 -0800
X-CSE-ConnectionGUID: C6UkvjrZQPGMklFuxRrfug==
X-CSE-MsgGUID: DbzcENZ5SD63uAxk8bsB4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8306544"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:42:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 15:42:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 15:42:44 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 15:42:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArxPqhe1bsleImvrOf/PKJLKA+2v/+CzZmwrX1ndwlJX+Rik5SEaOs5SIZNr2OnxsR2eQuEjNImSlZjhd8PGWWwsFUsAiF18PFBEZJMijF2QH9pXHmKC8F8dgRZpvxMX47ZehpyAcMiMx8oIVnJ+GXgacBgCTe9WPcEFDABeXagpZj4th8RNt8btRitjlZZjw0yjb7boJ9PxkoQczR+NCcz0+Up96uBKdWMWxHYNVfqAU5sH0hCYy4kok0lyUplMsT9F6DrEQ2ZNcqJGeEU2QtZzGHPME/rdsGGzy8+pFVK3Z+hq5wMT61ZT86VbxmTAKhtIckd9HDMU4Vxs3NRrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Z5CJvkoRgT9ItfaXQa6tluV3yA367ZMIXRU2/CVCT8=;
 b=f1Rsp3KxADEy4DGbG3hijzd4WbkNpryVDBxp+DMdnwAbIC0ImlrljUl3xd13L+6/jaCDEQftJlDszWtHbWOr6WmXCWqxz31YHu//cpdfTrKn7u/CnxfOHgzpNgW3ImMrBa5x//KeP7qBcD+IvE2Jt4DZ3Fy2ryQ7nx3epWvLW2hp7/xFfKQ8Mln6osqHiPvnd+Lmsou86mxBX67qmxx39fU0SEZVwTKhHp+6TwrlCQKHO7a8Caj1UmSG2o4peudynwC22yKWbY4kIIecABSawYwrNdos2a0q1a82WBxm/g4hXFynSZiXnBmYVZtxylGallTKLg6VwfF9Xe5sX/5RxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 23:42:40 +0000
Received: from CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646]) by CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 23:42:39 +0000
Message-ID: <9f2c603c-5055-488e-a61d-fb795c11015b@intel.com>
Date: Tue, 10 Nov 2026 15:42:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Sanity check GuC-reported hwconfig table
 size
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
References: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
 <20260908231854.1218934-6-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Narvaez, Jesus" <jesus.narvaez@intel.com>
Organization: Intel
In-Reply-To: <20260908231854.1218934-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:303:86::9) To CY8PR11MB7010.namprd11.prod.outlook.com
 (2603:10b6:930:56::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7010:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: ad2076f1-1f22-4944-03cc-08df3f844e50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|11063799006|261026121527099003|4143699003|261021121427099003|261022075727099003|261102123227099003|261026140227099003|56012099006|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: em8qxrsdVjtY7zSCs9MUU+/ecbjQ8tVh58Sc9NuU0KY9VktR6p3Lfz1iD4KT9bJFlBqSLAVez/8Yi+tDos+KYEh8JAPmimUEdh5Z/X4/9yEyGuhhB6nptyLNhH//gcOwpUP859zoGEBtmKWcrxdN8FhPwD51Z7TShPGwL4xCp+TZT076DWmsTF3k64avz9z5shynDC1zlkFeTYCT7gpQpboFyFpmn1MUHDRCX05qMDR/p+L/+3A1I5mQZWNybzxWXwB7SSz7UA2bfxjW4R+4esaQGO9ybo1PV6jtjO0RQW2xvYzFEv7zpZCwm2rr1s1l64V/SPdMjNIaV0PUgUjTzGAWOX1GJmSksvc41lGDw+tsWcMwEtKdqENnaJvRxIMWAZY4Oq2gFCXwMDj9SSev64y55F8wkKVDO7Fg0nJ87hCt29YPf3i9QSsdCH9sD2anW52XXuv4EIy5kRWHls3crqolEROMIOejj/uK6Qc6e8Kwlb6kMer8jKXQ1P1b5fmWoNxLm1VM/1sjvbdY3qNbxyOL8+re22/usG3f5bdq41UJobFodew6zi+CM7tk02qyPp77tCJNonXNz7rTSsfFJrEdiGx3VxYj7LBXwpNgNqr8cUl/oKJLcMO2MFEr1a9UCIFX79t2OoARQu7cJfHO9XJCCdOfgV7k55YnJ/ee7Oo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7010.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(261026121527099003)(4143699003)(261021121427099003)(261022075727099003)(261102123227099003)(261026140227099003)(56012099006)(261022105027099003)(261009223027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXpEODVRejFadDBQSXVpbGdZMVJkcTljcndMNjdvQ0oybnpTTVoydDd2RHJw?=
 =?utf-8?B?WFdFRnFqekRxbnY1alBrd2JtVzhicnJJRXVsc0Z0U01RdFk4WVE3MU1PZWd2?=
 =?utf-8?B?ZGFITExCeStaSTY5TFRteTRzdVQ5aHRkTnF0WUhQcWZIZ2ZldThHWWcxaHVq?=
 =?utf-8?B?Sk56YXh6L1dYQVA5MnhBN082UDhMT21NL3dobmx5aWpnZjZLTmIvajI2UGkr?=
 =?utf-8?B?L1ZLUzc3cVlHZ2p5Wk1lckRXRVZITzhQaWZ6QVhlS3U0L2trTzBkWWpabjY2?=
 =?utf-8?B?NkdBK05XTkROOUREbmhpT2NheXNKMy83aStHbEtGNlJ6REZTZVcwaC93aEp4?=
 =?utf-8?B?TXkxckpkeDIydGpNaFc4R3lVMUF2THdiOURTUDlOaGV0MUJENDlmY1FOQ3RH?=
 =?utf-8?B?em13VUZUWnNHMGJCS0ozSVpMYXk5Sml1Z3NpSlZiU1o5cVU4azJtODBzTDRW?=
 =?utf-8?B?RGhNOWlZdGxWQ0M0MFBOcDZxUENmQVN0SzNTWGRobk9nekI5THZEY2ZZWnZO?=
 =?utf-8?B?UFFWZWZrRlRzQS9Ic0ltWFI1MHJYd1pZUTV6aVo0QVcrTWdjL0tCcWlTdkZZ?=
 =?utf-8?B?QlNpVFlyaXNBalUwZkg2emphUkNXQW5PQjF1YjJ5UzdwS3J1Q2pYckxQcmt1?=
 =?utf-8?B?S212T1lTZ05DTFdWaW40QmtsM3ZJMjB3Y0t3ekFkNWREOUJBWThQSXc3TzRu?=
 =?utf-8?B?SE52amZZRkc2Sk1kYktTWmpkT3NEaVQ0a3Q4SS9ESGJoRFR1QkhlN2xROHNS?=
 =?utf-8?B?QjRMRzZxNHhVZU9JazFSVGFOSmJsYmJGMlI0QUtwZmhHanFXVGY5ZzN2K3JV?=
 =?utf-8?B?ZTVpWjZzRXdTQkRZWnRFQU8ySzVxZnZSWmowY21EY29JdG82MXZjdnA1c1RV?=
 =?utf-8?B?dFRXd1g2ditlQWErNVhVcWh6YmZWTUJna3FWQjlNalhxbk9ZNW5YWVpjUFV4?=
 =?utf-8?B?cXZFM2xOelZFSFlZUE5pYmtpc0ZRYU1JdmVENStTUS92RnZ4eG5DcnhlWk5N?=
 =?utf-8?B?UkY2MkZNNUtXUHByQW55TzZJRDVTTndWMm54TGhXdlJsOW14cllMWnYrMW5w?=
 =?utf-8?B?NEJGU1ZCLzV2ZEpieThuaXhMUVU4N1ZmdVR3NnZUTXpxUXdlblpoQ2I2a0pm?=
 =?utf-8?B?VWtBUmdwS1VVSmFNZkl3Y1pnUlFKa2l0VlRoNkwrbFJuQy8xeVZZWTIzODJL?=
 =?utf-8?B?eVRKelhQeE4rRE1FSFk5Y0d3VzZScmtzZmluVW54T3gwZE9mL09WUjJkVzRS?=
 =?utf-8?B?N2p2dmtJSHpMdE1FVlZmU2xqWXpBMHczNGtDNEgvUW5VZUZBa1RDc2pTNGpB?=
 =?utf-8?B?b2gzK21KTGR2NGlvUVUxV1dPNmhvOHNHc29FNjhTOFNVVVhjRTROVGRtZGF1?=
 =?utf-8?B?bHUxZHExb2UxK2ducDczTmgyZmR4UlFwb0Z1VlpXZXppODlKaU9xR0VxODF1?=
 =?utf-8?B?Mi83bSsvd3VyZTNNeHVRVzV2K2cvaDg2b0Jzb251ajlSWE1PYVBqdFBRay9K?=
 =?utf-8?B?b2thdEhKK3NDZnV0ckhqVm5BZXhWNWlFeS9HYkFwSFlQUFhRejlrUXdSQy84?=
 =?utf-8?B?YUE4ZXl0NWNxOHNoZjlPWVlZcDVWeVhCM1BvWjZ3TVRaMkU2NmFDeFg0Z0Ji?=
 =?utf-8?B?MVA3L2RNckRJWmlsWmNtcGRGSWEzVEhHY2dPMGhEU1BXcHdnTDRyOUZYRWN2?=
 =?utf-8?B?akQ0M3BBMG9VaWkrNEZ1cjRBTnpIajB5dGFYbjhxUEF5MmRnMENCSU1HWGlQ?=
 =?utf-8?B?YkRTOGR2Mnl2QzlhMVdTZnNYc2dwdFEydDE3Q2gzR1cvTjhSQnhNY1FmQys1?=
 =?utf-8?B?ejc2Z2FUck9kLzllRFVtbDdobnc4MHJnRUZKVGNGTm01blFwcERKekllOCtM?=
 =?utf-8?B?anRGcVVDdFhvVHNqdjRMbDhOMUg3eXBiT1hUQkNYWWlGbFFEZys3SnREa1A2?=
 =?utf-8?B?dkJWZ1p3MG9wcmRndXJDSnZ6WWR6WVIxOHZSV2d5NjJXQnA5VWVGQ2tRWHV4?=
 =?utf-8?B?ZkNEMFRkcEpRM0RTQTlESTdMSW1RVDNaNnR6K2poL1o3eldtdkE0eHJFdDZr?=
 =?utf-8?B?d3dua0hibDdOandyU1IxNUVMeG9zYzQwZUNvK2R2R3Q3VFhqaTUzaUFQSWhy?=
 =?utf-8?B?cEtZazNOMk5XeURLdEF6TnJ4VU9yZGJKT1ZlcmYwNVFlR092SmFqUXIxbWJ0?=
 =?utf-8?B?bU1ZUytpTUJQZExiaU9QUjNVNEtIRE9MK0RIcUpaWnpEUnJ2K2M3WndIMEc0?=
 =?utf-8?B?eXJGeXdDTUxYaUhkUk9MSGdORGI4UXB1QXRicnd3VGVRa0JTc2xHVytPSDht?=
 =?utf-8?B?aWNCNkxITmhaZXVJWDc2NUlUT2R0ZDhtcEs2bUlwdDVxcFdVY01vZz09?=
X-Exchange-RoutingPolicyChecked: BGAC5Hw4fJiKCLxVfDRF0smbtXrOJlR42GYrKIxejATfdME9zHneze0jGdbZub0HTtPSteBTBzZEce8eFfYDHwohPCRxMnTlqIuaPs642vbHYXOuIFJwp8se3jNyre8h9YmKkTFnaAJxLiq+tLH4Fwn0b8Lel4xXHcqznd/1HGvCIu07IxLJzw4IbM1HPTtG9fVGaHNdtacjkndbmEiRY8ogCk6LnMWlTphy5jK2/64IGoVOeUu1RF7KXjAcOHhq5lEKbQbOnCC4YbUE3Bj/FShiynaZfwi3CYiHRGzY4Hvx4GqfEiSd6tEUfL1YZdUWT2oe49THhjwImiUyc/qbTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2076f1-1f22-4944-03cc-08df3f844e50
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7010.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:42:39.2912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jGZvydXdk2kiweXP0rlYbbWxjcg5DCvbiNP3n1X1az1F4knaYOmxi0Iy405Z2w1p52F55/AJ/OUipFzN3TSyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
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


On 9/8/2026 4:18 PM, Umesh Nerlige Ramappa wrote:
> The size of the hwconfig table is reported by the GuC in the DATA0 field
> of the GET_HWCONFIG MMIO response. That field is 28 bits wide, so
> theoretically the firmware can claim a table of up to ~256MB, but in
> reality the table is much smaller.
>
> Use an upper bound of 4K to check the returned size.

Like with the first patch, I think you need to add "Discovered using 
AI-assisted static analysis confirmed by Intel Product Security." into 
the commit message for this patch.

Also, maybe give more reasoning as to why a 4K upper bound makes sense? 
Not a blocker.

>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Reported-by: Martin Hodo <martin.hodo@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Assisted-by: Claude:claude-opus-5

nit: Again, like the first patch, the "Assisted-by" tag for AI is no 
longer required. I think this can be removed going forward. And with the 
commit message updated:

Reviewed-by: Jesus Narvaez <jesus.narvaez@intel.com>

Jesus Narvaez
> ---
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index b300901dbb8e..fb8caf6e9240 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -5,16 +5,29 @@
>   
>   #include "xe_guc_hwconfig.h"
>   
> +#include <linux/sizes.h>
> +
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   
>   #include "abi/guc_actions_abi.h"
>   #include "xe_bo.h"
>   #include "xe_device_types.h"
> +#include "xe_gt_printk.h"
>   #include "xe_gt_types.h"
>   #include "xe_guc.h"
>   #include "xe_map.h"
>   
> +/*
> + * The hwconfig table is a small KLV blob, but its length is reported by the
> + * GuC in the 28-bit DATA0 field of the MMIO response, i.e. it can claim up to
> + * 256MB. Since the reported size drives both a GGTT-pinned BO allocation that
> + * lives for the whole device lifetime and several kzalloc()s in the readers,
> + * sanity check it against a generous upper bound instead of trusting the
> + * firmware value blindly.
> + */
> +#define XE_GUC_HWCONFIG_MAX_SIZE	SZ_4K
> +
>   static int send_get_hwconfig(struct xe_guc *guc, u64 ggtt_addr, u32 size)
>   {
>   	u32 action[] = {
> @@ -34,6 +47,12 @@ static int guc_hwconfig_size(struct xe_guc *guc, u32 *size)
>   	if (ret < 0)
>   		return ret;
>   
> +	if (ret > XE_GUC_HWCONFIG_MAX_SIZE) {
> +		xe_gt_err(guc_to_gt(guc), "GuC reported invalid hwconfig table size %u (max %u)\n",
> +			  ret, (u32)XE_GUC_HWCONFIG_MAX_SIZE);
> +		return -EPROTO;
> +	}
> +
>   	*size = ret;
>   	return 0;
>   }
