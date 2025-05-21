Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0D8C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 17:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64E114BA54;
	Wed, 21 May 2025 16:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/HPb17r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A1614B4DE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747846288; x=1779382288;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WNTVFCsE4ShzWqsN3e75qBSf7mgO8LOMVd7V7/ZIsUo=;
 b=R/HPb17rDgvh4dNqWDtJGpYdd0tKJ8m0eeM37EdhpXanrF4EgprHSBDW
 FmJu6xxKId0UC8WA2q0laFVFH+LvheOdLZmbI8vDl6GTT58AJiKtoksnq
 MZhByyIjGIFivZ06m6cvSjL5kHd+6DWqRSeOpuJGJwN+7nmeum69LItn5
 1HKjE7Lj5sDYV0T88WslHmu6Mlh9BkrDrA9KtYMqzwC6PbvWIjDhk+hH8
 HS+oeawU6Otuwqgo6l4t3EOIAEFHpo+FKq5KiVtLIzyaL/twILPvOtlWL
 C30V4gl2RIrlVA8LhMNfsj9Z9i6og6gS53eqtTGx9kgn6ab/HIlt86hs2 A==;
X-CSE-ConnectionGUID: mzU72iOESjWn3c1SeJp0wA==
X-CSE-MsgGUID: FBL+iqD7RFaRCwXV5k8NgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49542212"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="49542212"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:51:27 -0700
X-CSE-ConnectionGUID: GKv8NqF0SU6Q+ZcKzxk+zA==
X-CSE-MsgGUID: 5M/Le/U9TzmCfQGFHBjllg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="140002326"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:51:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 09:51:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 09:51:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 09:51:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBWJ8O47OG/ORclIM9RHGZDqyXIc5cyaYGR7aUVtR4t91LCRFpRpPT9qIV7fxtx5mXJ2F9w06LkNxaeGiGlc6IXwhhoInZUemPzwuS/TkAQGpE8c92bZdmeVYAkghiHlxkPISYcjwaaNurMwqLnYKb8FRpz0Z16BqOADz8vuRDqB1wdDugfaH1vyXKFho3DE0vzesnhF3ulHZOi3Ht5Mren81yTqVFjZ4AxVWfMpysZDucOnmf6NCeqs+VN/sHu1rpdurcRqm2i5WtiJlijgQZCTHHd6G7V7PXivtXSCMI/ZBTLa7aAd3oBG38kyN8GV9ugAyS7QsmaU0uHxduuHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tdet9joR3nyBCTaqWDD9Ia9HNrDOtnAhtctPKu/ABJc=;
 b=TphXPsdBMBeFFAcq7lFeqIk8a+bPL3Vd0g5hOQR/eZGDyOVpU0RSBIPDxss7DDL60mEyt0G101GEAZPUkY9Ukdb6j/+OMdKbG1ucPSCRyM5JfJb5PFJQlSp+/OD6E0HDl7CrRlqKv9bXGJwkhHlNXoNbLvN2jUvgM2eJSPdFlzz0HoREXU9iGmUu/QBFcb9KPyqcU03xy/KgTCzV0PoC0g9NnZLBatmd3AJvHBZdzW9YeJ7pZmp19bu8J+UIyH+reFzXzKB9ns0llyVkaut8IbhXucaO3txXAj9Xadg04mwJxkCmGFh9LqLTNVONL0AZUt5Kt5PcfZOTvuoDHsnt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 21 May
 2025 16:51:10 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 16:51:10 +0000
Message-ID: <123663e9-ceea-4ce4-8fdd-1a608b1a51ef@intel.com>
Date: Wed, 21 May 2025 22:21:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/32] drm/xe/madvise: Update migration policy based on
 preferred location
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-27-himal.prasad.ghimiray@intel.com>
 <aCUTfM2cmQktqMN4@lstrano-desk.jf.intel.com>
 <96929a4e-8914-4c4b-9d8c-a351008bd947@intel.com>
