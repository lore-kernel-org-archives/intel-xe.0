Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1E5C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 09:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0A910FB54;
	Tue, 15 Sep 2026 09:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fd2hYNER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D247910FB54
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789466173; x=1821002173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=98sqksZP9Q1/odEtFMvW4BOV/VjuhLVFlyp612m168w=;
 b=Fd2hYNERPQG/jMgIE2C2Y8+Y/GE0VMTlAopQEEu3zrjJMaCidwIsC7Eu
 iE6sGEarMpCc2kvwdwhfUF8GxezZRfNPhWcu2iIEw50noMzdfZq7AJgn4
 JgspEcdlqOaDL6i32/4vpUtdxbK1LJpezHBCZ6P22nvqGBh126uWfs1q9
 +du+LOKi+8ppUuruzvLvHIuKZrTdXwBl9DUROIiSwdFhlPAc0H6rS/pkf
 CVH3gCvs26lfBO4YgIOYiYHLjAMf5KbaMKMD36xV8Ml7QhHc6Luohq1m2
 1Xi2f2ekRAYbS3jjSx3bQaz0tMf8nH+xNMSU785+fMaQqc34IvfkW3S4R w==;
X-CSE-ConnectionGUID: Cojiqq1sTaGJqGj2ver6Xg==
X-CSE-MsgGUID: zXd1sJcBR0GdvZJECDP6Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107196563"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107196563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:56:13 -0700
X-CSE-ConnectionGUID: 1TMumsggT/iuABUo368UQw==
X-CSE-MsgGUID: Ixi2T0w4RSqpPIBE/8uSRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296423024"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:56:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:56:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 02:56:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:56:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J13goi288Alzr2xAHK+P1qbVCVAVjl63gy0GhjeScsKf9kXM2NpcbK41lVn9mp8151RrDQ/tsAjNo8x7A7WcfekFs5MYqZw3fgiVBRV2tSOenqRbpSetrAuJFfJnPJ+55OauQHPXvjzlPx5Uu59qJ3E3OAh9Ib4k6jhjxPVCje9Q9mJPYZSvJnKzWwkYb7SMkEIHYxb957S9YUM7ti96SaVWcy5ai/5scINZp7DB2gKRVCMxQQfPuJlogzINmLsUGoAmzI+uCi3kvrQz9GUc8q9cybU4TJXZqTIJUN+0swEnOrlP/qnXt+EnTu8NiF2cILAze4NoPyQWFbFeatbfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAEY96LINAe/VaqBhpwSqtk2YNZfOCpNehjvmxm3tKI=;
 b=mmOEic1S4ncvTSEW4vDxCo9+sJbc6VUcRm768O6tR96FWRlI7uYfHU7mV/c/uIy6dku8KPevRe7sVSS3umuSAc1sKSzDDei3C5A5fJdIl0IqClOLdG8Q6L8CFkiPK/ZkjMl6mwenpIKUZxiKlA3CRwY0T8nqemSETgGxSqTT6/AVBWvaHozFk16TloMidsyickHMmPJMzyvkLWI0K89WWD9PdXuUsK6YQraH6G6W34d+zKg46RzKkzrsZxN7d6+b5OHQR6pwQr+Pw+NUBWhClSPhv5bc+2oo7WpzlDTTuHZrUVoZVGkTVth6k7jZUNuYqkdTflwuLnp06Z6LBpZw7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 09:56:08 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 09:56:06 +0000
