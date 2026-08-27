Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EF6C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 11:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF0D10E3E7;
	Thu, 27 Aug 2026 11:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O28UTare";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEEE10E3E7
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 11:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787828789; x=1819364789;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MK9A9z2b7AXK6IhtzAurUQbRzxOOGcrUZs8NpWwUyI0=;
 b=O28UTarezypbAwA17H7Zj3OCX9fcAJBjbPl1FUfepeKUA+eSFO1hViW+
 jNDre9isUHgVc0IZBK2RrfSDbQrHeBW1iK3dGoxbyVv5g9n3DK/R/M3ZF
 O8/My9jmhs2rDdqjtFRD6PIduBItX+z1mdyy1prd4pTNC14qXb8wOonSc
 O8bjgcOTsS9XeGMNkIUuyMG4IaplyFNigFMs5kO9IM2GlvxjmEtTL9Ion
 EXnUbxoN4d80RuBWvgh+4mpjzkt+9QKW1KBcynznSu+oz9Fq7aj3h+ZZY
 si3UVabhv7OI5XUB0mzNbyRYgsLbeaiWJa62bUNHwIFnJGme+zVkAijm5 A==;
X-CSE-ConnectionGUID: muBCrBTUQzi/4OkAt6lSHQ==
X-CSE-MsgGUID: zlIor9vnT/G2OSkQkwqfgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88204544"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88204544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 04:06:29 -0700
X-CSE-ConnectionGUID: 9s8TTS5ERP6cmVpXS/9kfQ==
X-CSE-MsgGUID: OhBkKWs5Q3mG/zNKlzpo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="266055888"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 04:06:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 04:06:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 04:06:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 04:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1MoA3g1tGq4530QHcxMKxtusnH3USwLf+IhY2IaNhR4dSaepMhsU5rkzVYlox9mYMWE5cdHUQEp8eW5sGUktEDhjpvBDMG9E200BOhOs8rGo3LDD9yMF7stSopky+W1zrKcembHP7cn9uOFWjKx+g8VUp6913QpDaFNGR7BIAkIGH7mElqybiSwHVi3wkSrVfdqgZbVRAh26jX5SgsXDhibjwdDBAvLlWDiGs0ATN0S3jUs5MXx8EKOMlhGqWUTE3Uq3NV9WGXVXt0mXKYApVN+k/jx2t2LGaPjUYwxqgtEa+S+VUyzIktgDRPjZxOrVqnSoz7sP0DP4y6S8kZ3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKukvD2LzUK7bU60toJMflS6PJ2Va4eiGilTVeG9/0Y=;
 b=TBEFDhKmixu9Yxpw1VTBJh+u8kj0j7wuz4buYTbOiMR+kDwJ0jlKOjnKAcGRiR+pdRZ8EBxE2EZozN3/2sU7bDvRth0k966J01d3mQuyOtycZ1pQh1fEPs9YFoulEijRt4kViX0l2wT4NENcJFDznlWJw4WJAEA8YU+pcO5BK5Ov9bSj2LK2ihNqVYndvyiWz0d3Z1rxnmrMP4kMqX2qJA4KGwSlQo31xYTAq5fI6mk2J2Tg9iMh0aE3uY98i0O3B7zdOR2ircrxb4okTWGwd6E47/5e/WI071Jpfi7shy8n8/BP9OhWHOV83E/eIbjmztNoFw3eRUaY4KSIKhYrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 11:06:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 11:06:24 +0000