Content-Language: en-US
In-Reply-To: <96929a4e-8914-4c4b-9d8c-a351008bd947@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 50119fd1-6f3d-42bb-ff5d-08dd9887b03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WStVZ0NqWVlEdXRGK2hpZG9RMHptc2plRU9qOTBOZi9tTVlBeGNOamRocklm?=
 =?utf-8?B?UDZ6OEdnMjEyT0RrRkUxZWhaYlJkQzU4Ym55TVVWa3h5M25ZZi9oNWQzaC90?=
 =?utf-8?B?VmNIVFAxb29JQTlzbmZtdGw0UmlkMEtYKzZLVVpnSmhYWktNT1BkbFhJWC90?=
 =?utf-8?B?eklYdkFBNlVIVnd2cnZsbGtmSXVVZERWandpRUc4YmxCUDdmQVRUYTRsUTc3?=
 =?utf-8?B?akRwZUFIK3Vmem5nOUpQeVFBQXB4OStZbXVlK25neXRhS1BycFBrMWdhbE1q?=
 =?utf-8?B?cCsweksxS2dzMmpVTVFPZ1oydnpPbG5ldUtQOU9wTk40Q0pyQmxDTXN5ZGxH?=
 =?utf-8?B?ZkJCRVRjUzdiVEd0WDZJSG5HdzgrcWZlQlhwVGRCZlRlcExGU2NpbFJwaWxv?=
 =?utf-8?B?RE0rU0pRSzluNUtFMUYzSXUyZzk3OURaRURtK1J5YW9oNlM4em56bmw2S3cz?=
 =?utf-8?B?OWlNVGUvTUN1R0lJVXVWMHNDUjVmWldvSEFaOUcxczk0UVA2ZmZZdU15ODZj?=
 =?utf-8?B?WTRDZEM4dG9LOUpwUnpDTEVnVzNFTXJuTk5ZVUZGYnhlOEJOT01iRkVlNy9v?=
 =?utf-8?B?SGVYL3hEMkJVS1h1UUZjUS9tOXBFWnhLdjB1dGtuVVFtN1hSWEIyeWo0dUta?=
 =?utf-8?B?UHhydUtYWDVvT0RJUGR4MXpzSHEwaUtBY3NDWXcyQnhQcElxeXZqcE5nZ0J6?=
 =?utf-8?B?cnkzc2t4S2ZPNGhaaGVjTnNRN1hicFBJSFVSQzkybGdHSExVWVZVZDdWdDRC?=
 =?utf-8?B?NEhlTmIxckdkbU1hdElhZUlGTW01TWljVEZjeDRFM1Y1ZFVENjdaNGh4ZC9R?=
 =?utf-8?B?aGsvdXg2ZVBFcXFuV25ZazdYczFOY2ZWWUltdDJXTWMyWGZRdjlkSDJxZkd3?=
 =?utf-8?B?Y09zMmxtN05mYU91UGZZVitsZm5UTXRTWDNacFBSSFRkQnlGL0NpTkQ4SGZ2?=
 =?utf-8?B?NklXVXVETjlWSUZFLzV6Tkh5Uzl2QWhYU2NpZHhlWTNQNmpIRGJBY0ZJWG5i?=
 =?utf-8?B?WnFnRGFHZnIyUDN2WlVOVWpYZ3Y3bmE4cSt6NUtCMElXOFF3TWcwWm9aVmJL?=
 =?utf-8?B?QXRRdzZobWdqTTZSU2orRHVYWWE0UzhibnR3L1pObUx4Y0d0ZDlNOHV0ZFdY?=
 =?utf-8?B?dGloNVBlaHRIOFdyOFVjQXgzTjhDRnpHanhYSGxsTUdyLzNKYmt2ZlNPTTA1?=
 =?utf-8?B?ZmlvTk43akVBYkZlbE1yQjY3V0JyUDdrTnljT3RuM1BTMElaSU9kaHk2OWJZ?=
 =?utf-8?B?eURBdmpuanN4SE15VzdEM0gyNkFoWUNwa21ibE5xWk1mUkpxMGZ1UmVqaWla?=
 =?utf-8?B?UmVSRWh3QmxqRktSL1RDb3NrMzFCUDNDWFlaRkVralRnMW1qZ3E3ZjZZZWJH?=
 =?utf-8?B?SEwrNExKaHF2UUhGaXNxZlUzQ3U3UzZ2R3BNUVZCamVKV2czVG1mM0tabkcy?=
 =?utf-8?B?VFFqWlVzOFU0WExBZ3A5dllPMzhSNkVIMGV5NlVpWStwSlJxMVc5b3YreWNa?=
 =?utf-8?B?cFFBQkprM2pVTStvZ1JIRWUwbmluRU5FRnR4TG1NWDhpUWxDcXAxK0tDZCtI?=
 =?utf-8?B?b0VrbURlMlV5VjNhbGZVdkltWmR2S3VaS0VRYTdId0w2RmtVeEY5MkZFRXRV?=
 =?utf-8?B?Y2JOUmFaYjBtOXhWNFNTSVRBcEptb3ZRV3N1SzUrMDFxbTdGQmxXaEVZdWNW?=
 =?utf-8?B?UmxnV24wVmFKRTl0dWRQNVJkcXN1VkJBcEpkNzQ4anVzV3pZdjJxU1c3UDBJ?=
 =?utf-8?B?ZFlva0lNTTRXaUFRUTY5WHhGREljSzJrQXBSMXQwMkZpeENBZ29nZ2hHNFBh?=
 =?utf-8?B?emVOSEE4ZVQ0QkVaR2dseWhZVmwxOFo5SWM4Y3QzY1FoWHBTcEpNbktqRERv?=
 =?utf-8?B?YVJNbVdueGlaaXVvQnRDQ3NaaktVWDJnTnRoeG9mZFBzTDNyT1c1Z0pJOFpP?=
 =?utf-8?Q?Ackr2ByRzzE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUdlZVRrSEhVbGphcU1GaWVkc2pIUzZqd3g4RldnclhtM0ViSnVyYW4xbUJR?=
 =?utf-8?B?M2w0bjJEd1liOTR0WlUrbnYvMmp5eXorckN5SDYyckNndnAyRXA0N2tWMm5S?=
 =?utf-8?B?R1NYZjA1Uk9Iaitma3ZKU2tsKzVQcjVGWTEvdXpBL3d1Ti92aGcrZit6NDRB?=
 =?utf-8?B?bjByL3ZOdEk0b2RxUnl1Q2xERlBrdDIrRlBHUXgyT3lpa0VVVUFicnVNUWU2?=
 =?utf-8?B?VGd6TXc1TUMzb3pFYk1SNHVtdCtIYjhSQnhxSTdVNDdPYnNZdFFmNGh3NzRj?=
 =?utf-8?B?OS9XRHdvRW5oSmFJWVRYSS9qSy84U1dTaGhsK2UrUVlqUktNaTZLYzBqSUtp?=
 =?utf-8?B?M3V1YXpPRUpVczVVREJIaUgzNExLQTd4VjFwdE9UOHlsYlYvMXBkcVRlTWFM?=
 =?utf-8?B?OThqNkRlNmNtR3hRSC8zaldyaDc1WWdVd3hYM1dPVEp3UHYwZ1E4dWNCeXQx?=
 =?utf-8?B?ZXFqTzVGT0Znclh2a2RtQ2taa3pYbEdOWnZrUXZnai9EV2psMVhSTytsQ3A1?=
 =?utf-8?B?b3FDWmJsOXQxWktBOGY2R1pYWi9LcGgwQzNhOXNtVHFUUkErOVA5UVRvUDR2?=
 =?utf-8?B?NDBqY1NwbEE2amxRUTV3TlpIUzJ6N1owNGd5KzR0RlR5MWJVeCtNN3V1Vkc3?=
 =?utf-8?B?eFdIbk1HOXE0VzB6UEFERlVmVy9MOEl5aTBidkdNSTk1bVJVOWRGaDkxa2FB?=
 =?utf-8?B?TVB6clhCSm83ZEliSkJoWE5ORGRxTmZkMzk1ME80Sndvd0J2N09ObHZ4aWVB?=
 =?utf-8?B?V3NBTEFLZzY3UXNBQlNGNjJaR2pwMUdOTnNicnNHNU5BTjRma1llTy92MmMz?=
 =?utf-8?B?dks3SGdjdGp2VnJmOHZWUmQzS2RVbWcrVlcxOGdYaXplUmZnVWxFcVJUdm12?=
 =?utf-8?B?STdrakg0MzlweG5uQ05nNDdib3FjUTQvcU9haXVhenNzM3ZHeG5wSXhsRGFN?=
 =?utf-8?B?T21yUWVJUWdVak8xK0FEdHVOcW0zb3AxajJWbm90VUhWSUgwZzNyRDVPVGZ1?=
 =?utf-8?B?WTBBcktkZmx3Mkk4T0N5SVFrVUlQMk4wK2tNaCsrWFJFRmpmUlM1MnlTS3lP?=
 =?utf-8?B?VUpxcHN0bFlOM0RjcVZYaEdKQWxPNUFxZTZNWVdaZjY3QVVMYi94VlhNM3Q0?=
 =?utf-8?B?UUthZG1xbWRTeUQ1OGxZcEJmN2Vsb1dadU53MG5sRG05bU15SmsvcmdVN3ZJ?=
 =?utf-8?B?TFRNYTFPdmVvSzc4ekxKRzFuTll6aG5IRVQwZDJNQjAwV09xKzVmNkpHUFRw?=
 =?utf-8?B?bk1HbUM0UnB4TVg2RlhKMit3RW9VRnloNDBVUi9Bb01FcTJyU2ZYRHRYVE9P?=
 =?utf-8?B?cXVpbHFPVmRvd2RtSG50N0YzRzhCeDVNajVPOHNXeHUzdFdva2pLSEE2NVhm?=
 =?utf-8?B?dVJoZmpTREMvWUlidUZGbFpxbUhQbmkvTTV5SmxLRXFKem1jVjlJYnFSMXQz?=
 =?utf-8?B?MEtuY0pyQ0grSDk5TTlRMjhXTjBJY1E1NjBLTytrRHpoUXdLbi9jNmtQc0N4?=
 =?utf-8?B?YkVydGxDQVRjTlhldkRMMDV4ZVJ4eURoaGdDbnZSbkE0QjYwaEF6K1VCZnQv?=
 =?utf-8?B?UFpaWmdDSjRlaHhIemo3UG1aSE03VTl5T1lBYXlWVVBWcG9ONWt5aVRidUNU?=
 =?utf-8?B?Q1Y5OFk3TE55bUFGZjEydzJvczVUQjZvRVNkQXBldW05UVJKekIvd09xSmVI?=
 =?utf-8?B?ZTZnRjZGTXhPdXNoeUx1M2p0Ym5ja091R0JqSzNCMUpqU1Bvd2huNWpHeHIz?=
 =?utf-8?B?MERMNGRHMHdpNXg0V3dsY2pwTmN3UWtwdTJCcE5mNXBKY2Jzak5tVXNNRENp?=
 =?utf-8?B?MEdoTXgzMldGbmJndklMVjUvZlVHZ29yTElWTFZXWjlEVHA3THRuc3ZVSWFr?=
 =?utf-8?B?alVvSDRIVE5xY2ljeFYvSTZIVXlteUZOT1paZmdTL3ZOY1F2eDZIc1hKUWFt?=
 =?utf-8?B?Sk5hbGdUOGlhaW4yZ3lLdWpVRGNyblh0VkFFOGNtQnF3b1gyZWFTZzQyQmQ4?=
 =?utf-8?B?NUxxRHdlQXlNMkVPa2JVQUZZcHl4MjZjNXN4MWhRMG1PSDNxV21QMHhQc2xM?=
 =?utf-8?B?VnNWUThXeWpnRmplWGVjNWo5OGdWZEppVlh1b3U5YXV6dGNVaGRiYytMUyth?=
 =?utf-8?B?eTVvRVJRNlE2czNCbnJ3WW9nOFAyTStWcExUYXZhY1hUaXhWWXg2eFUwREpJ?=
 =?utf-8?Q?Ep/0RMfnoZETnrRsVAQX42M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50119fd1-6f3d-42bb-ff5d-08dd9887b03e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:51:10.5370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr0s4yuSc1M7RjT+oXcc8kY43TzWhuzc5NPgSnmfryLc43GBrXMaKAG4XgT1Uw2Y5HmqfrzJGBrbG0+zGnbkpkve5qiG8CWnj8Y8wElPaUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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