Message-ID: <eb9baf29-861c-42e1-bc64-5bd489617dab@intel.com>
Date: Tue, 15 Sep 2026 11:56:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/xe/guc: Report major GuC failures using SIGID
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-11-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260903233958.475162-11-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P251CA0020.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::29) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: a16ae0af-1012-4c2d-a446-08df130f8f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: wrxbTFWUZ1xAGIA7Hx48xvgeAlpUFds4RO1myg6Aood3gvEZLpjTTOwEofxAQlPmieHoPns3zhPU4oB9FgzBHd/zXWK0ATiwfpBE2MCo+TBqDc97j9T5u3/AWIX+oknb7fxrIO5qunx70VP1p/PYgRzx7IZvzBd9ALLyOUr/SVjT/HGN79QVIFX2mJiNnOxFMFNrxhjo2cnkAnRDgKlTVbNs2P+WvX4XwR0yQ3RODADv/rDCTVwhmUBw6+5akCp5+zW5waFzg5S95NP+MxSJWunY+/x228mOLnc7BNiQXZHt7ZLKmGeSW4elFs1iQzM5Zj+HtydQ6aP/A28wcftiIvj3skZXuUPmbuP9Gzm+XsUbH8tg/0W28mhQmmuL/SnkZA1Cceu/e6JRaKnrhbhY0E6ZsQ6G7xJ4GkB885qLCMrOhhTeAwyfubwBQlwXTsx5ZdcRGJcivVBLahWa7lv/AUH7HsqQ+s+vSz5pIyQnuBFbdaIj8S5cXBAFOIA/dvF80jHTNuvU+tYWyxPtFFr0scX+GOmfvoEkL9TBR/ru+3pguEJ9U8QJTEWnrd6oT1q+M5zdJRIET4P+kWxMY3AYqd5dJA0A3Hx1NqBUX8UgAF1INPibAlWPqAvQAniTJNPdS4Fqpg5+t5SVSFOVeN/Q2XTQwtS7XYqoXS+evWqJU4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmZhREY5Rkhib29DL2VhWEltenlxTXBGcjFWWDdyNkwxbHhQMVgzeG5vOEFl?=
 =?utf-8?B?QXNxRGVSblZnTDltdDZKbkc4T2JvRUh2ODdoSHBGSkYrdDZ0UE0yYTF2dFVt?=
 =?utf-8?B?cWc1OFlsZUdlM0dlYTZ3cS9ET0dQVE5tN3YzQkRycDYrbW5VQWJJZmNKY1R6?=
 =?utf-8?B?MW5rWmNBWnArVklNc0dXcXp0czEzZHk4dnhXcHdWUEthamYzY0dqZzlTNDln?=
 =?utf-8?B?Rkd5a1FZdTdnV3pTZ045R0R0bTl5RndSNGdkcEgyNEptbE1XM0RtSStXYWpO?=
 =?utf-8?B?dmZneXJnaDl6Vk1aYnJ3RDdzelZldzRTQ3Y3blFHVVFXSHlVZ3JGUThBNXh0?=
 =?utf-8?B?ejB5aXJMc211MGY2dzE3V0ZiT1phcjJkaHFRRVA0YllQamt0ckNiTXpLL0VY?=
 =?utf-8?B?RXg1QzVKbFBHR0FuTkJDWVBaNVJJSEVPZzN3bTErZlZFSFpGVzQ3eGNnd3Qz?=
 =?utf-8?B?ZGlEdnhYQytkaFhTMzJNeW94c3l1emVGTkd5Tm1zV1dsSXNlMzBORVNrc1Ir?=
 =?utf-8?B?cjJ1OTVDejNhZUFSdkVlN2VtTW1MOFcyRWdzWTRxVitpTUU5MlhrSnZHTG1n?=
 =?utf-8?B?Q2E1dWFFOVZuQWxjUzZ4V29BQkh5RDZZYVF2Y2NBL3JpaEVUTG5LN3pRZXgz?=
 =?utf-8?B?dTJkcFZ4anIweWlCVlVEeGE4RHVUbnc3NFJWczVHT0gyOTRXOHRBZTlKZ1RJ?=
 =?utf-8?B?L1NGWjIxcmdmcFBEa1k1bCtOV1IzdUF1SnAySXkzZExCdlJMZjhUNVA5TDNR?=
 =?utf-8?B?ZjJuUC9iTG1sSjZ6N2ZtaktIRjZqYWk1L2VER2VodjA4bEhmdjVZdVJ0c2lK?=
 =?utf-8?B?WTF0N1pDNS9TK0lidkVGMUd3d2xMc0ROZk5yMUFNU1B2b2N4U3FqUXlzNU9q?=
 =?utf-8?B?Q1lQSVZNcE1VNktjNVhZWDZuWVVwVkh3dmpDdGxKckc2VFhhdU5aWTFYSGgv?=
 =?utf-8?B?R1plYVRnOVlTbUJoNktEWDBrNGxpMi9odU8wNmNoYzNQeVBqR1VYRVR4bXpY?=
 =?utf-8?B?ZmJkQ3hrWndrMHp2aTNmd3d0ZG9XVEc3K3B2cnRzUWtlOWlteFVNSlVjRFhk?=
 =?utf-8?B?NGw5MHlPUVN1b0J0dXpMOTBlRVd3Wm1rUndqc2dWS0ZBWlFrQUNoRk9xTjFz?=
 =?utf-8?B?WFZ6Ryt3bm1NWkpndUdVUmdFZEo2YjNkNDdEUlBaNG9KUjZHMDRSazJjQXNT?=
 =?utf-8?B?QWRuaWFSRVlZcnJEb0EyY0VvRlErUTVRNDVWL0NWT0wzUG1ETS9FSmNzbnlh?=
 =?utf-8?B?WENjeloxOTdHWWlRTU1RaFFKTk93N0xKeEtMKzNUR3BLYXRwVEVWZUNqcWZu?=
 =?utf-8?B?SjUvMHEvWFduanpJaGM1bzBTei9OTDQ4ZlA3QjZqOGJhdWdFTUNRb1RNL2M5?=
 =?utf-8?B?eGc0eUt6QStrb28vUmF5MGtGM0RER25BdW5KSXZpdTJhYW9OS2xoSlg0K3ph?=
 =?utf-8?B?c0VLRkFiSklYenYvU1ZyOXhwYm42cDhDZHdtcXpmM3ZpUzgyUEh0MFQzS2VQ?=
 =?utf-8?B?dDc4OXhjTmdhSGFCTitEaVZ2ZWZRVjJsVi9hSk5oNm9zM3loejNTSU5uajFY?=
 =?utf-8?B?YkcrVkNRMjFFYmYxVUlIYnoyM0lnU0I1dHJwdjFTcjZtamptNDZHbHgwc0lk?=
 =?utf-8?B?SmZ6NU8vNW51aisxSWNxS3pCaCtweFdlN3JKNlIycnZlY0d3bksrbHZnR3Bj?=
 =?utf-8?B?WmdqN1c2WGJ4WHJaVFFzbHVHRExJeEVFTW10bm1qbmt2WHBmdHhhS2hLcmc2?=
 =?utf-8?B?dE9DelVsT3IzbnRhNHQvOU5kV09rRjdXR0JVaHB6U0xkMEpIdG84dVQwS0tX?=
 =?utf-8?B?K2RxYzQ0V0ZVeTI2bmVlN0grdW9jQ1hTZzlqODI5QlI0YWVTVzExNUF1RTMw?=
 =?utf-8?B?RExDeS9xaG5GYTQ2bnE1RnMrdDBQTUhRaW9PUE1ZUEgvTHhpSWxKQ0FZUXdy?=
 =?utf-8?B?VHNqTysvZEpsYW02d1FCZVdOMWo0UWRod08xVEhJcTZpeW05SHJtSnB4bW5F?=
 =?utf-8?B?SEJ2dGppa0lubUNDV2NjdlFiTVNCMkNOMzQ5NTQrdFdZVW11NktwTndxejNG?=
 =?utf-8?B?YjJQVUhBZGRaZkRFSFBnRUNFcG8wWkY5L2hYL250MFduTW5ZOUJNdUZrQUpG?=
 =?utf-8?B?OHVoUVNGY2hCZERxSHRzaVg5aVVKMjFWN2ZqMjZidGZNTEpKWUdOL2x5K0Vx?=
 =?utf-8?B?QWgzaGUwRU5nYndINEMxMjBpbWp6eUxoUEJJR0V2QkpJUjlsM1FuM2pEZjJF?=
 =?utf-8?B?djI4UFo1cGpoV1dKVjd6elFkM25GOEtPbWUxUVVUU1ZsN010TjJwbHlwd1k2?=
 =?utf-8?B?cHh5bHJPZTNRZGkwSUFOS0ZDNXZLSnBGR0RZUHArYlJtTHhRWC9hSjFLK0Jj?=
 =?utf-8?Q?EK21vE3ORZUVI9W4=3D?=
