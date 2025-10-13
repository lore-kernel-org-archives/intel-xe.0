Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65599CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 18:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A55910E4B0;
	Mon, 13 Oct 2025 18:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGBHpVca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F0C10E0C1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 18:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760378573; x=1791914573;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FAFYjg6MXdEbFiwccR7yz7/YkUviDqTI4EDuDvd0S2Y=;
 b=TGBHpVcaypU9rYvigNc59lIv2OwLnzvnl3P3SXtmqQ17DIpKSt0Jp5hz
 PweFR/chXf11EIX7ydnlkPu3Is4l7znp1yjbihpDjgVCd/0RZpRQDRj4l
 lklemp+RRBl24lHm0NvYlqLeUPWoDaX5K5BvtKzgHCY3ITORlBwIy4JFK
 ZhbNMvhA/nTNa6MfUUS/Xz83qzG2Bzd0C660aBp20XOohBQSvf4YvZTd3
 lvnaMjSuCGWCVf5JMKBJid4/y1iS25iQf1J+DMGN6CPBj9BEYh83trkqB
 nYxq2+c6A7xrkz1pI8vTt04gyN281b3GovVg22A7QWorS1y/svC6N//y6 A==;
X-CSE-ConnectionGUID: OJmLJ8zTTMa+DwsN10wBwg==
X-CSE-MsgGUID: GNRLc9lfT0OVTdivpBSpSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73630620"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73630620"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 11:02:02 -0700
X-CSE-ConnectionGUID: u3ug4fYaSR63EOw5GHd7SQ==
X-CSE-MsgGUID: GQPPypFvRkiPSfh1tP8+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="181612573"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 11:02:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 11:02:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 11:02:01 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 11:01:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9mgqzFHTojx3eHnyk940CJWFNr07j1sNqQsFU4azrvx8lV4r0Q8zW+wymKkxQLrV4U8D3yXhW64T8Ri61x0Ar5rVnpPSohjVdFRQ3Jce7pKWsLc2QFkfiWKh7Bb8QhBC3Ax/E3Uhap98ji6FzZBTpbcnBqcDxYAj2UNSQWwhkOKEAMuAfo1AKW0M2Qz90gtLGnsIrYFAVgVh6LEcQrgS7VACC4fjvnMB4+oksxkyzf2KbGVrH/5SZmQsz2x2qf4Y/45BDmoaN/EH/NV9F6VJF1LHAvFnM/ZfmmXrwFpe3Ra2Hqk7poX8n6lXppmlts3kkYt+WHMUMZVaOKZ5HCkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAFYjg6MXdEbFiwccR7yz7/YkUviDqTI4EDuDvd0S2Y=;
 b=iTX34s4QFmGxjhCL2V2wmNHEOn63Hc3MDPzAusg1Wch7OwKUdyHchxenWPXrHelkRfCJOknDTwAnN1ZdQktHOX+U38wAx/Uu3UujHXxm5GmRDHngmm067WqFwJXvrwl/br2ajgqjQmLjkHRi1oHM3rhMkbxlj3Jz1th8Riy6y+3332ajXFSNp8qYv1An3NFtM+p+kCA04vlUDq0pm1v0EdlNQdBZfxLnzXP+ZQbzYF6lAkQv70ejkoaCndTFyS5g+fqCmacZCidm7qFzF7f2a3CQy2phEIjlz+CdHDa+pmZnMjEd0IPvSQdbodTJ8vWaX+7fY7pq+jEdBfpJsKezfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 18:01:49 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:01:48 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "simon.richter@hogyros.de" <simon.richter@hogyros.de>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Thread-Topic: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Thread-Index: AQHcO/PqZxiwTgJVQUOfXOHdy3NqXbTAT/UAgAAB3wCAAAITgIAAA2GAgAAHsoA=
Date: Mon, 13 Oct 2025 18:01:48 +0000
Message-ID: <491b926a58fc9e6f0da5f70a4209e76eea6a0537.camel@intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
 <20251013034555.4121168-3-matthew.brost@intel.com>
 <a435a2a974b8627c945471e75c4dc21b835e9d22.camel@intel.com>
 <aO0zhM9xAMlnUDea@lstrano-desk.jf.intel.com>
 <acdd0cfc8e700710ee5b43c816cdf7de3f57b374.camel@intel.com>
 <aO04Fz0f9pRFVgUF@lstrano-desk.jf.intel.com>
