Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384E8111224B
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 01:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3EE10EE59;
	Thu,  2 Apr 2026 01:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2nS2DeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D592F10EE59
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 01:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775091839; x=1806627839;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xuhrNK7rBRYUyBkw9N87oGH1lxWu0UW5vOj1Vzbfjk8=;
 b=P2nS2DeSwPC+9WTeVBS1DyPawyAh0FXsFDS1251zwEsW7AX0ug5bcgs2
 9j8anq6H018ePqvLOdzczul+NzPnsdaxcMvjwriwJhgaKPOmJN3oApMhn
 +r6junhDSzeTbfm7PdMNQun+rSN3S49vq5J/yojTxjmFdsQ9K9Qgo+XCn
 AWpaBqhL5Y8mSEkppBEzNNqErbuMgzRVwQY+2LrCInz43zS8y65jcxhC8
 DChZ/vJ83XjZPHdf0ImJ4xzcU7xuuu9z36H1WJC7L4Cx4HRojX8JNSIhG
 +MxilfRjyi2IGrzZ6rklNfRJsIFu0wjOuBDrUT88nJhU6uIOAZ/2c7ruU w==;
X-CSE-ConnectionGUID: iHIbtOcfRcaQuYgF+yOxQA==
X-CSE-MsgGUID: 7SAxbF12QQuRfEHIeNcR7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80002085"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="80002085"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 18:03:59 -0700
X-CSE-ConnectionGUID: QkxWE1pIRk2kd0+0eclfSA==
X-CSE-MsgGUID: 5nqlDoyPTsS6FC4bLdYMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="250039947"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 18:03:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 18:03:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 18:03:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 18:03:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwP9DokJhI235AgD1NqS4ZBAYcE2Tl3+2SFf9MwzFRvwnRWhjm+MEAMxuXdua6UdoxljHdmWnQXIDeGHly1P7Ab8Z/OqtQSpxm0kUpDsbqKL8ID8wkxVU5v/YaGrTXbVX1ORNbEUMTVM9rB4v7ToQdpDJTnUfGiuvJvLnXLXS5TPIY5gfLFV4y54FBKbJj5pzdYP261laZx78h91jkgik2dV/VuKdIgdxkhlgkg+U7K36pJ1KkInHefoAoHBWA7Fj1Te1YW5OtNGCyVRWor4zX5bf95LgM/peaUrbKi82sOkHoMUDck/iN4lelq3SeyTC/WiyNKWk7tzoT80mblEYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4cMCOScZdk7TlUi3zh8JXk0DsnTZPFnasxUwWGPFoY=;
 b=hfoL3Rw4cEV1LMfrz1Ei2aqGhsRMRV95UF8a/dcsjXnhS/aDsqEkeGQ79AbGUKwcRthwDWU/GUPzm2AO1cax2u3AzEkOM9Lg7MeCODmXkGFhyyFG5D+ICORdIP2X2pXKnDIJVclS7pJ4I/kgRGLsDHcO4l/XMhseEsMUuyFjpCCLBhnZmKlHEhp7CLEjjDfuAW0xNTj+ue8I6sn3OYvWqGda0GaOZmv+kI4rQLWYvD7RKX9BI476BYOAFyln8+luTnaZlCeJpMLdDDrq72XgjpXAqhr8iRirEoRGXopiIL3/lGE2ibzqmVHDzmbMfHhYP+hM4o5YBE3rnbdAYo6aWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 01:03:53 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 01:03:51 +0000
