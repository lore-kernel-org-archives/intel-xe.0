Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790ABCAC5B3
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 09:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB1F10E6CF;
	Wed, 24 Sep 2025 09:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNf6+3lR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A9010E6CF
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758706172; x=1790242172;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1wBKwXZQhnIL5NCKeJk3//iJQb7SsUSKGgr2CIHRvm0=;
 b=fNf6+3lRQxVO1cA2U80Ijeyjc5ASNqBnadjROadfO4UUggmktHHfz8US
 BkUxfX6p41N96QoRhP8N26Z3bb82mfX0j5pNy27kMX09PAqrINnE+BE3A
 uormNQmZBBULxoxXdMKXw5qSjaHcuE3HwTilhCM+eIz6YfP6ZsEhtnjeg
 2eB74XU1tUNiaX8oCgDnp4azoGjk76Qn71D//HSLFX80OXxdI2Bo05DrK
 eC412ZQnp+a1UpanW4dgQB2ZBGNsB4VLhKcW9ggAtxVsrbjsiAtku2P1n
 5w2Rnwn85etpx3swtmq6MHyViauVhP/VJy0YhlQN6VxKL73z13+yh++Fu w==;
X-CSE-ConnectionGUID: BtsM0NmcQ5uvNs/uyHV8Cg==
X-CSE-MsgGUID: fFcPPLiUS/eMqEMeDXKxUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60702532"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60702532"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:29:32 -0700
X-CSE-ConnectionGUID: RYS3a8N8TIOy3ndeYEcJ0w==
X-CSE-MsgGUID: zdLZz7E3Qu2+VwUoWEoL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="182159767"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:29:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 02:29:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 02:29:30 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 02:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efxNSW7e05KC89VI38MNwqyksvAtZMNZnfgp2I0K7vLbbtujyew4zd5y10RVsXnKlutoRpl9AULPkraLd+e9p1bQS1hZeOTphRLew4cNvZkuvpZUya8RznKiPitp/TxKcCEKHmV+Y2xYpQQo/23nElOsBn5tNOZTCHXyOwFOBnTf6xfga318EOUWtx46oxSsad3UADWU+BWcnvFoLlJuwxJuRpZP6mjzAx3gaG35HEofPu3Dj2HNHmZ4xoITWHTVUMEi/i/tgYDfJfSRTFGSe/VG2eH2UBzux7/Z2Y/H9k0euxmBG42ABSuGtvGekWzHY+D+o0g9lKxTP0gT4RrsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjN5x+WUhkQvD4aNrqvldy+inyW23LvWWFCRfPucytA=;
 b=rMfJuMOSVqJeMl43eFDDymiRffOZIARhqzcn5qlp50pbGbAG2oH3y8kSqbDE9SnWNsCWyuSVr6xmFVIq4tzcRSRIftiIKmIXfubn6vAsYsVb4EkIViBNqdMaPKq+sOnCNnBBbjWF9E+EiRXWuTwXmS/Vl2lka5CCHWiB3iG6AtFo1ISrDhiKYlatQqEWQ2fQcpqCmANpL6Ujvp4cJ/QgUj6CYfGsiGGMQ6UeSt4+Hy1fGVy0kZ233Gaxp/YdPGwcTdHyYftniaEVb5PXQvpnNeF6u1b8OZjjfHXeMo0+Fpr91hIM+odj5W+w7hgCDrqVZj2npRrhBxsVqi4IfyQSmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 09:29:28 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 09:29:28 +0000