In-Reply-To: <aO04Fz0f9pRFVgUF@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB6714:EE_
x-ms-office365-filtering-correlation-id: 70946082-3c19-4ae3-ad24-08de0a8294a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TUVwNCtUSDVrZ01jWWM0TkMzU2ZrLzgyWXVRVm5nelorcmZ0bldaSkRXUnA1?=
 =?utf-8?B?SmkzYXZHb1VCMWs0M0xWYkFuL0hjQ0liWFlnbVZtY2k2SGFNVjBuVjNCdEdo?=
 =?utf-8?B?NVJTOUxybmxiKzB4T1hmVU1jVzEwQlNjMFJnVzN6VmFrOUxHZDZQa1FYK3Ru?=
 =?utf-8?B?b2FGWmZKaXZOUG80dFdRVlNhV2JFZThEMUpyWGJTMUdNZnBMdC92ME1RdzdR?=
 =?utf-8?B?aDZpSUVMK1oxUnREdVg2QlV3cjZLKy8xSFRWNnc0NHNqbmlDUTJQcXZVVENR?=
 =?utf-8?B?azlwVU1CUmtUSlNaQ0ZDM0diaTJxMXBjU1NqNmViY1ZYRFVjMnplUXlXbWFu?=
 =?utf-8?B?V3dCTWZnd2NiYUVqWUd4LzRUTGRCdTJzWDRhVU4rV0hyeE5JcnZvQXB6anRV?=
 =?utf-8?B?MlVrWHlpdmZXOGl1S2xvVWx0K2NXdUZnc29UZGRQWCtDWDVvR1ZlQ2tXUGJP?=
 =?utf-8?B?SGFrL0pOMmtjcElSUlZZRmp1MzU3dGlIMHBXdVdJSlQ1RnJGckhmSEFQQXBB?=
 =?utf-8?B?RDJQQnJuV2xzNTYvYy9KM0V1alE1RUFCWTJ6Q2F6TXo0TjZDVUVGSDVQc0FW?=
 =?utf-8?B?MUFPN0ZGMlVjQ3h0a0VwTHhIUjkrWFIvL3ZOd3pENlU2NGlRekIzOVFua1Q3?=
 =?utf-8?B?QWc2VUNublpiZXJyamJvRWZSMC90U1pnbTVMQXJHSjY4WGsvYkJlTVNadzZO?=
 =?utf-8?B?N3BJcTZ6YVI3TFJYaTJPOXBXekpUWEJOeEFLTnBNTklIejhPQnZUUEFCTlZ4?=
 =?utf-8?B?Z2NOTnVhNjRqSURPZENXYjF1cFlTUkJGRWNwcVRHTTRGYzJSTkduQnpuenNq?=
 =?utf-8?B?TVBHU1doM3NnSWw4MGtyR0hLaXJ4RUhWaXhFN0pUeUZzQ1BJTXJ0dTVjMWRF?=
 =?utf-8?B?UWFUR2FHUmxCZk9ydEZzUFJoVU5XNVNwcEEwZkEzYTQ5eXQ2R0xPN1lUeCtM?=
 =?utf-8?B?NE1tYVhlQklFbW9zN3k4VHFFb2h2R2R2c1FYc0dIMENPb2IvWHB4RDRBRnFz?=
 =?utf-8?B?QXduMTdGU2xqVzNuVkxqUmVpcmE2VG14UnJoMGJRQ0hLRVdLV1VYZFRLVlNp?=
 =?utf-8?B?azVHZzYrbllGQ2ZhU3ErV2lHa2xSS0lNRlI3L0dMSmVZc05ZaWhkdkxnNDR2?=
 =?utf-8?B?MmNmTG9IM281dEZoaEdYWENwOXdXblUzZkZkMS9xUzRFOE1xQ2NlMFJLMjgr?=
 =?utf-8?B?VjBLUjR3cS9Gdi9nUVVlbGJzdE9PcTZJZG5ObStjTGJNb0UxUkY3VHVKU3dB?=
 =?utf-8?B?L2QrU0JWRXdyeWJrY2NYOUgxQVVhQlE5aTQyS1FkNDhOTnR1NXB2RmVIY3VW?=
 =?utf-8?B?MHdHRUJvS2VocE15cFdGeERIWGtLZ0JheWdoUnB3TGhJVXRmTVVlYVlMUUNI?=
 =?utf-8?B?ejYzS3FZOEVaKzFyS0pZN2NSMEhZMEpzeUZZTk9ML0YxWWkvYVJvTmZqRzZ0?=
 =?utf-8?B?bEs4anBHWFV2TzZjeDZ0WWVQUTFJek8wOUd0am5EaUxCQnBBTkFGZ2dpTHdz?=
 =?utf-8?B?YmZsRjBqaWlZOGxIZ3VQWlVhNzk0aDA2UDlwbFgvN1MrY1h4c3NWZjRydlVP?=
 =?utf-8?B?cUZsbjJDMUtnUnhlWTJSMEx2OWovbEJ1Tm9PTlo3SUlwSko0RVFsOFY3aGUz?=
 =?utf-8?B?Z0NwdkU5MDV1UzgvSSsvUE0zbFBtUEVNN255U2xJNDM2MmtCMjRhNkZUWng1?=
 =?utf-8?B?Y0FaQ3pQQVRhdlc5d3Zob0F2U3ZKaTU3bVNHd0RJeDZXbWxjNFI5SmZrRTNi?=
 =?utf-8?B?dVRvVmV3UWVWamZwWmhXTnRvc0xBVHJiUmd3dUQvSDBaVjBLekJVTEVOMmZt?=
 =?utf-8?B?cGtiQjNlTEdJSGx1emx0V0NndXRCbjl0SVEybGZyNGRJcStOZVlKLzVCM0dQ?=
 =?utf-8?B?TEJrZzRlRmhGaXcwenUrU2lhcWZNcWNJRmNZME9FVTRCL3JzUnJBWjhycWM2?=
 =?utf-8?B?SmJCRXBWRXJqUHBkdkdrdzd2QWFHK1lUQWRjS1NxOUdUZDJJTUp4SU53bUZS?=
 =?utf-8?B?M2xZd0YrK0pqWitsN2ljeWcvM0NHRjZrWVVsOHJGaXQ4UnpVOVA2WHNpdVZX?=
 =?utf-8?Q?EtmxkN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFp4RjN6Umh3bnhWQnB1Y2d1QlVsdE54elYvRGsrOEtVRndrb2d5ZW1vTEN6?=
 =?utf-8?B?U0lEYjNGSGhyRy9XTU1zZlJWUXR0aS9uL2VkVTZJU01wY3NpZUhiSldKU3dm?=
 =?utf-8?B?UVJZT1MvODFpakNWZFllWUhyQjVkUk9VUkU4WGt5dXpjMC9PSjgvSmMxVkJY?=
 =?utf-8?B?TW10RjN5Rk9BaGdFejhKWEdmYzUvWExCRlRTQjE2ZmtwVTFmc0g3VFlFU21x?=
 =?utf-8?B?YjBjMG1BdldVaEJOc1ArUHlGOEZ5a0YraVpLU25rWDVxZXpkWHV6VGthNHJB?=
 =?utf-8?B?OHJzUlNBQjZzVlVUaFpWajhvbjFtQ2xOWE02WlBQZjNBeXY3YURSdGZvclU3?=
 =?utf-8?B?V0lEUm9Cc04veVEwT2o0bU5YUnlPUVRPdXZ1OXdTbEkzRTYvei9WM2YrZkFJ?=
 =?utf-8?B?T3pCa2VhQW0rSTN5cjRObjhzUDZNdFVxd1NhOVFaTysyUE4rSEFwbWdWVjly?=
 =?utf-8?B?bGRKK3YyVk8ydTVzVWZkWGJSSzhCdGNtZWR5UitpQzhpWEtZRC9ndnMwQ0c4?=
 =?utf-8?B?aS9RNmxVYU4yTTZxTEdWVytSTmMra1BUNXB1OVFPbTZYMTM3dU1uVUJZODhP?=
 =?utf-8?B?aHY0aTlzQW50SzYyOWdpeXB3L1paRlJ0MUxKcjBVdkZmSUtaTjVYZUt0RDF5?=
 =?utf-8?B?WTlNY2M0Mk5rSXJpa2lCVEt2cFptWDZHUk5ibHE4b1RKalkzVUhYeVJ6UFNS?=
 =?utf-8?B?cU0rbms3S0ZwVCt5M3pZQ0EwUHFXbjlQWW9ZS3ZGaWZjWklmUWFSMDJCR1g2?=
 =?utf-8?B?K0NBdUg2TG1TQmMwT09qdTNZYmY5cXY1LzNuTytYa25JQkpyamcwL05lMDFy?=
 =?utf-8?B?TUdtY1VjU0NIOXQ3QU9iUE15SjBneDFJNE8vQkpkVGpXOXRYeiszdzhtamYw?=
 =?utf-8?B?d3pQZXRRTFduR1F3c0ViY0E1Q25xYVhhR0EvYWRTRGh5TFI3VzhyUzZvenZv?=
 =?utf-8?B?L1Ryd0I3Wmw0L0hxT09xTUFicFk4TGdNNCtQTENrckVYMFVMaS9KRDhpbjZT?=
 =?utf-8?B?ekdhaGp5aXdiNTVVSnBpYUN4bWtRem90YmFwYzRvdWJFTDkyTklZK0xkWUpT?=
 =?utf-8?B?dUR4WWRIaUNNcUkrQytHTzczU1pValFZS3RndU1DUTBlS3Fjbit4SkJ3UUJq?=
 =?utf-8?B?RDBER2lSeUdZKzVGSC9UUlFqTks1a2NpaDFsdjllVktQL1U4aDFVZ1daMUo2?=
 =?utf-8?B?Z0R2OUgvQUJoc2Z0NFg5bUFTaDQva3l0TTNmVnFTcjVtYjBGc2lESlBVRHE4?=
 =?utf-8?B?Vnk5MG5aNXBqOGRxRHAvcldQYmk5SWNrOFl1RlUrK0Vqb3Vta2RIME0vZ0NM?=
 =?utf-8?B?aVJQTTRVN0QydERWQU1vci9CTEZMUEZaTDFEdDh4UGxtVXBnN1psdy9tdlBS?=
 =?utf-8?B?SzQ0c2Z1bzdQTU9jOGh1QldyeXo5OVJFTGRmR1FBQ2ZndTlBTmQ2N2RLWFNi?=
 =?utf-8?B?elBMV0pIY1BoWHR1bTdMTSs0aklXamFjREdQcUtoeXFWVDk5SVFZaFFid0Vz?=
 =?utf-8?B?NnVNSUNqMWxmWTJuTnZRQ1FNdml1L0RjajFmYS9RZEZZWVR5dy81MGZ1L3pD?=
 =?utf-8?B?UHhHUm10SHRIdDVqTmtmK0sxVENlcE1XREtEb2MyZzc4Kzg5NVBmTHBxNFIz?=
 =?utf-8?B?T2xVVVdqZ042RWtlcThsS1ZmcnBMcnNIOUF2QURVcUt4VTk1WXp0cU9jZWFQ?=
 =?utf-8?B?eGd3OXJ6cWlmV2cxbi9ycUdYUjBtdEF1SWdvK21aZmZaVzVoN29rT1lYRy9C?=
 =?utf-8?B?MThMVGFqUjk2NE1MWWhhUkdzblBNYS9jY2V6Rmd4TzRxTDVpOVRsZFhkYjht?=
 =?utf-8?B?WHh0QnZmeVo4SFJueERpVDJoMytWQ2wzTU9IYUhUSHQ1VmRaOGtTS0M2bXEw?=
 =?utf-8?B?K0Fvd3M1UVc0a21PazZwakt6Sis5QTl2SGYxazdYeHFPRktGd2g5bkxrc1ZT?=
 =?utf-8?B?eTRHS0g4b29LRFB5bnl1RFUvNHYwUnJ5ZzQ3bHZJeWkvNmFxNEZtd0FmQ3Iv?=
 =?utf-8?B?QjFTVkdoM3JKVXdJeVViSnEyaTVyWXRLZ2ZEZTNBb2REb3h1SklDNGRMV1Ft?=
 =?utf-8?B?UlovMkY4alRZMjkzN1BXZGFlL1A2NURtNnRtYjNyQjcwLytGQ05NcGZPdE9Q?=
 =?utf-8?B?andITnlzcjJZNE12WlVRZExsLzR1S2o5bzV2d2NWSVQ4ZW82REdYcEdIR2U1?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47483B7001ADE849B5D5F84A8716B5D9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70946082-3c19-4ae3-ad24-08de0a8294a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 18:01:48.8409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gb2icfYsGJcbvEh3NQYEhVKmC07qGX9IftQAYO0hxDFIb81NB/42fJ0El2oLzDO7BCePfs/2S0Tav3EwyOkotgdtMDYF6TyEagHrGC0unKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDEwOjM0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIE1vbiwgT2N0IDEzLCAyMDI1IGF0IDExOjIyOjEwQU0gLTA2MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+IE9uIE1vbiwgMjAyNS0xMC0xMyBhdCAxMDoxNCAtMDcwMCwgTWF0dGhldyBC