Date: Wed, 1 Apr 2026 18:03:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH V6 3/7] drm/xe: Handle physical memory address error
Message-ID: <ac3Ac4n//gB3raXc@gsse-cloud1.jf.intel.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-12-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327114829.2678240-12-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:303:2b::10) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0e8a4a-1a90-4e13-9edb-08de9053b3d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: WLmY7UlF8Wh4ecbQPIsM37cu8aT8rpGpSQ1+lJDwY+LxqXmF64qYzteA81yISQDuqB4Yyxt8rLwyOG7gTmDYGv9fJFYoSjjiQlGhbE8Og97Ned2LemoR/6u9dmucH50Mrucnmx0o/bl3h9C7K3pLwoV4sdEWmp6Bt2wKcxuLq1bAjf7ZLXuArqPCsfdmyIHb0k7lVappxutcE0KeCEwY3HCyQQ8LaxQQxIkDz+qfXNREpmAn5gVugvrc4dsbhXUHAVznN5nY2vQWePCgvcXsQ5/Usz82FgioX3yvwz/IlkMKeTDQ8OEo99R4cOXThCwkW2+7Yk/s8WW4gQ+QKGfkmKyn4sqN50l/wc9M5SP7tT0vOQpXvP2th1bmjEch6or3kbuzgPEDYRFeU/S4gWlryOs5KByZDJ0YdUMFQHcmhfqj2XSONm8gIoBl8Uyn/wv/8uTgS2bYWy7H0X9bZiGuUkANf1DUbMyANK1cBikZ7lufRTUGsdq6tZ7MWqC15FNV+Q+vlhIN0bkXY2duZabAIAizYAPumu+sjj9b3mNPPjeyBdw+Y8AtvZ2VyeymV4HWRP6GchhZiIyAb3nSgLtfvL3K0TY0L3CyAuCJ1v3rlWx5WeQgbt3l+llVMGWmtWDDaBY/UIN+ht5DaEC27KKwEUzBw7gUSeqmD8J6Rp+TObJObZFkC5xMxU4ur41pSxmF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHcveWhGNzRJWURLcjFYM2d5OUFkNUpVN0g0TkpKekpVRE5ZTlVuekVuQ3lK?=
 =?utf-8?B?M0d1RUs2MFlhb2ZrcFhvd2VURXRuTnFnZTcxdFl5UXJScWxkREZzempkQTdV?=
 =?utf-8?B?aWJSTlZ1WW9maG5vS0JiWkxNZGJmYldiUUFkS3ltREF6V0lCWGM3TG5SOHUz?=
 =?utf-8?B?eE9iZUJQUE5vRDBoKzgyQWtLZE01eXg3NGZNcEhTaGVDblJObVYvRm1aVmts?=
 =?utf-8?B?aTViQ0NuQVNQditUeWRRWkxhaDY5TGhmdm9RZ1JiVVA2NUVxQ2xNc2grUWFu?=
 =?utf-8?B?b2hhWW5BMjBCVEZIQXl0ZW04RStZaTg0ZzBNb1YyVXNRT2w3NEd0ck1vMC84?=
 =?utf-8?B?WHgwRDl5V2xyYkRQajcwTDM1ZVBnQ0NPUGNsTEE1M0dIREc0dVFFMnNrNUtO?=
 =?utf-8?B?TGRPTmVrb0grS0NDOHg4alZnKzd0bjFTdVdBeFlmY3c1M3BBVGJsYnpmNjhO?=
 =?utf-8?B?dTJkNVBJWlRIMjc0OEhrOUErUWZrOWFITEhoZlRDUUFHY3JITTRDZFNBeStL?=
 =?utf-8?B?VmJaQWc2R3hPUVAxbWtMSnlYSmdKbHYrcUI1WUVyK2ZXMFEyWnU2MVNmS2NB?=
 =?utf-8?B?aWlNSkVzMzJ2SWQ4UVkrNmtVb2RaSkdCd0pVYVdYOE82QnhPaXFIdU02UGJL?=
 =?utf-8?B?TGxhY2J6QlQ5dnJTa3ZuV1Y5REdVQUREMzk0b3VodkVJUVJodzlhUU1FR2RL?=
 =?utf-8?B?UjRHL2JEa0lzd2tYN1VWUnNmTjM0OHd4Y3ltdFRoRDQ2UWtTUVg1ekJ2Y2xR?=
 =?utf-8?B?bTM5M0o4b2duWExybHB4K1BCVlVZOW9XeW9MVitTeVVRdlEvYStkRjF1L1kw?=
 =?utf-8?B?emJSaUpaTm0rSzVtZVdyVkV5ZzNIajVhbTFtU2FVU1RKTmt3TFI3RmtPd2Vy?=
 =?utf-8?B?bWRNa2svQ0MwcHJqcFVwUklPRVBlbWhZaWVtMXlqcy9rcHJqQjZJWUFKcmVS?=
 =?utf-8?B?WGRjWHYwYTVNOElVSnFyaDlzaUtOWVJIaDB2QXJCRXJUcXlhT0FSemhLdTJQ?=
 =?utf-8?B?cG81Mk1uaWtRYlQrWjlFdUJLbGxpTDdheEhZWU5FVjZYcWpaaDJIZytVY0h0?=
 =?utf-8?B?SU5GMzFLQW8vTEt0QkE5OEM5ZHdnVXlaNmJycFYraVRRY0E0UENMY3NPa2Nj?=
 =?utf-8?B?R2duNk5UbUU4cjRYV3h6NUxMazhzaktHQVlSQ0VWTGp6d1FNbW80aDFUbkpJ?=
 =?utf-8?B?TGIvajJWcitFejhqNmtQVVc0dmw1Y1VhZVBBb29DTWt6N09TVGwwdjhVNk9a?=
 =?utf-8?B?eU05cTgrZElIRDU4YUFuNmJ5WkdNT214ME9WeHU3c0MzOFpUcis5SGV2S1p4?=
 =?utf-8?B?NEhPRFNGbjgzNkpKVm1WSGZYanFub2JYOFRaOE41dGp0T2huajYrUDNmOXB3?=
 =?utf-8?B?UHkrVXZsQWYyNzhyaWQ0UXV0aS9RSWFlaGVnTU1ycW9KZGNBUHhTbmdIZzZu?=
 =?utf-8?B?bTlmMk1KSlB4Y0NpYW1vSFlmNDRpM1pmd29TSExOR3o4SGpLaGxwYnRaa1lt?=
 =?utf-8?B?bmFXaThyWnF3ZTFwaWRFZlFnbFlKWTBNLzdQUzYyRXhkWTFOTldBMHlIc003?=
 =?utf-8?B?OEZCYnp1TmlXMzBnSnBsN1ZvMCtqeThWVHRtT2QxdnBrYVJLbkJLUGJTQXJ4?=
 =?utf-8?B?NG1OQUMxdEx4UUlaNVNPV1BDbHZDNHBaUWN2bVNuQllTVXo2TjF4ZmFiQ1hP?=
 =?utf-8?B?QS9Ra29tbHVKQWErd2xCR3drZHhSN1p2YjBRNEMrNVNyemhHd01Sc1ZMMFNQ?=
 =?utf-8?B?Q2tDM2Uva1F5Nmx1SEpPT21nK0U5dW9kUHhYTjl3N3ltUWRIbDV1YURHWEJ3?=
 =?utf-8?B?U2NTMHhlMmZoWVlnVHQ4bDRrVzdOaStpSDdoa1gvRDU0RERnaGRxWWpEYndz?=
 =?utf-8?B?K01jY2RNN0xON21rampvUHk2WlNGb2R0MXV1aGYyME9sd1lObkJsNGUyaXZ6?=
 =?utf-8?B?YXhsbG9idWdPNndLeVlQMlZxdGJKdVRHWTVGQ1o3SG12M1NlZXg1NEo2a1I5?=
 =?utf-8?B?VTF3N3hJajdZcnpiK2ZQOWUrWTFGcEhNZWVmQkRNNC81UkEyaGV6VkFxVG9q?=
 =?utf-8?B?VkR6VFovNEV4L1JCcWhwNVFvbnRsS1l3VzZMSUdHRTU5eUxIeUhlMVZ5TnpZ?=
 =?utf-8?B?M05VRVV1V2hSbjJaMUQ3R1lBdjRSeStqa0dSa2FYL2s2Vk1GSUY4WTY5eERQ?=
 =?utf-8?B?eklUYkswanZ1MTlXZVFheGxuOURDd0EzZkYrZTF3anV0UWJvZ2JHc2tWSkJh?=
 =?utf-8?B?S0hibVRSNWxuNllsWjN3Y0gzZWNNMloyUC9FcjJLV2V0S1hMYnc0dTYvY01R?=
 =?utf-8?B?Sjc3d2pPM1VyWWhGdkQ4QldhYVBXN0Q5R1ZzN1FTRXFNWkJuaFVGUUFmelBy?=
 =?utf-8?Q?8u2cMO+NnPTih8sA=3D?=