Message-ID: <95e75ae6-0d2e-4dc9-bea2-daaaf94150c1@intel.com>
Date: Wed, 24 Sep 2025 11:29:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/34] drm/xe/vf: Lock querying GGTT config during
 driver init
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-2-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0010.eurprd05.prod.outlook.com
 (2603:10a6:803:1::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: fd02a6da-4c12-4a4c-fe48-08ddfb4cdbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVRZaW03YXZKODVidkEyQVNDdzRoUG0wVHF6QkFLSVdDQW9OcnVnNE9NN0s2?=
 =?utf-8?B?c0k3Uy9rdXIzSXQwOE9sdzNDWUN4VG5sdTJxTVg4eXZPVnpZTGxkL1dpbFRk?=
 =?utf-8?B?U3VCRG9oWHNTdzFhYWp0aEhFbGVhQ0ZmdlRkR2Jna0hzRmNiNkRYclN1STky?=
 =?utf-8?B?VkFxRmk5YWhiRnRtem04eVdEWFhZWGd3ZTI5VlU4anYrRStoUnJvS0ZSTC9s?=
 =?utf-8?B?Si9OdTJ4T3EwYUhDQXBWWjZwWFpJNStqWlVmY1IzVkRzSWJvb3VuVUJDb3hE?=
 =?utf-8?B?OHNiTWhycFp5LzhnRTZZU2VEMGR3MXczR1lSdFJzYVl5Z001bm9ySHRvN0xq?=
 =?utf-8?B?eFAvVENwUlJEU0xKdS9zbEJNekI4NGZKdlJuVXpJZWc2ZnRYeU9qNXljbmxm?=
 =?utf-8?B?aGxwVHB6V3F0Mk5OMnkrSER5Y0tkRGJwQjgwRVJVMnVNWXM3ZFNobHV3bmdW?=
 =?utf-8?B?VWJXT3lQM29LaXlBUzRFb0RmbTZCck4vdy9WT2l5TkUxOFZkMG1BU3ZKV0Jq?=
 =?utf-8?B?blplbG8yMWdKT0Qrc2dmbW03Y2xNUkR6UTBLNlFibjhjM1dTOENwL280dXFR?=
 =?utf-8?B?T1lmVE9VRXA2NlJUTGZLc0lwcnkvbVB2Q1NMTUlCTGtUUm56ZittTEN6b0JN?=
 =?utf-8?B?WHpMVzNCQy9LVlNsVmhQWC9DZ09tNXFXdEd3NEw1MU9zcFJQSkY4RFM5NE1C?=
 =?utf-8?B?bFV6eHU4ZDVlWmk1WXh4ZzRTQTAxaVRCVW5UN0dKSGovUm5DRjZmeU4xbDZu?=
 =?utf-8?B?UnFpMHVHNUxoUHF2WWF1NUJXa2tZNXl1c3FhVHlTZStpU2RVYk9IRUJWaEx4?=
 =?utf-8?B?ZW5qK3BBUjhEZFlKWVdORUtKNlhCR3FNNEJMaThYWGUvcWt1Si9qNW1NdXlC?=
 =?utf-8?B?aXp3MXlHcVBadEFuc0NiYkhmQzhZdkhxd2JEc2hzYW4vV3JIZEs4SXIyeGlZ?=
 =?utf-8?B?ZHY4TlhrZEVJdjA5NnlkSzlQYlYxSTFtbVBNdmhNT1BIMHBUY0JGUzBTVG9i?=
 =?utf-8?B?S3BtOGFMTnRFZ2dqRXJKOENzTmhSUm90NndsSUlDNkRlcmVHQWRlZEZNWFo2?=
 =?utf-8?B?RzA4S0hWa1FCNGhHaFJmdzg3Z1VBeEZ6WVg4UVpDN1ZQV21TaFY1R2tvdnBi?=
 =?utf-8?B?empMeHZVVFo4cWRGdFNjVzlSdFU2TWdTdnNQZmtVZ0xvbnJGQ3A0Z1dWZ3VT?=
 =?utf-8?B?ZG5hOUFZQ01BNWtEb1gvVS9aYVZTNkJZZXhGaytnaHpRalFuQmdZNUFOR2RE?=
 =?utf-8?B?K0tMTHRzNUJUdThSeHgrSnVIL2s4YzdyejAzSEl2ejJidFNPd1ZnQzZRc093?=
 =?utf-8?B?ZjRMZ3I5VzRBdG96YlQxMERPWjN6ZDVKZ2RTZFhwOGY3cUhGV3poei9DLzRv?=
 =?utf-8?B?Ykh1aFFianRCSUJQWlNraVc4bnlYN0hZS1hRejFFaDY4a3k4QnY5cTQyOUZ1?=
 =?utf-8?B?VGg3VStRNXVkalhhVi9Ic2xwa01URTVVZnRwWkhoRHdQbEYrS2YzOE1hWkhF?=
 =?utf-8?B?YllNc3ZodE1nWmZBc2Jsb1hiWjFOc1Q2OTVpa0VJYUtIRWtwTVFsU1FKeWk5?=
 =?utf-8?B?cXh6aG5KTlpCVlVqK09qQ1lPWDl5SkdwelByN0tjRUpwS3NjTXFnbkxzUVNR?=
 =?utf-8?B?eDlkald5VUh4WWt6ZUdzK004OUVoVENTWmZ4ZnJLUHBSL3RxNElhTmNFTWV0?=
 =?utf-8?B?c3A0Mnd3TjdwQUUrcXoxNTVpajdSOGRtbnBjc2JmL1VTZWxETXVXYm1iSStq?=
 =?utf-8?B?S0FwU3QxTGd5L2dETzkxaWNKenBpenY2UE13QS9TREVuaWRIQnhybFFLSU03?=
 =?utf-8?B?NWJxNnVTZ0F1NUFhaUwySmdLdlByOVpLVXJMRzhKMlFFNTFSb0NXcmQ5Y3oy?=
 =?utf-8?B?VW4yUGFRYVYxTDdNQUNxM0JhL1JKQWp1MEJjUTJDTDZXaURRSjdHc1pBNlN2?=
 =?utf-8?Q?sWHoYqi7zQw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlZrVnBQSmluTEQ1ZE9TL3EwQlV3WXBLeHQrTmV0N2hlTU1UZU8vNEZMV2k5?=
 =?utf-8?B?UFlGTHpYV3F1L1c3aDlvb1BhTnhjZjJ6QUVTWFB3N3pQRlp5bDgzdlN2VXpr?=
 =?utf-8?B?emszTU1zK0hNdmFPOXJBdy9wUW02MjVwMlV0TnhDbFc2WmZ4WEpDaVBSVnRl?=
 =?utf-8?B?SkpzdG5aVUdGcjZ4bUFHVW5CdEdsK2NwcDM4RHp2YUo5UFM3TjFZcVZaZS8y?=
 =?utf-8?B?YTF6RU5ZUnFXQXIzVEJkMFljRHNnMnFtWmR6M2JGTnRWdjRxR21CSUZCVTUz?=
 =?utf-8?B?NjBHVDUxY280Z0M5SnE3TzBoL1pYRjZJeURycmxhWWRXRWYvRmxweHAwdzJy?=
 =?utf-8?B?ZVRkME5tUmlFbUMyMjFacEhwb3dtcHNYN0FWazZzV25VckpobnA0enRUY3dK?=
 =?utf-8?B?Q3FLeFlNWXZQN1gybmlCVCsybmRheGtrQjhSRUl3Z0FpbTJVSDAycHV0cWpH?=
 =?utf-8?B?OUh3RzVmRitPQU81QjRPVFRpbFR3RWh6OXh6WW9ta0ltU2U3MnRUZnhXSUlG?=
 =?utf-8?B?SWZjNDM1YWxNakZMUk5EV3VSU0phaUsrcHBZM1JMcmtMS0Ztd2RkeVVvVE5J?=
 =?utf-8?B?L0gzTTJHZVZqUXlnbEJWZjB6VndEd1V4Q1ppRUUxTHo5Y3RlYzZKc083eUtS?=
 =?utf-8?B?ZkVEVUlVR05CVTRHQ0VjbWdTY0duZGRFM1NvNkdLOUVuekkvRmlleUt6bFF4?=
 =?utf-8?B?enc0MHVvTFQvUjJpbENjM0xmeHIxNUpJdkgyd0I3RngwQ2VPV1RTWXZxYk5Y?=
 =?utf-8?B?QTExc0hDSjcyQnlDcFphbGNnNmNvTGxUdTlxTk42RXlsMHZaNW85TlFVRFNP?=
 =?utf-8?B?ekhrZEkxcGNwblA0QTExeVd6Y2lHOUFMUnkxc0lCNVdnU1R3T21nMjVDL1lQ?=
 =?utf-8?B?NUFTYWxzK0s0MmdMREhGOGlDcE5YUWhQM3dNUU9lbW8wMUoxQWVRVjFVaHBl?=
 =?utf-8?B?eDVOVVA2YU9semZJNEYzYmJMVVhNRTlLV3oyMzN3SHBOMDlPdDNHZ0RKdFpv?=
 =?utf-8?B?T00vaTl6SHBkSFVvckVWM3dEMmxRZFI2dWxpbkNuVTVkcDFaZG5YTDUxUFRl?=
 =?utf-8?B?a095dzZDdWVlMTBSY2phejdCWkJ3K1g1VmQvMnBsVGF1N1JoY1dOMVJEN2o2?=
 =?utf-8?B?MEVTWHJKa1k0MDdmSXlQd280RXRMVGtkSmwydnNTbnI2VHk3K1JSZEsvVjRm?=
 =?utf-8?B?bkdtNFJTZjFIZXFFSlZ4ZzJZb0ZNQXIrTEN1Uk1UWEZpdTlQclF3M3QxSkZT?=
 =?utf-8?B?VmdVNXFHVkhiUFhRemlVUTBLemV6OXlocjl4azI3MXpna2NwWFNEeldkWnA4?=
 =?utf-8?B?UFhEMkozZGlQMW0vbHd4TkFtTmd5WnNJc1NGb3Fwc1ZKcVFFT21oS09QVHZR?=
 =?utf-8?B?UTVQaWJnU1RPSG8vWkI4Mk10QjA4bWNBU2RDNHl2VnF5dnRWVUdhM1FrenRa?=
 =?utf-8?B?M2IrQmE2Zkk2NExIVmdLWW04SXZQZEdPTitkTC93d2cvaWtCTFhML0pjclVo?=
 =?utf-8?B?U0ZSeEtVbEhRV2hHUXNoc3pZWU5tMjRYVmdPZ1BHbVhoMEREMlFERG45Wkd2?=
 =?utf-8?B?eWwvWlJlVXp1bmdlQmE5bmRXZ2JOREVEeHZuTWVKeWVSSkZ4Vi9QL1g4NTM1?=
 =?utf-8?B?WXFKY1NzUitsTG9FZ3pQNVpISUdEYUFIejRCSXdkcFNCVElvaW8vR1hXR3Na?=
 =?utf-8?B?bzk1ck1HZzRGYTdvYXFuWGdnKzBTcHQzZmtEUHhybUdwQjZIcjc3TUpaQnU2?=
 =?utf-8?B?cUFvREdPbDBLcVpqRDRoOHVteGRIVXh1UXB2bUdGemhXWFRUVU9tbmJPNHRZ?=
 =?utf-8?B?QmhSQVVacEYxZXU0NVFPVTU2SEFBd3BrNVcxdWpFTVpSWENxbERLQm5kV1pI?=
 =?utf-8?B?MnVTQ2lIeTRYeHhZNE5QMEtXdzExNHVhNG5VWVlETkxOd0ljdVExUTdJWEwr?=
 =?utf-8?B?TnVwZXVmb09ITVZZNVhPYlEvQSt4Z0EydytzL2ZaUC96UmNKREFVeG9COWJy?=
 =?utf-8?B?U1Y5ci92MEMzTjF2VWV3bEJYUmtVSFRMVzZJZlBQN2NVVUhaN2F1YzVDajBY?=
 =?utf-8?B?d1hIclFCY3oxWDJMNjJoTTNQelYvdVEvVW5TVkhFMWVWdEsvMWFzVzNsQ3ds?=
 =?utf-8?B?cXVSd2ZpbzNZM0dZZmtzVHA1MFBnWEZ0dEZueHBIcE0rNlNmWHpxaWpudkpJ?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd02a6da-4c12-4a4c-fe48-08ddfb4cdbcf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 09:29:28.1911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56UiNp3OfI7n3SxWuRTQyX2PsKdKuRt4YTurBferAapolNJ3XcZsQEPiVdrqmAFs5tkKPGkbVlo6sfU44EAnAD3xLnWBuMq9taiYqQuTkXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> From: Tomasz Lis <tomasz.lis@intel.com>
> 
> Protect access to GGTT config as this is non-static information.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
>  3 files changed, 84 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0461d5513487..016c867e5e2b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_write(&config->lock);

do we need to protect also VF2GUC communication ..

> +
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  

.. or just RW access to the data itself from here?

>  	if (config->ggtt_size && config->ggtt_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>  				size / SZ_1K, config->ggtt_size / SZ_1K);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> @@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	config->ggtt_shift = start - (s64)config->ggtt_base;
>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
> +	err = config->ggtt_size ? 0 : -ENODATA;
>  
> -	return config->ggtt_size ? 0 : -ENODATA;
> +out:
> +	up_write(&config->lock);
> +	return err;
>  }
>  
>  static int vf_get_lmem_info(struct xe_gt *gt)
> @@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_write(&config->lock);
> +
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->lmem_size && config->lmem_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>  				size / SZ_1M, config->lmem_size / SZ_1M);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>  
>  	config->lmem_size = size;
> +	err = config->lmem_size ? 0 : -ENODATA;
>  
> -	return config->lmem_size ? 0 : -ENODATA;
> +out:
> +	up_write(&config->lock);
> +	return err;
>  }
>  
>  static int vf_get_submission_cfg(struct xe_gt *gt)
> @@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_write(&config->lock);
> +
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  	if (config->num_dbs && config->num_dbs != num_dbs) {
>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> @@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  	config->num_ctxs = num_ctxs;
>  	config->num_dbs = num_dbs;
>  
> -	return config->num_ctxs ? 0 : -ENODATA;
> +	err = config->num_ctxs ? 0 : -ENODATA;
> +
> +out:
> +	up_write(&config->lock);
> +	return err;
>  }
>  
>  static void vf_cache_gmdid(struct xe_gt *gt)
> @@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>   */
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u16 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);