cm9zdCB3cm90ZToKPiA+ID4gT24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMTE6MDg6MDNBTSAtMDYw
MCwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOgo+ID4gPiA+IE9uIFN1biwgMjAyNS0xMC0xMiBhdCAy
MDo0NSAtMDcwMCwgTWF0dGhldyBCcm9zdCB3cm90ZToKPiA+ID4gPiA+IFVzaW5nIDJNIHBhZ2Vz
IGluIHhlX21pZ3JhdGVfdnJhbSBoYXMgdHdvIGJlbmVmaXRzOiB3ZSBpc3N1ZQo+ID4gPiA+ID4g
ZmV3ZXIKPiA+ID4gPiA+IGluc3RydWN0aW9ucyBwZXIgMk0gY29weSAoMSB2cy4gNTEyKSwgYW5k
IHRoZSBjYWNoZSBoaXQgcmF0ZQo+ID4gPiA+ID4gc2hvdWxkCj4gPiA+ID4gPiBiZQo+ID4gPiA+
ID4gaGlnaGVyLiBUaGlzIHJlc3VsdHMgaW4gaW5jcmVhc2VkIGNvcHkgZW5naW5lIGJhbmR3aWR0
aCwgYXMKPiA+ID4gPiA+IHNob3duCj4gPiA+ID4gPiBieQo+ID4gPiA+ID4gYmVuY2htYXJrIElH
VHMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEVuYWJsZSAyTSBwYWdlcyBieSByZXNlcnZpbmcgUERF
cyBpbiB0aGUgbWlncmF0ZSBWTSBhbmQgdXNpbmcKPiA+ID4gPiA+IDJNCj4gPiA+ID4gPiBwYWdl
cwo+ID4gPiA+ID4gaW4geGVfbWlncmF0ZV92cmFtIGlmIHRoZSBETUEgYWRkcmVzcyBvcmRlciBt
YXRjaGVzIDJNLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiB2MjoKPiA+ID4gPiA+IMKgLSBSZXVzZSBi
dWlsZF9wdF91cGRhdGVfYmF0Y2hfc3JhbSAoU3R1YXJ0KQo+ID4gPiA+ID4gwqAtIEZpeCBidWls
ZF9wdF91cGRhdGVfYmF0Y2hfc3JhbSBmb3IgUEFHRV9TSVpFID4gNEsKPiA+ID4gPiA+IHYzOgo+
ID4gPiA+ID4gwqAtIE1vcmUgZml4ZXMgZm9yIFBBR0VfU0laRSA+IDRLLCBhbGlnbiBjaHVuaywg
ZGVjcmVtZW50Cj4gPiA+ID4gPiBjaHVuayBhcwo+ID4gPiA+ID4gbmVlZGVkCj4gPiA+ID4gPiDC
oC0gVXNlIHN0YWNrIGluY3IgdmFyIGluIHhlX21pZ3JhdGVfdnJhbV91c2VfcGRlIChTdHVhcnQp
Cj4gPiA+ID4gPiB2NDoKPiA+ID4gPiA+IMKgLSBTcGxpdCBQQUdFX1NJWkUgPiA0SyBmaXggb3V0
IGluIGRpZmZlcmVudCBwYXRjaCAoU3R1YXJ0KQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiA+ID4gPiA+
IC0tLQo+ID4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jIHwgNTMKPiA+
ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiA+ID4gPiA+IC0tCj4gPiA+
ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21p
Z3JhdGUuYwo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4gPiA+
ID4gPiBpbmRleCAyMTZmYzBlYzJiYjcuLjRjYTQ4ZGQxY2ZkOCAxMDA2NDQKPiA+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiA+ID4gPiA+IEBAIC01Nyw2ICs1NywxMyBAQCBz
dHJ1Y3QgeGVfbWlncmF0ZSB7Cj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdTY0IHVzbV9iYXRj
aF9iYXNlX29mczsKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiogQGNsZWFyZWRfbWVtX29m
czogVk0gb2Zmc2V0IG9mIEBjbGVhcmVkX2JvLiAqLwo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oHU2NCBjbGVhcmVkX21lbV9vZnM7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiogQGxhcmdl
X3BhZ2VfY29weV9vZnM6IFZNIG9mZnNldCBvZiAyTSBwYWdlcyB1c2VkCj4gPiA+ID4gPiBmb3IK
PiA+ID4gPiA+IGxhcmdlIGNvcGllcyAqLwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTY0IGxh
cmdlX3BhZ2VfY29weV9vZnM7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAvKioKPiA+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoCAqIEBsYXJnZV9wYWdlX2NvcHlfcGRlczogQk8gb2Zmc2V0IHRvIHdy
aXRlb3V0IDJNCj4gPiA+ID4gPiBwYWdlcwo+ID4gPiA+ID4gKFBERXMpIHVzZWQgZm9yCj4gPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqAgKiBsYXJnZSBjb3BpZXMKPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoCAqLwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTY0IGxhcmdlX3BhZ2VfY29weV9wZGVz
Owo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC8qKgo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oCAqIEBmZW5jZTogZG1hLWZlbmNlIHJlcHJlc2VudGluZyB0aGUgbGFzdCBtaWdyYXRpb24KPiA+
ID4gPiA+IGpvYgo+ID4gPiA+ID4gYmF0Y2guCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgICog
UHJvdGVjdGVkIGJ5IEBqb2JfbXV0ZXguCj4gPiA+ID4gPiBAQCAtMjg4LDYgKzI5NSwxMiBAQCBz
dGF0aWMgaW50IHhlX21pZ3JhdGVfcHJlcGFyZV92bShzdHJ1Y3QKPiA+ID4gPiA+IHhlX3RpbGUK
PiA+ID4gPiA+ICp0aWxlLCBzdHJ1Y3QgeGVfbWlncmF0ZSAqbSwKPiA+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChpICsgMSkgKiA4LCB1
NjQsIGVudHJ5KTsKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiA+ID4gPiDCoAo+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgLyogUmVzZXJ2ZSAyTSBQREVzICovCj4gPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqBsZXZlbCA9IDE7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBtLT5sYXJnZV9w
YWdlX2NvcHlfb2ZzID0gTlVNX1BUX1NMT1RTIDw8Cj4gPiA+ID4gPiB4ZV9wdF9zaGlmdChsZXZl
bCk7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBtLT5sYXJnZV9wYWdlX2NvcHlfcGRlcyA9IG1h
cF9vZnMgKyBYRV9QQUdFX1NJWkUgKgo+ID4gPiA+ID4gbGV2ZWwKPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBOVU1fUFRfU0xPVFMgKiA4Owo+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC8qIFNldCB1cCBhIDFHaUIgTlVMTCBt
YXBwaW5nIGF0IDI1NUdpQiBvZmZzZXQuICovCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgbGV2
ZWwgPSAyOwo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX21hcF93cih4ZSwgJmJvLT52bWFw
LCBtYXBfb2ZzICsgWEVfUEFHRV9TSVpFICoKPiA+ID4gPiA+IGxldmVsICsKPiA+ID4gPiA+IDI1
NQo+ID4gPiA+ID4gKiA4LCB1NjQsCj4gPiA+ID4gPiBAQCAtMTc3OCwxMCArMTc5MSwxMCBAQCBz
dGF0aWMgdTMyIHB0ZV91cGRhdGVfY21kX3NpemUodTY0Cj4gPiA+ID4gPiBzaXplKQo+ID4gPiA+
ID4gwqBzdGF0aWMgdm9pZCBidWlsZF9wdF91cGRhdGVfYmF0Y2hfc3JhbShzdHJ1Y3QgeGVfbWln
cmF0ZSAqbSwKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlX2JiICpiYiwg
dTMyCj4gPiA+ID4gPiBwdF9vZmZzZXQsCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdAo+ID4gPiA+ID4gZHJtX3BhZ2VtYXBfYWRkcgo+ID4gPiA+ID4gKnNyYW1fYWRkciwKPiA+
ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgc2l6ZSkKPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1MzIgc2l6ZSwgaW50IGxldmVsKQo+ID4gPiA+ID4gwqB7Cj4gPiA+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgdTE2IHBhdF9pbmRleCA9IHRpbGVfdG9feGUobS0+dGlsZSktCj4gPiA+ID4g
PiA+IHBhdC5pZHhbWEVfQ0FDSEVfV0JdOwo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgdTY0IGdw
dV9wYWdlX3NpemUgPSAweDF1bGwgPDwgeGVfcHRfc2hpZnQoMCk7Cj4gPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqB1NjQgZ3B1X3BhZ2Vfc2l6ZSA9IDB4MXVsbCA8PCB4ZV9wdF9zaGlmdChsZXZlbCk7
Cj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdTMyIHB0ZXM7Cj4gPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgaW50IGkgPSAwOwo+ID4gPiA+ID4gwqAKPiA+ID4gPiA+IEBAIC0xODA4LDcgKzE4MjEs
NyBAQCBzdGF0aWMgdm9pZAo+ID4gPiA+ID4gYnVpbGRfcHRfdXBkYXRlX2JhdGNoX3NyYW0oc3Ry
dWN0Cj4gPiA+ID4gPiB4ZV9taWdyYXRlICptLAo+ID4gPiA+ID4gwqBhZ2FpbjoKPiA+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHB0ZSA9IG0t
PnEtPnZtLT5wdF9vcHMtCj4gPiA+ID4gPiA+IHB0ZV9lbmNvZGVfYWRkcihtLQo+ID4gPiA+ID4g
PiB0aWxlLT54ZSwKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gPiDCoMKgwqBhCj4gPiA+ID4g
PiBkZHIsCj4gPiA+ID4gPiBwYXRfaW5kZXgsCj4gPiA+ID4gPiAtCj4gPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oAo+ID4gPiA+ID4gwqDCoDAsCj4gPiA+ID4gPiBmYWxzZSwgMCk7Cj4gPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Cj4gPiA+ID4gPiDCoMKgwqBsCj4gPiA+ID4gPiBldmVsCj4gPiA+ID4gPiAsIGZhbHNlLCAwKTsK
PiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGJiLT5jc1tiYi0+bGVuKytdID0KPiA+ID4gPiA+IGxvd2VyXzMyX2JpdHMocHRlKTsKPiA+ID4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJiLT5j
c1tiYi0+bGVuKytdID0KPiA+ID4gPiA+IHVwcGVyXzMyX2JpdHMocHRlKTsKPiA+ID4gPiA+IMKg
Cj4gPiA+ID4gPiBAQCAtMTgyNiw2ICsxODM5LDE5IEBAIHN0YXRpYyB2b2lkCj4gPiA+ID4gPiBi
dWlsZF9wdF91cGRhdGVfYmF0Y2hfc3JhbShzdHJ1Y3QKPiA+ID4gPiA+IHhlX21pZ3JhdGUgKm0s
Cj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiA+ID4gwqB9Cj4gPiA+ID4gPiDCoAo+
ID4gPiA+ID4gK3N0YXRpYyBib29sIHhlX21pZ3JhdGVfdnJhbV91c2VfcGRlKHN0cnVjdCBkcm1f
cGFnZW1hcF9hZGRyCj4gPiA+ID4gPiAqc3JhbV9hZGRyLAo+ID4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqB1MzIgbGFyZ2Vfc2l6ZSA9ICgweDEgPDwgeGVfcHRfc2hpZnQoMSkpOwo+ID4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBpLCBpbmNyID0gbGFyZ2Vfc2l6ZSAvIFBBR0VfU0la
RTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBE
SVZfUk9VTkRfVVAoc2l6ZSwgUEFHRV9TSVpFKTsgaSArPQo+ID4gPiA+ID4gaW5jcikKPiA+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoUEFHRV9TSVpFIDw8IHNyYW1f
YWRkcltpXS5vcmRlciAhPQo+ID4gPiA+ID4gbGFyZ2Vfc2l6ZSkKPiA+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOwo+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHRydWU7Cj4gPiA+ID4gPiAr
fQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gwqBlbnVtIHhlX21pZ3JhdGVfY29weV9kaXIgewo+ID4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoFhFX01JR1JBVEVfQ09QWV9UT19WUkFNLAo+ID4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoFhFX01JR1JBVEVfQ09QWV9UT19TUkFNLAo+ID4gPiA+ID4gQEAgLTE4
NTUsNiArMTg4MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlCj4gPiA+ID4gPiAqeGVfbWln
cmF0ZV92cmFtKHN0cnVjdAo+ID4gPiA+ID4geGVfbWlncmF0ZSAqbSwKPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUEFHRV9TSVpFIDogNDsKPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpbnQgZXJyOwo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxv
bmcgaSwgajsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGJvb2wgdXNlX3BkZSA9IHhlX21pZ3Jh
dGVfdnJhbV91c2VfcGRlKHNyYW1fYWRkciwgbGVuCj4gPiA+ID4gPiArCj4gPiA+ID4gPiBzcmFt
X29mZnNldCk7Cj4gPiA+ID4gPiDCoAo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChkcm1f
V0FSTl9PTigmeGUtPmRybSwgKGxlbiAmIFhFX0NBQ0hFTElORV9NQVNLKQo+ID4gPiA+ID4gfHwK
PiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oChzcmFtX29mZnNldCB8IHZyYW1fYWRkcikgJgo+ID4gPiA+ID4gWEVfQ0FDSEVMSU5FX01BU0sp
KQo+ID4gPiA+ID4gQEAgLTE4NzksNyArMTkwNiw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNl
Cj4gPiA+ID4gPiAqeGVfbWlncmF0ZV92cmFtKHN0cnVjdAo+ID4gPiA+ID4geGVfbWlncmF0ZSAq
bSwKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBzdHJ1Y3QgZHJtX3BhZ2VtYXBfYWRkci4g
RW5zdXJlIHRoaXMgaXMgdGhlIGNhc2UKPiA+ID4gPiA+IGV2ZW4KPiA+ID4gPiA+IHdpdGgKPiA+
ID4gPiA+IGhpZ2hlcgo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIG9yZGVycy4KPiA+ID4g
PiA+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoGZvciAoaSA9
IDA7IGkgPCBucGFnZXM7KSB7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyAh
dXNlX3BkZSAmJiBpIDwgbnBhZ2VzOykgewo+ID4gPiA+IAo+ID4gPiA+IFdoYXQgaWYgdGhlIENQ
VSBwYWdlIHNpemUgaXMgbGFyZ2VyIHRoYW4gMk0/IERvbid0IHdlIHN0aWxsCj4gPiA+ID4gd2Fu
dAo+ID4gPiA+IHRoaXM/Cj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBJJ20gbm90IGhhbmRsaW5nIHRo
aXMgYnV0IEkgYmVsaWV2ZSBDUFUgcGFnZXMgYXJlIGF0IG1vc3QgNjRrIG9uCj4gPiA+IEFSTSwK
PiA+ID4gcG93ZXIsIG9yIGxvbmdzb29uLiBJIGNvdWxkIGFkZCBhbiBhc3NlcnQgSSBzdXBwb3Nl
IHRvIG1ha2Ugc3VyZQo+ID4gPiB0aGlzCj4gPiA+IHVuaGFuZGxlZCBjYXNlIG5ldmVyIG9jY3Vy
cy4KPiA+IAo+ID4gU28gYWNjb3JkaW5nIHRvCj4gPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9h
ZG1pbi1ndWlkZS9tbS9odWdldGxicGFnZS5odG1sCj4gPiB3ZSBjYW4gcG90ZW50aWFsbHkgZ2V0
IDRNLTI1Nk0gcGFnZXMgb24gc29tZSBhcmNoaXRlY3R1cmVzLiBNYXliZQo+ID4gd2UKPiA+IHdh
bnQgdG8gc2F5IHdlIGFyZW4ndCBzdXBwb3J0aW5nIHRoZXNlPyBJbiB3aGljaCBjYXNlLCB5ZWFo
IEkgdGhpbmsKPiA+IGhhdmluZyBhbiBhc3NlcnRpb24gaGVyZSB3b3VsZCBiZSBoZWxwZnVsLiBX
b3VsZCBpdCBiZSBlYXNpZXIganVzdAo+ID4gdG8KPiA+IGFwcGx5IHRoaXMgc2FtZSBjb2RlIGlm
IHNyYW1fYWRkcltpXS5vcmRlciA+ICE9IDJNPwo+ID4gCj4gCj4gSSBvbmx5IGVuYWJsZSB0aGUg
UERFIHBhdGggaWYgb3JkZXIgPT0gMk0uIFNlZSB3aGF0Cj4geGVfbWlncmF0ZV92cmFtX3VzZV9w
ZGUgZG9lcy4KClllYWggeW91J3JlIHJpZ2h0IGFuZCBJIGFncmVlIHdlIHNob3VsZG4ndCBoYXZl
IGFuIGlzc3VlIGhlcmUgYWZ0ZXIgYQpjbG9zZXIgbG9vay4KClJldmlld2VkLWJ5OiBTdHVhcnQg
U3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKVGhhbmtzLApTdHVhcnQKCj4gCj4g
TWF0dAo+IAo+ID4gVGhhbmtzLAo+ID4gU3R1YXJ0Cj4gPiAKPiA+ID4gCj4gPiA+IE1hdHQKPiA+
ID4gCj4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+IFN0dWFydAo+ID4gPiA+IAo+ID4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgb3JkZXIgPSBzcmFtX2Fk
ZHJbaV0ub3JkZXI7Cj4gPiA+ID4gPiDCoAo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBmb3IgKGogPSAxOyBqIDwgTlJfUEFHRVMob3JkZXIpICYmIGkgKyBqIDwKPiA+
ID4gPiA+IG5wYWdlczsKPiA+ID4gPiA+IGorKykKPiA+ID4gPiA+IEBAIC0xODg5LDE2ICsxOTE2
LDI2IEBAIHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlCj4gPiA+ID4gPiAqeGVfbWlncmF0ZV92cmFt
KHN0cnVjdCB4ZV9taWdyYXRlICptLAo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpICs9IE5SX1BBR0VTKG9yZGVyKTsKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9
Cj4gPiA+ID4gPiDCoAo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgYnVpbGRfcHRfdXBkYXRlX2Jh
dGNoX3NyYW0obSwgYmIsIHB0X3Nsb3QgKgo+ID4gPiA+ID4gWEVfUEFHRV9TSVpFLAo+ID4gPiA+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzcmFtX2FkZHIsIGxlbiArCj4gPiA+ID4gPiBzcmFtX29mZnNldCk7Cj4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAodXNlX3BkZSkKPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBidWlsZF9wdF91cGRhdGVfYmF0Y2hfc3JhbShtLCBiYiwgbS0K
PiA+ID4gPiA+ID4gbGFyZ2VfcGFnZV9jb3B5X3BkZXMsCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzcmFtX2FkZHIsIGxlbiArCj4gPiA+ID4gPiBzcmFtX29mZnNldCwgMSk7
Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBlbHNlCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYnVpbGRfcHRfdXBkYXRlX2JhdGNoX3NyYW0obSwgYmIsIHB0X3Nsb3Qg
Kgo+ID4gPiA+ID4gWEVfUEFHRV9TSVpFLAo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3JhbV9hZGRyLCBsZW4gKwo+ID4gPiA+ID4gc3JhbV9vZmZzZXQsIDApOwo+ID4gPiA+
ID4gwqAKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoZGlyID09IFhFX01JR1JBVEVfQ09Q
WV9UT19WUkFNKSB7Cj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Jj
X0wwX29mcyA9IHhlX21pZ3JhdGVfdm1fYWRkcihwdF9zbG90LCAwKSArCj4gPiA+ID4gPiBzcmFt
X29mZnNldDsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAodXNl
X3BkZSkKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgc3JjX0wwX29mcyA9IG0tPmxhcmdlX3BhZ2VfY29weV9vZnMgKwo+ID4gPiA+ID4gc3Jh
bV9vZmZzZXQ7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZWxzZQo+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBz
cmNfTDBfb2ZzID0KPiA+ID4gPiA+IHhlX21pZ3JhdGVfdm1fYWRkcihwdF9zbG90LAo+ID4gPiA+
ID4gMCkgKwo+ID4gPiA+ID4gc3JhbV9vZmZzZXQ7Cj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRzdF9MMF9vZnMgPSB4ZV9taWdyYXRlX3ZyYW1fb2ZzKHhlLAo+ID4g
PiA+ID4gdnJhbV9hZGRyLAo+ID4gPiA+ID4gZmFsc2UpOwo+ID4gPiA+ID4gwqAKPiA+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzcmNfTDBfb2ZzID0geGVfbWlncmF0ZV92cmFtX29mcyh4ZSwKPiA+ID4gPiA+
IHZyYW1fYWRkciwKPiA+ID4gPiA+IGZhbHNlKTsKPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkc3RfTDBfb2ZzID0geGVfbWlncmF0ZV92bV9hZGRyKHB0X3Nsb3QsIDAp
ICsKPiA+ID4gPiA+IHNyYW1fb2Zmc2V0Owo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmICh1c2VfcGRlKQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkc3RfTDBfb2ZzID0gbS0+bGFyZ2VfcGFnZV9jb3B5X29m
cyArCj4gPiA+ID4gPiBzcmFtX29mZnNldDsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBlbHNlCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRzdF9MMF9vZnMgPQo+ID4gPiA+ID4geGVfbWlncmF0ZV92bV9hZGRy
KHB0X3Nsb3QsCj4gPiA+ID4gPiAwKSArCj4gPiA+ID4gPiBzcmFtX29mZnNldDsKPiA+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiA+ID4gPiDCoAo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oGJiLT5jc1tiYi0+bGVuKytdID0gTUlfQkFUQ0hfQlVGRkVSX0VORDsKPiA+ID4gPiAKPiA+IAoK