X-Exchange-RoutingPolicyChecked: sNCTskcj+ZT0wdfPjOQNmii8NyR1TtVj9V8fe/bOrzpyyWzhc4Yk1VD13Zz5Sv8zqi5ecal/hcd7yF7py9VFQh/pJCrYWVkviHaqC8gNZ97UULEA2IGsPk0SWJtaWZAvyfiQbDuAV6a7fL+p6oGUU0guf8PgVTc6mLkcbRF4HVy0/mBPRmNI4/eOpUooNzm5lS6Wriw2aToV/0frcLF624lAt4fjWeiGGpMbhOmrb1UYcxdtIdkNVXcHN1MGtZzA0oUV540ASx9+T0pGyWvK1QTRbR6PSORDReLncEgOhJlQh8cOaCUWr/iWCujvGf5milyh7kd5n9GIeRHF7KeGng==
X-MS-Exchange-CrossTenant-Network-Message-Id: a16ae0af-1012-4c2d-a446-08df130f8f7a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:56:06.4311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3F13QCGTL/PRzhksPMG52k6RxUbY5t/wIhBkoeGjBflEC33Mhr0j5ceJruSQBPJn8XAWZWOhJz1J7GlMFRejUIfDD/bNN+JpgyhgGVL3P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
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



On 9/4/2026 1:40 AM, Umesh Nerlige Ramappa wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Convert errors during critical GuC flows (init, load, reset, suspend)
> to use the xe_log_err() helper.
> While at it, simplify the error log for the GuC load failure to use the
> cached frequency values instead of fetching them again.
> 
> v2: split guc_load_done changes to their own patch, use available ret
> value for reset errors (Michal)
> v3: Remove 'GuC' string from logs and cleanup logs (Michal)