X-Exchange-RoutingPolicyChecked: g+55G4muWDXTwvLenoTWZNvUOBHM1HHk3A2AhYAWf+BYcwqh9C6blZPRx5yioScFn6OCbdpzwLgnTlA7gIHAv8AbRUzL5WGPPiIWWsdyHhQD4cpG7LbwygealM5WdR2kVTKAnpWgEaqAwPYwPJbXSmJ9qvZHsNZ1P8slNi+dLulJdRQs2uX2pFP1sjUUAwf9WCczzmsDMnapiaTjOlH0mtdSGToOFeR3bn2bOqKObn3+5nT9yFXWoEm7Ve69+Q8ZBISLlJLs6V6LduYAjneE6B1xWxKKeWKTQBDg54AqVtzrpm7XnE2s/5z1bmsCDc5uyX09HV7+B3O/IdD2uahZDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0e8a4a-1a90-4e13-9edb-08de9053b3d3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 01:03:51.2491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERVlHrmAkCxWXGnmFCNH7KpZSclvqwzdwgQfnf+S+2kSyF+IIVhpoS1doywnyYM32FNWMg02hAOSSTelKeCPcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
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

On Fri, Mar 27, 2026 at 05:18:16PM +0530, Tejas Upadhyay wrote:
> This functionality represents a significant step in making
> the xe driver gracefully handle hardware memory degradation.
> By integrating with the DRM Buddy allocator, the driver
> can permanently "carve out" faulty memory so it isn't reused
> by subsequent allocations.
> 
> Buddy Block Reservation:
> ----------------------
> When a memory address is reported as faulty, the driver instructs
> the DRM Buddy allocator to reserve a block of the specific page
> size (typically 4KB). This marks the memory as "dirty/used"
> indefinitely.
> 
> Two-Stage Tracking:
> -----------------
> Offlined Pages:
> Pages that have been successfully isolated and removed from the
> available memory pool.
> 
> Queued Pages:
> Addresses that have been flagged as faulty but are currently in
> use by a process. These are tracked until the associated buffer
> object (BO) is released or migrated, at which point they move
> to the "offlined" state.
> 
> Sysfs Reporting:
> --------------
> The patch exposes these metrics through a standard interface,
> allowing administrators to monitor VRAM health:
> /sys/bus/pci/devices/<device_id>/vram_bad_bad_pages
> 
> V5:
> - Categorise and handle BOs accordingly
> - Fix crash found with new debugfs tests
> V4:
> - Set block->private NULL post bo purge
> - Filter out gsm address early on
> - Rebase
> V3:
> -rename api, remove tile dependency and add status of reservation
> V2:
> - Fix mm->avail counter issue
> - Remove unused code and handle clean up in case of error
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 336 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  26 ++
>  3 files changed, 363 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index c627dbf94552..0fec7b332501 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -13,7 +13,10 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue.h"
> +#include "xe_lrc.h"
>  #include "xe_res_cursor.h"
> +#include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram_types.h"
>  
> @@ -277,6 +280,26 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
>  	.debug	= xe_ttm_vram_mgr_debug
>  };
>  
> +static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vram_mgr *mgr)
> +{
> +	struct xe_ttm_vram_offline_resource *pos, *n;
> +
> +	mutex_lock(&mgr->lock);
> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> +		--mgr->n_offlined_pages;
> +		gpu_buddy_free_list(&mgr->mm, &pos->blocks, 0);
> +		mgr->visible_avail += pos->used_visible_size;
> +		list_del(&pos->offlined_link);
> +		kfree(pos);
> +	}
> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
> +		list_del(&pos->queued_link);
> +		mgr->n_queued_pages--;
> +		kfree(pos);
> +	}
> +	mutex_unlock(&mgr->lock);
> +}
> +
>  static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -288,6 +311,8 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>  	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>  		return;
>  
> +	xe_ttm_vram_free_bad_pages(dev, mgr);
> +
>  	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>  
>  	gpu_buddy_fini(&mgr->mm);
> @@ -316,6 +341,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  	man->func = &xe_ttm_vram_mgr_func;
>  	mgr->mem_type = mem_type;
>  	mutex_init(&mgr->lock);
> +	INIT_LIST_HEAD(&mgr->offlined_pages);
> +	INIT_LIST_HEAD(&mgr->queued_pages);
>  	mgr->default_page_size = default_page_size;
>  	mgr->visible_size = io_size;
>  	mgr->visible_avail = io_size;
> @@ -471,3 +498,312 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
>  
>  	return avail;
>  }
> +
> +static bool is_ttm_vram_migrate_lrc(struct xe_device *xe, struct xe_bo *pbo)