the purpose of this assert was to make sure no part of the VF driver
is trying to get num_ctxs before we finish querying it from the GuC ..

>  
> -	return gt->sriov.vf.self_config.num_ctxs;
> +	down_read(&config->lock);
> +	xe_gt_assert(gt, config->num_ctxs);

.. instead of moving this assert in the middle of the lock ..

> +	val = config->num_ctxs;
> +	up_read(&config->lock);
> +

.. for code clarity you can add assert here as:

	xe_gt_assert(gt, val);
> +	return val;
>  }
>  
>  /**
> @@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>   */
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u64 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);

ditto

>  
> -	return gt->sriov.vf.self_config.lmem_size;
> +	down_read(&config->lock);
> +	xe_gt_assert(gt, config->lmem_size);
> +	val = config->lmem_size;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  /**
> @@ -613,11 +647,17 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>   */
>  u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u64 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>  
> -	return gt->sriov.vf.self_config.ggtt_size;
> +	down_read(&config->lock);
> +	val = config->ggtt_size;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  /**
> @@ -630,11 +670,18 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>   */
>  u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u64 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>  
> -	return gt->sriov.vf.self_config.ggtt_base;
> +	down_read(&config->lock);
> +	xe_gt_assert(gt, config->ggtt_size);
> +	val = config->ggtt_base;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  /**
> @@ -648,11 +695,16 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>  s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	s64 val;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
> -	return config->ggtt_shift;
> +	down_read(&config->lock);
> +	val = config->ggtt_shift;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> @@ -1044,6 +1096,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_read(&config->lock);
>  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
>  		   config->ggtt_base,
>  		   config->ggtt_base + config->ggtt_size - 1);
> @@ -1060,6 +1113,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  
>  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
>  	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> +	up_read(&config->lock);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 298dedf4b009..d95857bd789b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GT_SRIOV_VF_TYPES_H_
>  #define _XE_GT_SRIOV_VF_TYPES_H_
>  
> +#include <linux/rwsem.h>
>  #include <linux/types.h>
>  #include "xe_uc_fw_types.h"
>  
> @@ -25,6 +26,8 @@ struct xe_gt_sriov_vf_selfconfig {
>  	u16 num_ctxs;
>  	/** @num_dbs: assigned number of GuC doorbells IDs. */
>  	u16 num_dbs;
> +	/** @lock: lock for protecting access to all selfconfig fields. */
> +	struct rw_semaphore lock;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index cdd9f8e78b2a..d6e2ed9b9bbc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -197,6 +197,12 @@ static void vf_migration_init_early(struct xe_device *xe)
>   */
>  void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		init_rwsem(&gt->sriov.vf.self_config.lock);

this is a wrong place - VF's per-GT data shall be initialized in
the per-GT code somewhere in xe_gt_sriov_vf.c

> +
>  	vf_migration_init_early(xe);
>  }
>  