On 21-05-2025 14:20, Ghimiray, Himal Prasad wrote:
> 
> 
> On 15-05-2025 03:34, Matthew Brost wrote:
>> On Mon, Apr 07, 2025 at 03:47:13PM +0530, Himal Prasad Ghimiray wrote:
>>> When the user sets the valid devmem_fd as a preferred location, GPU 
>>> fault
>>> will trigger migration to tile of device associated with devmem_fd.
>>>
>>> If the user sets an invalid devmem_fd the preferred location is current
>>> placement only.
>>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_svm.c        | 15 ++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_vm.h         |  3 +++
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 20 +++++++++++++++++++-
>>>   3 files changed, 36 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index d40111e29bfe..60dfb1bf12ca 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -765,6 +765,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct 
>>> xe_svm_range *range, struct xe_vm
>>>       return needs_migrate;
>>>   }
>>> +static const u32 region_to_mem_type[] = {
>>> +    XE_PL_TT,
>>> +    XE_PL_VRAM0,
>>> +    XE_PL_VRAM1,
>>> +};
>>> +
>>>   /**
>>>    * xe_svm_handle_pagefault() - SVM handle page fault
>>>    * @vm: The VM.
>>> @@ -796,6 +802,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, 
>>> struct xe_vma *vma,
>>>       struct xe_tile *tile = gt_to_tile(gt);
>>>       int retry_count = 3;
>>>       ktime_t end = 0;
>>> +    u32 region;
>>>       int err;
>>>       lockdep_assert_held_write(&vm->lock);
>>> @@ -820,7 +827,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, 
>>> struct xe_vma *vma,
>>>       range_debug(range, "PAGE FAULT");
>>> -    if (xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm- 
>>> >xe))) {
>>> +    region = vma->attr.preferred_loc.devmem_fd;
>>
>> Mentioned this earlier in the series - you are assiging a devmem_fd to a
>> region which is a bit confusing.
> 
> Hmm. Agreed
> 
>>
>>> +
>>> +    if (xe_svm_range_needs_migrate_to_vram(range, vma, region)) {
>>> +        region = region ? region : 1;
>>
>> I think the default (region unset) should be the VRAM closest to the GT
>> of the fault.
> 
> True
> 
>>
>>> +        /* Need rework for multigpu */
>>> +        tile = &vm->xe->tiles[region_to_mem_type[region] - 
>>> XE_PL_VRAM0];
>>> +
>>>           err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>>>           if (err) {
>>>               if (retry_count) {
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>> index 4e45230b7205..377f62f859b7 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>> @@ -220,6 +220,9 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
>>>   int xe_vm_userptr_check_repin(struct xe_vm *vm);
>>> +bool xe_vma_has_preferred_mem_loc(struct xe_vma *vma,
>>> +                  u32 *mem_region, u32 *devmem_fd);
>>> +
>>>   int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
>>>   struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
>>>                   u8 tile_mask);
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/ 
>>> xe_vm_madvise.c
>>> index 7e1a95106cb9..f870e8642190 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -61,7 +61,25 @@ static int madvise_preferred_mem_loc(struct 
>>> xe_device *xe, struct xe_vm *vm,
>>>                        struct xe_vma **vmas, int num_vmas,
>>>                        struct drm_xe_madvise_ops ops)
>>>   {
>>> -    /* Implementation pending */
>>> +    s32 devmem_fd;
>>> +    u32 migration_policy;
>>> +    int i;
>>> +
>>> +    xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
>>> +    vm_dbg(&xe->drm, "migration policy = %d, devmem_fd = %d\n",
>>> +           ops.preferred_mem_loc.migration_policy,
>>> +           ops.preferred_mem_loc.devmem_fd);
>>
>> As mentioned in patch #27, I'm not sure this debug info is all that
>> useful.
> 
> Agreed. Planning to drop preferred location in next version and let it 
> be brought in along with multi-device support.

Had discussion with UMD teams. They need a way to setup smem as 
preferred location. so will still need to support preferred location.
Will try to do it in cleaner way.


> 
>>
>>> +
>>> +    devmem_fd = (s32)ops.preferred_mem_loc.devmem_fd;
>>> +    devmem_fd = (devmem_fd < 0) ? 0 : devmem_fd;
>>> +
>>
>> Why (devmem_fd < 0) ? 0? I'm not following this.
> 
> Incase of any -ve(invalid) fd being passed, wanted to have smem as 
> preferred location.

> 
> 
>>
>>> +    migration_policy = ops.preferred_mem_loc.migration_policy;
>>> +
>>
>> Mentioned earlier in the series, I'm confused by migration_policy and it
>> also looks to be unused unless I'm missing something?
> 
> This was supposed to be used with multi-device support. >
>> Matt
>>
>>> +    for (i = 0; i < num_vmas; i++) {
>>> +        vmas[i]->attr.preferred_loc.devmem_fd = devmem_fd;
>>> +        vmas[i]->attr.preferred_loc.migration_policy = 
>>> migration_policy;
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>> -- 
>>> 2.34.1
>>>
> 