As discussed in prior reply [1] - I think this can be dropped.

[1] https://patchwork.freedesktop.org/patch/714756/?series=161473&rev=6#comment_1318048

> +{
> +	if (pbo->ttm.type == ttm_bo_type_kernel &&
> +	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> +	    (pbo->flags & (XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE)) &&
> +	    !(pbo->flags & XE_BO_FLAG_PAGETABLE)) {
> +		unsigned long idx;
> +		struct xe_exec_queue *q;
> +		struct drm_device *dev = &xe->drm;
> +		struct drm_file *file;
> +		struct xe_lrc *lrc;
> +
> +		/* TODO : Need to extend to multitile in future if needed */
> +		mutex_lock(&dev->filelist_mutex);
> +		list_for_each_entry(file, &dev->filelist, lhead) {
> +			struct xe_file *xef = file->driver_priv;
> +
> +			mutex_lock(&xef->exec_queue.lock);
> +			xa_for_each(&xef->exec_queue.xa, idx, q) {
> +				xe_exec_queue_get(q);
> +				mutex_unlock(&xef->exec_queue.lock);
> +
> +				for (int i = 0; i < q->width; i++) {
> +					lrc = xe_exec_queue_get_lrc(q, i);
> +					if (lrc->bo == pbo) {
> +						xe_lrc_put(lrc);
> +						mutex_lock(&xef->exec_queue.lock);
> +						xe_exec_queue_put(q);
> +						mutex_unlock(&xef->exec_queue.lock);
> +						mutex_unlock(&dev->filelist_mutex);
> +						return false;
> +					}
> +					xe_lrc_put(lrc);
> +				}
> +				mutex_lock(&xef->exec_queue.lock);
> +				xe_exec_queue_put(q);
> +				mutex_unlock(&xef->exec_queue.lock);
> +			}
> +		}
> +		mutex_unlock(&dev->filelist_mutex);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static void xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *pbo)
> +{
> +	struct ttm_placement place = {};
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.gfp_retry_mayfail = false,
> +	};
> +	bool locked;
> +	int ret = 0;
> +
> +	/*  Ban VM if BO is PPGTT */
> +	if (pbo->ttm.type == ttm_bo_type_kernel &&
> +	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> +	    pbo->flags & XE_BO_FLAG_PAGETABLE) {

I think XE_BO_FLAG_PAGETABLE and XE_BO_FLAG_FORCE_USER_VRAM are
sufficient here.

Also, if XE_BO_FLAG_PAGETABLE is set but XE_BO_FLAG_FORCE_USER_VRAM is
clear, that means this is a kernel VM and we probably have to wedge the
device, right?

> +		down_write(&pbo->vm->lock);
> +		xe_vm_kill(pbo->vm, true);
> +		up_write(&pbo->vm->lock);
> +	}
> +
> +	/*  Ban exec queue if BO is lrc */
> +	if (pbo->ttm.type == ttm_bo_type_kernel &&
> +	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> +	    (pbo->flags & (XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE)) &&
> +	    !(pbo->flags & XE_BO_FLAG_PAGETABLE)) {


This is a huge if statement just to determine whether this is an LRC. At
a minimum, we’d need to normalize this, and it looks very fragile—if we
change flags elsewhere in the driver, this if statement could easily
break.

Also, I can’t say I’m a fan of searching just to kill an individual
queue.

It’s a bit unfortunate that LRCs are created without a VM (I forget the
exact reasoning, but I seem to recall it was related to multi-q?)

I think what we really want to do is:

- If we find a PT or LRC BO, kill the VM.
- Update ‘kill VM’ to kill all exec queues. I honestly forget why we
  only kill preempt/rebind queues—it’s likely some nonsensical reasoning
  that we never cleaned up. We already have xe_vm_add_exec_queue(), which
  is short-circuited on xe->info.has_ctx_tlb_inval, but we can just
  remove that.
- Normalize this with an LRC BO flag and store the user_vm in the BO for
  LRCs.
- Critical kernel BOs normalized with BO flag -> wedge the device

The difference between killing a queue and killing a VM doesn’t really
matter from a user-space point of view, since typically a single-queue
hang leads to the entire process crashing or restarting—at least for
Mesa 3D. We should confirm with compute whether this is also what we’re
targeting for CRI, but I suspect the answer is the same. Even if it
isn’t, I’m not convinced per-queue killing is worthwhile. And if we
decide it is, the filelist / exec_queue.xa search is pretty much a
non-starter for me—for example, we’d need to make this much simpler and
avoid taking a bunch of locks here, which looks pretty scary.

> +		struct drm_device *dev = &xe->drm;
> +		struct xe_exec_queue *q;
> +		struct drm_file *file;
> +		struct xe_lrc *lrc;
> +		unsigned long idx;
> +
> +		/* TODO : Need to extend to multitile in future if needed */
> +		mutex_lock(&dev->filelist_mutex);
> +		list_for_each_entry(file, &dev->filelist, lhead) {
> +			struct xe_file *xef = file->driver_priv;
> +
> +			mutex_lock(&xef->exec_queue.lock);
> +			xa_for_each(&xef->exec_queue.xa, idx, q) {
> +				xe_exec_queue_get(q);
> +				mutex_unlock(&xef->exec_queue.lock);
> +
> +				for (int i = 0; i < q->width; i++) {
> +					lrc = xe_exec_queue_get_lrc(q, i);
> +					if (lrc->bo == pbo) {
> +						xe_lrc_put(lrc);
> +						xe_exec_queue_kill(q);
> +					} else {
> +						xe_lrc_put(lrc);
> +					}
> +				}
> +
> +				mutex_lock(&xef->exec_queue.lock);
> +				xe_exec_queue_put(q);
> +				mutex_unlock(&xef->exec_queue.lock);
> +			}
> +		}
> +		mutex_unlock(&dev->filelist_mutex);
> +	}
> +
> +	spin_lock(&pbo->ttm.bdev->lru_lock);
> +	locked = dma_resv_trylock(pbo->ttm.base.resv);
> +	spin_unlock(&pbo->ttm.bdev->lru_lock);
> +	WARN_ON(!locked);

Is there any reason why we can’t just take a sleeping dma_resv_lock
here (e.g. xe_bo_lock)? Also, I think the trick with the LRU lock only
works once the BO’s dma_resv has been individualized (kref == 0), which
is clearly not the case here. 

> +	ret = ttm_bo_validate(&pbo->ttm, &place, &ctx);
> +	drm_WARN_ON(&xe->drm, ret);
> +	xe_bo_put(pbo);
> +	if (locked)
> +		dma_resv_unlock(pbo->ttm.base.resv);
> +}
> +
> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, unsigned long addr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +{
> +	struct xe_ttm_vram_offline_resource *nentry;
> +	struct ttm_buffer_object *tbo = NULL;
> +	struct gpu_buddy_block *block;
> +	struct gpu_buddy_block *b, *m;
> +	enum reserve_status {
> +		pending = 0,
> +		fail
> +	};
> +	u64 size = SZ_4K;
> +	int ret = 0;
> +
> +	mutex_lock(&vram_mgr->lock);

You’re going to have to fix the locking here. For example, the lock is
released inside nested if statements below, which makes this function
very difficult to follow. Personally, I can’t really focus on anything
else until this is cleaned up. I’m not saying we don’t already have bad
locking patterns in Xe—I’m sure we do—but let’s avoid introducing new
code with those patterns.

For example, it should look more like this:

mutex_lock(&vram_mgr->lock);
/* Do the minimal work that requires the lock */
mutex_unlock(&vram_mgr->lock);

/* Do other work where &vram_mgr->lock needs to be dropped */

mutex_lock(&vram_mgr->lock);
/* Do more work that requires the lock */
mutex_unlock(&vram_mgr->lock);

Also strongly prefer guards or scoped_guards too.

> +	block = gpu_buddy_addr_to_block(mm, addr);
> +	if (PTR_ERR(block) == -ENXIO) {
> +		mutex_unlock(&vram_mgr->lock);
> +		return -ENXIO;
> +	}
> +
> +	nentry = kzalloc_obj(*nentry);
> +	if (!nentry)
> +		return -ENOMEM;
> +	INIT_LIST_HEAD(&nentry->blocks);
> +	nentry->status = pending;
> +
> +	if (block) {
> +		struct xe_ttm_vram_offline_resource *pos, *n;
> +		struct xe_bo *pbo;
> +
> +		WARN_ON(!block->private);
> +		tbo = block->private;
> +		pbo = ttm_to_xe_bo(tbo);
> +
> +		xe_bo_get(pbo);

This probably needs a kref get if it’s non‑zero. If this is a zombie BO,
it should already be getting destroyed. Also, we’re going to need to
look into gutting the TTM pipeline as well, where TTM resources are
transferred to different BOs—but there’s enough to clean up here first
before we get to that.

I'm going to stop here as there is quite a bit to cleanup / simplify
before I can dig in more.

Matt

> +		/* Critical kernel BO? */
> +		if (pbo->ttm.type == ttm_bo_type_kernel &&
> +		    (!(pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM) ||
> +		     is_ttm_vram_migrate_lrc(xe, pbo))) {
> +			mutex_unlock(&vram_mgr->lock);
> +			kfree(nentry);
> +			xe_ttm_vram_free_bad_pages(&xe->drm, vram_mgr);
> +			xe_bo_put(pbo);
> +			drm_err(&xe->drm,
> +				"%s: corrupt addr: 0x%lx in critical kernel bo, request reset\n",
> +				__func__, addr);
> +			/* Hint System controller driver for reset with -EIO  */
> +			return -EIO;
> +		}
> +		nentry->id = ++vram_mgr->n_queued_pages;
> +		list_add(&nentry->queued_link, &vram_mgr->queued_pages);
> +		mutex_unlock(&vram_mgr->lock);
> +
> +		/* Purge BO containing address */
> +		 xe_ttm_vram_purge_page(xe, pbo);
> +
> +		/* Reserve page at address addr*/
> +		mutex_lock(&vram_mgr->lock);
> +		ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
> +					     size, size, &nentry->blocks,
> +					     GPU_BUDDY_RANGE_ALLOCATION);
> +
> +		if (ret) {
> +			drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
> +				 addr, ret);
> +			nentry->status = fail;
> +			mutex_unlock(&vram_mgr->lock);
> +			return ret;
> +		}
> +
> +		list_for_each_entry_safe(b, m, &nentry->blocks, link)
> +			b->private = NULL;
> +
> +		if ((addr + size) <= vram_mgr->visible_size) {
> +			nentry->used_visible_size = size;
> +		} else {
> +			list_for_each_entry(b, &nentry->blocks, link) {
> +				u64 start = gpu_buddy_block_offset(b);
> +
> +				if (start < vram_mgr->visible_size) {
> +					u64 end = start + gpu_buddy_block_size(mm, b);
> +
> +					nentry->used_visible_size +=
> +						min(end, vram_mgr->visible_size) - start;
> +				}
> +			}
> +		}
> +		vram_mgr->visible_avail -= nentry->used_visible_size;
> +		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
> +			if (pos->id == nentry->id) {
> +				--vram_mgr->n_queued_pages;
> +				list_del(&pos->queued_link);
> +				break;
> +			}
> +		}
> +		list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +		/* TODO: FW Integration: Send command to FW for offlining page */
> +		++vram_mgr->n_offlined_pages;
> +		mutex_unlock(&vram_mgr->lock);
> +		return ret;
> +
> +	} else {
> +		ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
> +					     size, size, &nentry->blocks,
> +					     GPU_BUDDY_RANGE_ALLOCATION);
> +		if (ret) {
> +			drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
> +				 addr, ret);
> +			nentry->status = fail;
> +			mutex_unlock(&vram_mgr->lock);
> +			return ret;
> +		}
> +
> +		list_for_each_entry_safe(b, m, &nentry->blocks, link)
> +			b->private = NULL;
> +
> +		if ((addr + size) <= vram_mgr->visible_size) {
> +			nentry->used_visible_size = size;
> +		} else {
> +			struct gpu_buddy_block *block;
> +
> +			list_for_each_entry(block, &nentry->blocks, link) {
> +				u64 start = gpu_buddy_block_offset(block);
> +
> +				if (start < vram_mgr->visible_size) {
> +					u64 end = start + gpu_buddy_block_size(mm, block);
> +
> +					nentry->used_visible_size +=
> +						min(end, vram_mgr->visible_size) - start;
> +				}
> +			}
> +		}
> +		vram_mgr->visible_avail -= nentry->used_visible_size;
> +		nentry->id = ++vram_mgr->n_offlined_pages;
> +		list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +		/* TODO: FW Integration: Send command to FW for offlining page */
> +		mutex_unlock(&vram_mgr->lock);
> +	}
> +	/* Success */
> +	return ret;
> +}
> +
> +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe,
> +							 resource_size_t addr)
> +{
> +	unsigned long stolen_base = xe_ttm_stolen_gpu_offset(xe);
> +	struct xe_vram_region *vr;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	/* Addr from stolen memory? */
> +	if (addr + SZ_4K >= stolen_base)
> +		return NULL;
> +
> +	for_each_tile(tile, xe, id) {
> +		vr = tile->mem.vram;
> +		if ((addr <= vr->dpa_base + vr->actual_physical_size) &&
> +		    (addr + SZ_4K >= vr->dpa_base))
> +			return vr;
> +	}
> +	return NULL;
> +}
> +
> +/**
> + * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flaged
> + * @xe: pointer to parent device
> + * @addr: physical faulty address
> + *
> + * Handle the physcial faulty address error on specific tile.
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
> +{
> +	struct xe_ttm_vram_mgr *vram_mgr;
> +	struct xe_vram_region *vr;
> +	struct gpu_buddy *mm;
> +	int ret;
> +
> +	vr = xe_ttm_vram_addr_to_region(xe, addr);
> +	if (!vr) {
> +		drm_err(&xe->drm, "%s:%d addr:%lx error requesting SBR\n",
> +			__func__, __LINE__, addr);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +	vram_mgr = &vr->ttm;
> +	mm = &vram_mgr->mm;
> +	/* Reserve page at address */
> +	ret = xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
> +	return ret;
> +}
> +EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 87b7fae5edba..8ef06d9d44f7 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -31,6 +31,7 @@ u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>  void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>  			  u64 *used, u64 *used_visible);
>  
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr);
>  static inline struct xe_ttm_vram_mgr_resource *
>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 9106da056b49..94eaf9d875f1 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -19,6 +19,14 @@ struct xe_ttm_vram_mgr {
>  	struct ttm_resource_manager manager;
>  	/** @mm: DRM buddy allocator which manages the VRAM */
>  	struct gpu_buddy mm;
> +	/** @offlined_pages: List of offlined pages */
> +	struct list_head offlined_pages;
> +	/** @n_offlined_pages: Number of offlined pages */
> +	u16 n_offlined_pages;
> +	/** @queued_pages: List of queued pages */
> +	struct list_head queued_pages;
> +	/** @n_queued_pages: Number of queued pages */
> +	u16 n_queued_pages;
>  	/** @visible_size: Proped size of the CPU visible portion */
>  	u64 visible_size;
>  	/** @visible_avail: CPU visible portion still unallocated */
> @@ -45,4 +53,22 @@ struct xe_ttm_vram_mgr_resource {
>  	unsigned long flags;
>  };
>  
> +/**
> + * struct xe_ttm_vram_offline_resource - Xe TTM VRAM offline  resource
> + */
> +struct xe_ttm_vram_offline_resource {
> +	/** @offlined_link: Link to offlined pages */
> +	struct list_head offlined_link;
> +	/** @queued_link: Link to queued pages */
> +	struct list_head queued_link;
> +	/** @blocks: list of DRM buddy blocks */
> +	struct list_head blocks;
> +	/** @used_visible_size: How many CPU visible bytes this resource is using */
> +	u64 used_visible_size;
> +	/** @id: The id of an offline resource */
> +	u16 id;
> +	/** @status: reservation status of resource */
> +	bool status;
> +};
> +
>  #endif
> -- 
> 2.52.0
> 
