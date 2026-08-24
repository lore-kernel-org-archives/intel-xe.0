Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E491C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 07:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E700810E0DD;
	Mon, 24 Aug 2026 07:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0g6MRtJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2388E10E553
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787557631; x=1819093631;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4n4KLmoa5TaUbTo7bGb5tJ9/R/5+hMjsreEa83a0Ujc=;
 b=Y0g6MRtJtIF+NJTcgn6NpRqhBjRXyL9mpMt7gcUHG4z/rcbHc4E24RTq
 50oeuj4H7O6EXdrSs3Y2Gj2Q2myn5LNwvz+YZCOIY36o3u4iSxDDrUaBd
 4Ng9jixkPpzbcTLq27jOMmw5ydXskB9nmJOgghlaCjyIv/TNo8otg8l8A
 fvU8FpQAJhBTNuRi7Xy3Y2YZ+82XWPjpPq7q6Mzee0xIhyDIXpWuoAu51
 C1QjW9QgW9jDm13ToddTETRtaEhxHTDQq+Ers8hc0cFx00C113ged6oTV
 YpO5f1pAlpgBPGwWUQu+3B3EjTYRhN1OeGit7p1rbCWQrUDTx5XTUwcmt w==;
X-CSE-ConnectionGUID: ShbC6T03S42tnbNYD/vKEA==
X-CSE-MsgGUID: tfOy/3p+SvmM58KdJAr2CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91814016"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91814016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 00:42:43 -0700
X-CSE-ConnectionGUID: Jj7K/SawQ3GuyXurTbGCtg==
X-CSE-MsgGUID: AxDIbkotSa6anXr166SsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="296834109"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 00:42:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 00:42:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 00:42:18 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 00:38:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkyOC9q0cW1NaOKNzDxoYJSA3vn36q77UrNhoOhebchfDcBozV63SNEoklAs+ClNllvZkfOXs2BF0C6uf5E6xCMKymaEIeOuX1zt8GJCcBLdtAPPcJmbE+384hso/N22NfVFjWFKsqGnzMGfee4aL+5AKtQpGI4tsJDtEHvvvgLUuGCRF5hbXiscEeSzzFNChmQRUKAhdWerlOSto4bxu+/zEsrt7ds+S4/VmD8Sh7AVAY9A8Enda/EMMWfl16jB6QaJilcUMujjFM0EWY0Eg6QTax1MLjdt3k9OBJ51guQO5ACXYpu2qTtLyzVdo/0WhM/6/gTKRLgjY9Pi623TYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MTTSZXCbb7tYyGjsUtgNFwvvzlWgrlTt86Gc2Odmc0=;
 b=sNQBBvU5+DHeb9GO5Kmw7w/Xp4sUyP1HwyMwnPACI/c0/llpYFzKt0HIWSKIZVLKwo7DaylqL60T/foTdzy2yH0EomxeLVJBDl9RigpNrDoa/Ll9k+sUpXPLmqRjikvn1aCrkfRulCjqtoHDmoGSm01K3JhN9pw/sUHwUMgNqQymf0Keka9Antyk5Zdu9JaQfRrt8dH3F/AUoeKcqYN2GGUVA8X96eHRncy2+Yb8Ki+zpNzgXrqj7Sy/aikyMa4cw/CGYiGg/B0j9n+xgUUH3XhgvWqS/YzcW9fMykf/ozPb0JrusKpu1kVOpK0hK7QTjFMUhbmKSgaon1JNHsw2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PR11MB088494.namprd11.prod.outlook.com (2603:10b6:8:509::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Mon, 24 Aug 2026 05:44:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 05:44:26 +0000
Message-ID: <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
Date: Mon, 24 Aug 2026 11:14:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>, 
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260820101632.527214-10-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PR11MB088494:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f2bf0e-67f2-47c1-f6c3-08df01a2c205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kfOeVzJE9Fky8Xbcu9H8zuiZZwCXD+pw21znREJvWvUYGSloA5kGx1xKco6NYtKcN/VfMju+OWNt6eamlWsyZLs1KhifxDUC4G0co/FWSQWrRljTqFIqeEyZ4kZ1aZtIiQfOwNB7UjZSFTED7hA5vvH+LrETHLR2jKUaAZX2+03jDjTydWIejvMHmGOppsvF3ntXdSprvI+5xVQI6p2+HQ6SmEAlUBa1MrOMcFjeZnaXCTvY8Jj4W7uGaVcgD6NXnS7ckD1DMaWpKHCajLyKsf0Uim66uSL8DhNBPhiFks0Jai/uGP0JY/FlaMqikxLAzppDDuxSuOMkXu5DvQTIJ9QPgVR6aLiESDtihci6ek8bjGTz1cgpMdXwFCJpG0GnB5Se3yzZcJTSx54+0UMzU25l+E4TnyTZA8lIPQ1e8TO+Vliz8SIFBxT7LcDRpOAfkp8wnudgl6fZDM4PSAIMxhGxkF6rDplR4Q5C0kP8r76M5I2cCv/auxHi3/VHJskin+qJ4C9iwOvl+L/6gysL52isSoxPnuDqakYP0vJQXxc1QFnv2v9MpBbB6jWohVx/qMVxy0R3Wzm24ZpIsu5AInE/zZTZalUw8KGkCm7cvs3ZgIb8RlFYEjwgSv3Uyi2KMCLxBFVTOab3Fcco6WYbScJ9K1Mk7nff9pfM3NRj9Nc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REgwbjVCWWhJemc0ckZ6UTAzSHUzcmFqY2FXV3FoMEFKUHNUSXl5ZERhWUhK?=
 =?utf-8?B?WGZjMExqMTBldTN0OUtEUDh4OXM1QWlSWGVtVDNEbzRtMzBFQzd1SXdCS0tK?=
 =?utf-8?B?Rld4TDhlMm5wUG80bkd1Y05tTnNNMW1KSXNKa0xNQTErTDFJU0RnbmI4SCtE?=
 =?utf-8?B?aG15RU1UU1MydkVyMk13eWFpUmVTOUtURWtoQUJYbWc3R1NKOExxY1hremZL?=
 =?utf-8?B?K0h0MVZBM0lUQmdrVHlFMVE3SDNnN2J4c1NlVDNIS3c2amFpQ25URzFkclFs?=
 =?utf-8?B?eGE2YXJrc2RZOW13YVdvRHNDSVlOMmZGLzBTTlNrYTR3OFlrdDVhdmV0VXVX?=
 =?utf-8?B?Nm44ai9aWlBDTStGR0pBNUllYVlMS1BmWjEvWnhQaU9xVFhzWVlicGpqb253?=
 =?utf-8?B?VW43cjlmZWR4eGwyczI1WEFTa0Vya2JsektJeFlhaEFvK0h5VzFkYS9JRnVO?=
 =?utf-8?B?U3lOc00rWUg4MTI4WllOWEhkNmpaekszNmFyWnAyeVRwY3l4UnJmTTYxRmVo?=
 =?utf-8?B?OUJEWjUzSzkrOWpWd05iM1hXVGZJWDZEZytrOHE2ZjlUOWVKOWdEVHlJR2Fy?=
 =?utf-8?B?c2NheCtKZ3Z2L2ZocmFxbkcvd1ArWHcveGFGTmFHM09zWWFra1VOdUxqQWsx?=
 =?utf-8?B?bzIvWFlod1hxTnZVMWlSU2Y2M2ZkOXlaNkhDWXovWjlWdlNMdnBQWUg4MzEw?=
 =?utf-8?B?WWdZZVFmQ2ttQkt4ekh3ZmVEWEIySnlpV2RDRUk2RVJMcE5keGIxckFpNnd5?=
 =?utf-8?B?NXZTV3pWRHpRUVEvUkhQMXR4UG00eXZnZmxTNHhSemwyUVB6aWlla1pPMkRP?=
 =?utf-8?B?NmNITXU1dHhnZGV1NTNlMXdZOXZtb3dha3VnUlEzSi9mYzcwdTVpdEw5dU1k?=
 =?utf-8?B?TnliR1J1ellVc1EwM2ZDL0ZTdlhCZStYRk90MXFXTmNUam0zMUtJOUlhaGhN?=
 =?utf-8?B?aUpzNzNxRU1xZEFscFZwenVRMG1WSHpnUUVDelIzT1pJNzZHWk5aMWRxekRT?=
 =?utf-8?B?MWx2bHhxRVFqcnZmOVNQb2Q5K05lTXJLMXhzR21jZDh6aW42Rmk0ekJNejRM?=
 =?utf-8?B?Y2ozVDE5ak8zbjVkTXFUMWhHYXBTVWZtS2dlYitCcWc4d2RjcW5XeHFjNnhV?=
 =?utf-8?B?UHpKbmV4eFZneUU4SWtmdGM0aGhLSWd4eW5sSUZoUVg0K1NHWEc4cFJvMDVu?=
 =?utf-8?B?WXY1d3BFWXBQNHpYdU1QckdGa04yaG1nVTZLSjNMM0k3di92aEdmcU56SGlB?=
 =?utf-8?B?VGpGUXYrdk5RR21GeHFQbzk0ODRMVDkxazBjdXp4WmR1cUFWMHBsanZFTTZU?=
 =?utf-8?B?VS9oWlBydnp0QWU3ZDU2Z0pCVlNScjFoYXR6bDByQWdUVkt2aEhxTDcyVHdj?=
 =?utf-8?B?RnEyT0hFcDJSVWZEN0RXa0FLc3c2aXkxYVVsdVloTVF5WTE1OTE0SVZzOFFp?=
 =?utf-8?B?dHZZbHlXemtGZklGMC9XZ00vRlFRYS9KY21hMVJmK04wLzhlOGNnSHNad2JI?=
 =?utf-8?B?RUdqTVJYWFJyZCsrZWREVjFpdkpoVlV0cU80Q2U4anFNdnNUUmhDYXIyby91?=
 =?utf-8?B?dit3VkY3MHVkR3FxYzhrWnpMWGdHcUkrUXdHR2orSk9aZVFTWmFCMWk0WnN0?=
 =?utf-8?B?VGJndHVQcmM2SFgwdWptTy8zbXh4QWhVZVIyV0VkVTY0YkFhek5BZm5pejJp?=
 =?utf-8?B?eDIxWGJyZ3lMMVN3VWtGR085RTNtSGd4aTNENnBDT29wUis4ZHB4VERCT0k2?=
 =?utf-8?B?TmpFMC84a2lGU2R6R1g2THNucG02Y0J5R2NndUh1aEFDSnBKZWZzZWFuZFhC?=
 =?utf-8?B?RS9ZWkZJbmxhNFE5c2I0cm5UdTE0YlFZWjFMNFJ2cUNRY3hsZXYyZkltVUlq?=
 =?utf-8?B?M2dlaVhCbGZESGYyVWpNaUNic1dsRWFpWUNuRWFOZU12R3FiYVdDalRFVWYy?=
 =?utf-8?B?cjdqTW9jSTE2dGFseXh5UFlEbkw4OTQ0Y2txU1JsbndoWmZPR2EyUms4SDdq?=
 =?utf-8?B?a0tFRkN6SFFtamRYREhFQ2YyeUg1Ty9lNmJzcDliMjRlMDl4RXFPMnZ6Rytw?=
 =?utf-8?B?V0NScUJrNXBrUmp4R3dheGEvNUp5eXgwd2t5NHVLOHFJeWI3SllFTkI2UURq?=
 =?utf-8?B?dnM0cEJTZlNWSjdwdHI1STIweXM2b1RjckNBakExc2ZQNHczWVllSXVabTlt?=
 =?utf-8?B?dXBoNXlDNWRwWVdxZzJzcHpzcGJMTC9XbjQrTUs1eUJ1VjBMYzNuVUtFSkVP?=
 =?utf-8?B?RDBwa2pUcjlFUlY0a1cwSm5VU0hISjlrMkQwYVpWQ1kyUW5xRkhQZ3dYeFNP?=
 =?utf-8?B?eGpIVFE2ckt0U2FROEJiOUhNNUNaNnR2Tk5Cbm5ONFVpNkZQSjZGdz09?=
X-Exchange-RoutingPolicyChecked: V+yS3weMb4UEGIaIgxGRSbOz9kUNr8MK41JK4Bf4vxZrsoMPMaWWvffBLLbcMS0oVbT8fV4y1lUxpz2HxgZHonDETVak52qknErZ9qyQkWXo0v2jWRkU2E70SFMc58AgK5+Nv8jdrYDtrD/FoJrJJtAhh03gL7mxTSqxn1fVPhWO8vRn0/LAlJ86jeHy8tJyAzBDDYd5glKb+bRo0/6jZyfqUEW1gvia/vwaMPBudlFuiJjM6uKbzvDuvhiMe+WM68dy4mxqv5UGDtahYYHsAoUOJsXUwPxrO/psqXQ+FH+GbSaQKETc5W+WqspnNUhGjpBy4q32panDftVP8TiEJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f2bf0e-67f2-47c1-f6c3-08df01a2c205
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 05:44:26.5310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkqpQMJh4dzXH6I+j3BtjwMJnnyj2EQ+CO4gs4s2gM9jlXgN39SI/lKNj3DNbVZz7mE7ysS8o9NWEXSveT7rpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB088494
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

Hi Mallesh/Michal

On 20-08-2026 15:46, Mallesh Koujalagi wrote:
> Make sysctrl_wait_bit_clear() return an error code rather than a bool.
> and update callers to use xe_log_err() with the propagated error code.

Bit confused here on the usage of SIGID. My assumption based on 
documentation and discussion was
that SIG ID is only needed for error logs based on severity and requires 
a resolution which can be documented.
Am i missing something?

How do these errors indicate the need for a resolution.
Do we need it for all kmd logs with components or for errors that need a 
recovery or can be recoverable?

Thanks
Riana

> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 ++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index e13eebaac1d0..ef847f0a8f2c 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -11,6 +11,7 @@
>   
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>   #define XE_SYSCTRL_HDR_RESULT(hdr) \
>   	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>   
> -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> -				   unsigned int timeout_ms)
> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> +				  unsigned int timeout_ms)
>   {
> -	int ret;
> -
> -	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +	return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>   				 timeout_ms * 1000, NULL, false);
> -
> -	return ret == 0;
>   }
>   
>   static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>   	struct xe_device *xe = sc_to_xe(sc);
>   	u32 ctrl_reg, total_frames, frame;
>   	size_t bytes_sent, frame_size;
> +	int ret;
>   
>   	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>   
> -	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -		xe_err(xe, "sysctrl: Mailbox busy\n");
> -		return -EBUSY;
> +	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
> +		return ret;
>   	}
>   
>   	sc->phase_bit ^= 1;
> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>   
>   		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>   
> -		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> +		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>   			sc->phase_bit = 0;
> -			return -ETIMEDOUT;
> +			return ret;
>   		}
>   
>   		bytes_sent += frame_size;