Message-ID: <1145b932-dd09-4307-b76e-0d4ff7008955@intel.com>
Date: Thu, 27 Aug 2026 13:06:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] drm/xe/sysctrl: Report 'System Controller event'
 error using SIGID
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-16-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260825110542.1359776-16-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL1PR11MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: 047da8a3-76ac-4f19-d2e4-08df042b3bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|3023799007|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: DH+Ck3o+h6zzcO8xlXDLg/lYKVy4xQM7RFEAelnVp9G9e2oEvPDWp07BFBHbuSk0fvV4hhVTmQvIpDtBLL7tZFzrVYlxCtaJOA9IvauNU3Rmpy+/D/gLNvwKWPQtUOLhnCRvn4VAcWV77EyqmgoQ7j/siOzsIAvVisVe7lHij0O1zK2+t7/JJ0J85KQE7DbQDbNph6n/I2nQvnieZaylPBkY17coMf29LzU9Msf0bF1KCxUVLGI0C2dZIXOEStFRgji0q0B8d5A4Ic01x6ALrzmw6XJ9SAIcjaH9gwy0p1vSoVYlXgzn04o0hfzH8aCFh+fcruY1x/+jddOhXUZ/+Yqhf9Q1fAvHuT0wg5r9pDKTULqBxV+3Ue8uH+IX6Xy5/fNlUJHA6tghBAVauF3Y8nFxFhZuTnikpTxmy/izzRneiae2efylYXMjiaihx5fZZRBsbvzQ/UeQl4FjOKe28T8J1aZZNn8sFMpOihioxg6wCdS01o1CsWh/8N/7ZLL8+Du2CNkAVBg8KrMYv0jQCeuHJ/T8jyTk2irfD4tq0je4xKlF1qNQb8Wf+w/Yf9mHjQClD45Y7WDOs3KSdKLgGhXi0OTu2WRwlsCGi2i9bPPQuNKQUdtv/tyBelLSMUUkxPq2NvEFZqpThTHEExLAtmNsTxnL8/tT3Yn+wf2wzxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c093aVptTnRJOUJWR3JuNWRYMyt0Y1pQU21WQm5pem9oblZvU0dnZTJ6Z1dx?=
 =?utf-8?B?Sjh4RlBZWmVBVE1jeE1VQi9tZ2VGemdOOThIMGJKMXA2Qmw1VjBNUjZnOURH?=
 =?utf-8?B?UzRZcDR2aE9UU0FCaW5ndEJ6cnlsTU1ZWEw4SHExdHE1aEtTUEdYMlJnL3hO?=
 =?utf-8?B?aTJmTzFabUVaYXJuOEtudTM2QTBnT3Z1SG5xL1NDM0poZHUxaHZ4VjR3Z291?=
 =?utf-8?B?b0RNNTlOaTZiTzg5REM2Uk9FSDNwTHkrN2RFYWp3cWg4QWNqd0NtajdldVlV?=
 =?utf-8?B?OWg4bSt4NTZUT2RCQmVJbUZIQjkyS2k2QXpPaUs0Q1QvUG9QTzlxWXJaYTJS?=
 =?utf-8?B?d2hkdWUxNUs5N25wcjc3eUxPNjNMdldZdCtFZVpJUzJ5UC9oVjRkand2cmxU?=
 =?utf-8?B?WDRqWDJjWFN3NXFzMWJEZ25yT1lQazJIUDdKUjg0akN3NTZMUi8rN2lpaFhR?=
 =?utf-8?B?cmg4WTZVelErcktReUU2akhjME9vK0hUS2pZM2ZzdGV4cGlzR0lQZWJ4YmtM?=
 =?utf-8?B?QW0zR25WampvVEZwZGNTVmlDalJwcmVGUzFvN0g3Z0hnbzhZSzJUZUJzYUNU?=
 =?utf-8?B?eFdab05OY3RZZHpNQjNVOGFBRlF6eVliMzNiTVdvbGVOMmFnbjZKNjVLak05?=
 =?utf-8?B?dmFieU45ZVpVUU02YlZrR3ZZWGVyczc5YnBoT2JFUGJrdVc0MGFnZEs4bHlt?=
 =?utf-8?B?ZVRyU3ZxQm9aRnJHa0JmallhTjZsaEtEaXNYNHlScjBSZkYvUFJOa2Z3cGRk?=
 =?utf-8?B?YVZaY3RCcysyYzJxelo3Q25rRTlXekdXQ1VtVCtIRGlTdnNWTjBWRGpiMWNk?=
 =?utf-8?B?U1cvUGR4b0cwc0FENnlIVDZjMVVtYWZTeElvUlNBdnNoOUhHY1RBZHB5QkR1?=
 =?utf-8?B?U3c1K0l4SGtQbUhxaFVIOEpxb1BmTGgwd09vaWRVVnYrdnliV1dZTWU1eGRp?=
 =?utf-8?B?Tmx6d2FtWGVNQ25hMnc4LzFRN2cxVFQ5NE5mWVAvY2lIREdWZVZPR3NIWWcw?=
 =?utf-8?B?UzJtSFRjdmdaZ0FJYXFUZ21Pb3hsNWJRdHB4eUVaTmhQMVR2S2JaL2NjRFdC?=
 =?utf-8?B?YUNiN3UwZnd0STFpamVlMzQ5aVdDNDN6dGx0OVRSVzMvbmRiN1l2akN3dXd1?=
 =?utf-8?B?UHk5bHZGK2t3NHVwYm1laXIzM3U4ZFBPSlhqOUVsUVVqOENtMjJsV3VqTldw?=
 =?utf-8?B?WHVMTUxQNWdJaU9pYWFsYlZpSzJNYTZvUS9VYWRZMzF4OGgySzAyL3F1SEM0?=
 =?utf-8?B?TUZWQ0loaFluYnZDZHFabllaQzgxTCtJZVRKeHNWWXQrZEdqOUZ4MnlqWVk2?=
 =?utf-8?B?ZFpIaEpLT3Ryb3h6eW1RYXpjNllCZkhIeVdvYmxzdzlqTHZhbzhvRVZyZnox?=
 =?utf-8?B?c3dnMVdONk10QkdlRmlUQTlHU2ZqYnVhdXdUUUpEKzlETXZVVjU5MU5jeFR4?=
 =?utf-8?B?N0svaTkzZG1oSVZnakY1cklFWVRoalUySXB1S1RYcnh4WThkN3dVdDVQdHhm?=
 =?utf-8?B?M3UvMDBKNlE1c2N4UFErdDVQRHllSS9Qc0ZRMUg2TTNlOGFGSk5BMDNrNERN?=
 =?utf-8?B?MmhlMFR0VFJ3aW1oSEIweHo0ZXlGQ3dzUkxNdUM5L2NhSmhHbDZ6ZU1DM1dG?=
 =?utf-8?B?YWY2ZUpBL1IvTnRTcXZhbjM3dGIyeUpLMGtja0JmSjJnb09iU2hOMmR2OFBL?=
 =?utf-8?B?MXlEK29MTkJFRGw3RWxVMldWdUlqSFhqUExtU3E5Sm5DWUZSMUhMNE9IMWUy?=
 =?utf-8?B?TzFCK0RzK1A1K05vd1BMU3NRek05RTRSRTBlR3hhaGhVNk1nWGpjVWtJTDBN?=
 =?utf-8?B?a2ErTXMvVGp0ajArMk9MNy92eW1UdzltZitVSndBaWhBNmFkRDZKZGF5cUVR?=
 =?utf-8?B?NFhKdXpCYTdhNmIvdkFXbEZISFZQS0h0NnZvL21HUnZnRGN6RGhDTTNVTlNv?=
 =?utf-8?B?NEIxVitxRitoMGdnY3hnNjN6MUdpeCtQQ2NHSExENmpRbmhDOGpaZUZ2d0dG?=
 =?utf-8?B?Q3NiK2dpVWxZUlJsQ29OTnZWbFlIWUhWcHdwOG51ZWRNSDhod2MwL2RDdTd5?=
 =?utf-8?B?VjljdWNKNGRtOU5HNjMvdXZ5SDVlbTVUTzI2ekNObjl1bThMM2xjcno3T2Nv?=
 =?utf-8?B?UW9VUFNrWXRJdUh6d1VBaDJxVGtncXNtV1dPM1BOblVSRXFOUEtIT0N4eXha?=
 =?utf-8?B?VllVaEh6MEZDSjRSY2tnRk1lS2JzOXB0SWZ6WnBkN0I4cXhMcnYvakV1ZDZM?=
 =?utf-8?B?dGNoMEE4YUdEUVR5TGt3SENmWkpEaFA5dlg4WHc5OUVUbzhsTHNMWldmZkM4?=
 =?utf-8?B?eTNJcVBDRjBkQ0grdnUwVC84OHNFYnoyVVRUemhWa3BXcHNhc1RkMldKNWIz?=
 =?utf-8?Q?DlmU68xHmjstUlbc=3D?=