nit: move change log under ---

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

your s-o-b is needed

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 5285d4cecbc8..9684f6528641 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -777,7 +777,7 @@ int xe_guc_init_noalloc(struct xe_guc *guc)
>  	return 0;
>  
>  out:
> -	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
> +	xe_log_err(gt, GUC, ret, "Initialization error\n");

nit: early initialization ? otherwise msg will be exactly the same as
in the next error, making it harder to investigate

>  	return ret;
>  }
>  
> @@ -845,7 +845,7 @@ int xe_guc_init(struct xe_guc *guc)
>  	return 0;
>  
>  out:
> -	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
> +	xe_log_err(gt, GUC, ret, "Initialization error\n");
>  	return ret;
>  }
>  
> @@ -998,15 +998,16 @@ int xe_guc_reset(struct xe_guc *guc)
>  
>  	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
>  	if (ret) {
> -		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
> +		xe_log_err(gt, GUC, ret, "Reset timeout, GDRST=%#x\n", gdrst);
>  		goto err_out;
>  	}
>  
>  	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
>  	if (!(guc_status & GS_MIA_IN_RESET)) {
> -		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
> -			  guc_status);
>  		ret = -EIO;
> +		xe_log_err(gt, GUC, ret,
> +			   "MIA core not in reset, GUC_STATUS=%#x\n",

nit: this should still fit in the line above

> +			   guc_status);
>  		goto err_out;
>  	}
>  
> @@ -1224,9 +1225,9 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
>  
>  	if (ret || load_result) {
> -		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
> -			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> -			  xe_guc_pc_get_cur_freq_fw(guc_pc));
> +		xe_log_err(gt, GUC, ret ?: load_result,
> +			   "Load failed, GUC_STATUS=%#x, time = %lldms, freq = %dMHz (req %dMHz)\n",
> +			   status, delta_ms, act_freq, cur_freq);

nit: freq are u32, shouldn't we use %u ?

>  		print_load_status_err(gt, status);
>  
>  		return ret ?: load_result;
> @@ -1463,7 +1464,7 @@ int xe_guc_suspend(struct xe_guc *guc)
>  
>  	ret = xe_guc_softreset(guc);
>  	if (ret) {
> -		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
> +		xe_log_err(gt, GUC, ret, "Suspend aborted\n");
>  		return ret;
>  	}
>  

with nits and sob fixed,

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