X-Exchange-RoutingPolicyChecked: O2TVat7thmvMfxBV0/XEGbb9ZcmkdtWnrr6KyXfXW20a4v1TmFNg4fJ9hQUnbRhcdidSXp0T36XgW+MhDZ8XNf13d6qNwxjfMpK2rlGakRkgs1UbUnYxuUXPpUOsja5Y7xAzst9+yv/W6ISNXSWjvJC94+fLzuwE9ubGU4pMIdHZ/M1aY06Lv860Gc94LkNSBYD4m9wObwqaECYN85QEfGa8D+BpuyKLiZkUBHKoHmOKTZzwOPnq+f+whka4JaB1eGsCRmNHpvSYGYJXKuiNiG+krOpUtowLgr8iHXa2Z5rj5Ed3iO96RqavKV1Qk0xa4CkpcmPJLrnueY3thEvA6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 047da8a3-76ac-4f19-d2e4-08df042b3bf1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 11:06:24.6846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Uo1WG4mP9Z6NuA4mV1qx8L02RBvl7dOIUf2ghs2AnVsK2+iMxxYp/NpuUQ0u1+LC8DX3BOCB5Vds4jmLGdH3YrZCGO5TE6Rc4uf3bmqiBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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



On 8/25/2026 1:05 PM, Mallesh Koujalagi wrote:
> Report 'System Controller event' error using xe_log() helpers.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v5:
> - Change Error as EXFULL. (Michal)
> - Update logging message.
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_event.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index da395148ee9d..7a3aa0aad6a3 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_irq.h"
> +#include "xe_log.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
>  #include "xe_sysctrl.h"
> @@ -25,23 +26,26 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>  
>  		ret = xe_sysctrl_send_command(sc, command, &len);
>  		if (ret) {
> -			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			xe_log_err(xe, SYSCTRL, ret, "Failed to get pending event\n");
>  			return;
>  		}
>  
>  		if (len != sizeof(*response)) {
> -			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
> -			       len, sizeof(*response));
> +			xe_log_err(xe, SYSCTRL, -EMSGSIZE,

nit: maybe this should be -EPROTO (as it breaks ABI protocol)

> +				   "Unexpected event response length %zu (expected %zu)\n",
> +				   len, sizeof(*response));
>  			return;
>  		}
>  
>  		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
>  			xe_ras_counter_threshold_crossed(xe, response);
>  		else
> -			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
> +			xe_log_err_info(xe, SYSCTRL, -EPROTO,

and then this one should be -ENOPKG as maybe this is just our missing
implementation for some valid future event type?
> +					"Unexpected event %#x\n", response->event);
>  
>  		if (!--count) {
> -			xe_err(xe, "sysctrl: event flooding\n");
> +			xe_log_err(xe, SYSCTRL, -EXFULL,
> +				   "Ignored %u events due to flooding\n", response->count);
>  			return;
>  		}
>  

anyway,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

