Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4BEC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 20:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BC810E8B4;
	Tue, 16 Jul 2024 20:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J24hijCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6510F10E8B4
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 20:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721162366; x=1752698366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h6QnR21kDdbzPQPrq5PjDwnFvGEb7bI/ccjCzfIyaxA=;
 b=J24hijCLNXYuCo6bCIUe+9ojzYB4xWfIeMQM0D1Mros3h/N1lK8BtQAs
 NsC4mNt4c/FRPQpq1Q9eqwhJOyfGP+txLW5Q+jF3aW5cmEu9/dfLHwndJ
 71Tb++sk30x+XyoCwr9j46Ikw8XeE/F1ss1+hN+FnJ147WpLPp0v0gSMD
 ddlQ3gTbrm30oTmKheN4VDHGmB6K8/KFwbnG4olLe0vQH3H5P328iUWaQ
 iANMDeYrgN62rHtunJA8542cFD+P8kDqT0ZOI0A1xQHvFNnDSC2jGa2iw
 HfQay6ic+MkXfIrUk6A6135EazfbfWZZhs/4d/ky+eTuz5poxSlXeTen5 Q==;
X-CSE-ConnectionGUID: a+3vpVeyQX2h4zkDdi7hGg==
X-CSE-MsgGUID: yEiL52BYT1WOb8iWjNI6jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18826759"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="18826759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 13:39:26 -0700
X-CSE-ConnectionGUID: EwO8CH81Rc2eCfhyN8J/Nw==
X-CSE-MsgGUID: eyk8UzuYQIKYDbhBuaFPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="80796548"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 13:39:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 13:39:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 13:39:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 13:39:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+jDLexJyVuT2KOhGY6slh9tMXVSbon9RSeeOYJe9O5bRiLy+U7DFs+Du2I73SaphSerphM1XWfE6nvuyrxHZ8esimF4vuHHp9kr9Y1Ae42BEaTRWjwxvW4p4GODFyzBSDxTIyXq6nUkwkw3fjJIdONkFSl2Z6gQA7G/wJMPqClC5JN+wZoh/ZDm13grE1Xi7MR5eG0K0ZsbZqq6JePQe5bjTmDm+PWDwbk1z3CPWFp22XwcFaEpyL+P6p+XO0C9IQ3z8ptV9Rz5MyMcxy1WVd9uvSfY3S0ufHGD+rj3rjcsRnyWmXr06Z+H6zD107tdkteygf5fZyt7WV/Wron/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6QnR21kDdbzPQPrq5PjDwnFvGEb7bI/ccjCzfIyaxA=;
 b=q4JrkbTjB0Lxn1vQREBwW+9WgYjjKBd4bNVhomS+mxcKR30gLSiGD8ctkxWEuH+OCac3/tC1M72KiZxfEklg8khNIOuyZrfIBy9jcoyIJPJqcXmAjalBje9aR69V1TkiDnY4zThZBRmGeiEty+G7BheJqMRyTayw2Wew9VH9AuMNd9BWc4fIecPIs7N3UYzBLFoxyVifN8zdKfqVOr+x+v2ZuX7xXja5Clah2MoqVOR+G2rESYn5m8C3BX0lGTO/wNfBgDKwqyvLbdRECqwFWyQuAGbPkIBSxu/fCe2utALiJWWyK9Tgjc8bD689PVLmsuimLpEN8YFfNklZPZHF1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Tue, 16 Jul
 2024 20:39:22 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7784.013; Tue, 16 Jul 2024
 20:39:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 00/14] Add PXP HWDRM support
Thread-Topic: [RFC 00/14] Add PXP HWDRM support
Thread-Index: AQHa1KKSDaKpd93LLkKz+3TLdv65rrH51zGA
Date: Tue, 16 Jul 2024 20:39:22 +0000
Message-ID: <4b87b0022d0c916160e0fc81f92ebc065dd96b7f.camel@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB7700:EE_
x-ms-office365-filtering-correlation-id: 8e8410ab-cd38-4828-0f9d-08dca5d75ffb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NjJmYWxEeTdPSXkrZ3p0SDhVTDYrZWtVSzJQbWhpaWF1S2NhTEZ4MnN5NUZm?=
 =?utf-8?B?RzJoeGE0bmlWZjhFM25LSzBPa1B3eXBid2g3TmVQMXlMZ3dCbUxuOC91elRr?=
 =?utf-8?B?YVR3TEs0c2hxd2xWcXVqcGdVckROOUFDRDgva3Z1VER6dkh5dVBjTGlGUFhi?=
 =?utf-8?B?dkgwUFlqN0tTR284S0xqcGdXc3NZQ1ZPSWk5WlB1K2h1OXBodWYwdkJtVGdj?=
 =?utf-8?B?SmxqcXBkR2xxbDVsVXBzZ1hqWkZiQ21aK0VWRDdqNDZzaHIrQmowdDdSTVZt?=
 =?utf-8?B?Wi8wa3pGK2lCZ0ZYa3lFRFBoOEVHbytLUUJqTkg0QkVOSFhOQWNYNVgzM255?=
 =?utf-8?B?SEt6Q3FkVjgzcUxKODYzQVJpZy8rTDRoWDEzbVJ2YTYzeG5GN3hQOVpEMkdT?=
 =?utf-8?B?UG9kdTVOME9rVmxWL0NCY1VhN245VW13d0dlckF2bUMzeWRrNDJzYXRxaVBP?=
 =?utf-8?B?bXFrbmRwdlQ3Q0xuRmJQM0lIczdGN3pPWW51eExLZFpuQ0xuR0hqQVlhT1pq?=
 =?utf-8?B?Ry80aDl0NzZWVklkeXJyQWpONkpEYmZSTXBwbTNyTlN5MTBqNFJvc1BkalBq?=
 =?utf-8?B?SFRhcHNtTDZJN3ZPNUlKRGJHanY0V1VyWEM3d0Z0WlYrNWo5cmp5di9pK3Nr?=
 =?utf-8?B?UGtES1kycFVtT3Z0VFJ1Z2tLVXJuMkpqQTFjc2I1eDEwRlVHRjlxSlBUVEJF?=
 =?utf-8?B?c2FNcERyakJKQjg4QXBwLytTSExzUU40MFpORUdrak5vQ2R5NzJUYnRJdHpp?=
 =?utf-8?B?Mk1ib2V0UVRnSUhudWZUREs4WS9wdk9iQnAvQVNvMWszN0JKeWs0TzVwSU5a?=
 =?utf-8?B?K083dUJscHI0Wkx5dVd1YkJNY0xXWVBMZ1B3V0k5TWhQVjVLU2J5Z1M2WHZr?=
 =?utf-8?B?WVg3dmNHczhNektLZ2IzNUQvOFFCQ2haclRScG1vVUhiVkdJSDFXcXNlb0Vl?=
 =?utf-8?B?ZkE1dkpJbExLR24ySE5XOXExUWxqYmpQaUMxZDRtNzJ6MFFMb0J3b0RVYTE5?=
 =?utf-8?B?RXdZYkg4eisvdGZvMU5XL3hyR1E1WU1ZVnZBQ3Z5WG1yZ2hBNjI3N016MjlM?=
 =?utf-8?B?MUdoYm15QkJsZjRTNFlBUnkxN2JGNE9kZ0FITmpLbkVucnpyWFlkaGx0QmI3?=
 =?utf-8?B?SEFDaVNoRWpGLzFSRUlXRllBcXZmNC9LNkxZVi8waEw1WWFua1R2andZeTV0?=
 =?utf-8?B?d0NMWktWZDJTa2Ryd2RTYXc5ckVXRTFMdVFTc2lXbzJSZUt4cUx6NTZSNUJR?=
 =?utf-8?B?TmZwRG5ZRSt1dXcwdTRuTXNuc0JkUlIxclV1TVd6bHJHNC9xd09QK2xDNGhy?=
 =?utf-8?B?Y1AxSzhiNW9oc1I4SVVCd3RiSm95QW1TVjJ5N1FEc3ZIeDF6ZFV5R1NxazV0?=
 =?utf-8?B?U0I0WUhJKzBua0dvdmp3TTlDSUZFQ0RWREoyck80SFYyL0xieUpLQml6b0tW?=
 =?utf-8?B?bjN6VXhnV2pSRE9rbXBnZU9Ib0NkNklhZVZodkxKYkM3ZmYzSkl3UlRSdmpY?=
 =?utf-8?B?K3V0S1R0ZmRjdmVGQlpOWHFqVDZjeHdKYWl4MWs1WUtndytaRUgvVGJpRXFY?=
 =?utf-8?B?SFIxRlVZSWw5RWFtd0hBUWJFYWdJbXR5SXpYWnZVNU9KV29TS1RSRjI4WW9j?=
 =?utf-8?B?MGZPSFBmUm1ucHg0NGJzbEMwYUdxT09zQUU5T1dRNHg0c1FYM3NKU21iSk0v?=
 =?utf-8?B?S1kwR3R4LzdsMHl1NDFZTitGTjgxbCtNdDYzQ0tudjdzTndVTXBsOWxpN1Bi?=
 =?utf-8?B?cGZSNE4vYThPdUg5MklGTFZCcnhVUjhwM1RCN2M0ZXZMYlVLaDBJdmVuVEMw?=
 =?utf-8?B?MENaTitkYUpIaEV2YTlHR3dIOG45dnpLTU1lMW1hekZSWlVZK3lxRjA0eXRq?=
 =?utf-8?B?cG5TRTA5Z3JiZmxxdThJaGFRWURkc2FYV3RWNElIdHE5VUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnAwOCtXa0VxZkNNanJhWkVuTURycnhzUW4vSmRjRXV4T0FrdFlFd2xSZUJV?=
 =?utf-8?B?ekdjai9VQXAvNXVWd3l6NUVERGRJYlRJRHNhQUNIOE1LTnl5SXdzOFphQXZk?=
 =?utf-8?B?RWRDdWhvYk5QUUxHQUtRazJYdXlZWFpJdVZIU21nR3BhcTBmbkJyc3FHRUhL?=
 =?utf-8?B?YVEwTTA2MmFUMG52bXI3Q1YyTHFYMCttc3loYk5NVkVZQlljZXlueTZwMUsv?=
 =?utf-8?B?MU9mcTZQazN2QzlOb0pRWUxOK1VLYnJBMkVIN1hicXVkZ1A5WjEyQ05FOERo?=
 =?utf-8?B?SUo5NzlBYXFwdERUNmNuVHFxY0FtZ3FSNTFWWC9qY1FBeXd4K2QvMDE0bmx3?=
 =?utf-8?B?SnlGa3hUN3BSZzhFY3pEcmMzZkFSOGM1a0hLc3VGVTdEQmZLZTJJLzZFUE54?=
 =?utf-8?B?ZEVUVWxiMnNwTDhVdVllUENOOGZFUHlxUWZSRmdSbVV2Sm5oNHFjS0FHOUQr?=
 =?utf-8?B?ZiszdVdIM0pBdmNaeUd1KyswRjhVeGZHSWpjZUFyZnN6VERNRTk1SERUVHh5?=
 =?utf-8?B?amNpQnJGVjBVNm9DMWd1a0FYRGtLdUgrbGtXQVE4TTZncEVlWWFiR3ZhY1NK?=
 =?utf-8?B?TWxPY1hJQzhsTlhGSDAzU0JzM2ZaTEwzbEpZMXpMK3BIQ0oxYlVWZGJUS0tk?=
 =?utf-8?B?UWJiOFF6ZzRpak9xNUhHU1NRcmEvZGpNZU8yTVJQUVVQY2FCTTI1ZDRSTVkv?=
 =?utf-8?B?V2Q5UXZuOFJ1RkF4bk8vd2R1V0puZUc0Ym1sVTNRSS9JRWRVdmZtVHlSQkMy?=
 =?utf-8?B?UzgzbkVzNXEwQkFKWjdUb2VBYTA2M09CWnVscnl1cUNGUUMzMU42NmJicnJV?=
 =?utf-8?B?eTVCVEJTRmlyWDVoUm1tekhVd3lqaVZ3T2cvc1A1OFhvWDlDT3FqUm1hUGVx?=
 =?utf-8?B?bWhGSHgvQlY0WE9xa051NEg2UUM3RnN0WlVoUzhQYVV1d3BsVW9XZTFydy91?=
 =?utf-8?B?K3RJQ1dLVUJZQ3I5Vi9HQ2ZVZzk0SnJmZVlzZnZXdDBoVWdCVFdtZmRWVTl3?=
 =?utf-8?B?VFpsS2RUbm91WkNLSWJvRVR6Zjl4NnFTcy9QOFlkMEhkOVBQeWpmUWRLTUlF?=
 =?utf-8?B?QkdZdTN4RnRoaXFVTHQvRURsS2ZnVU53bURVWkU3SUZ3Q3NYRFJVN3phYzhG?=
 =?utf-8?B?RmcrLzMyeEU0T3NNd2lKdTlhU2pSbnR1Q3hIUFBzdmU1Y2NhMENLcU03Q0hS?=
 =?utf-8?B?RUZQS3VUb3pKUWtSZ2pTL3VyTVR6T1N1ZFh3NzMvNHd0MkxoVFZlRlBGL0JG?=
 =?utf-8?B?cnZZMEdUbEk3WlJLdGd1WjFPbjN3bW1yUGs2RWJCVVp5L2l6a2RzNHA1bklE?=
 =?utf-8?B?eTBHcHJMWnQxcnZ6a1VwM0V1MHBLZ3F2Tzk3NThybXp3UEF5UWFNUkdCQVRs?=
 =?utf-8?B?VzhQMmgvZEVlcjZsM2JoQk5HbFAreWY1amd3QnhYUlhZUlpaRnk0eWJWYkt1?=
 =?utf-8?B?L0E1RnIzTjFkMXNLWW00bWh0eUFMZU1sSEVua3oySHFtMWYxUkJjR1Q4bFR6?=
 =?utf-8?B?bDlDR1phY0tyMlE1WFk4N20zQXN6OXNTSmN5a0hFZEhTM0hXNzloUHFqczla?=
 =?utf-8?B?MG5BaEh6akdSUFlnVEpFdzMzSWdrL2V6cDR3bUM4VTdaU2txRWdGQ2JxREc3?=
 =?utf-8?B?UW1sbGxaSndoSFhma3RQUlVDZ1EzbmVGMWhrb3Y5WHkwcVBQdFlBRWRFM0lh?=
 =?utf-8?B?N3lvb1JndTVKaHZjR0FwZDhEbFdoWlVkRGtvUGxZVTQ5eTI5Zm8vTHM1M2Iv?=
 =?utf-8?B?SWtIQVJkcDNFOWRHWXh5eVhCR1BrVkZaSW9rN1lFVkgwd1VzTVNiMVB2eU5q?=
 =?utf-8?B?eHBIS2xUeHNUMzhSWDN5a1dZZ2tNZ2ZmSTRJMHlRYnZWZFl4OUJLZWoyQnRM?=
 =?utf-8?B?VDlTYUpTbFRwbEJGQWdGWGFyNVZqMG9yNURhYys0cWg3cWRCZUFoVi9CNkpX?=
 =?utf-8?B?aUFRMkcxUDZLenVRRkxHTnBKRitCVlpCWkhiWGJRNFJNMzJ6bnQwNnFWM3Ir?=
 =?utf-8?B?Qm84NFc0elgzR0x1aVhXZm1nSFlYS1RFanMwdm56L2ZaWlNMbjJESk5GSFpT?=
 =?utf-8?B?WjJVbFZ3OWlyQzRPQ0dTOWlIbmVQQ00zOEd1bXMweXk5V2s3RUd6ZWNDRGZh?=
 =?utf-8?B?UUQ4TTIzUXhvditiMWlXY1puUTFjeTlobTBhN05zUkx2Z0lzbGtiUzlXckpI?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <694C2B3A8DE55C42A14AC8E8CEBA0BB7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8410ab-cd38-4828-0f9d-08dca5d75ffb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 20:39:22.6085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: duIqbda8POdnrxMn9pLlVNkNb51sgJX9i8U9erSnnlRvtoje7F42Gf1unjDaE9RfC8EM6T4ruyBgxoQfRTEb/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
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

T24gRnJpLCAyMDI0LTA3LTEyIGF0IDE0OjI4IC0wNzAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBQWFAgKFByb3RlY3RlZCBYZSBQYXRoKSBhbGxvd3MgZXhlY3V0aW9uIGFuZCBm
bGlwIHRvIGRpc3BsYXkgb2YgcHJvdGVjdGVkDQo+IChpLmUuIGVuY3J5cHRlZCkgb2JqZWN0cy4g
VGhlIEhXIHN1cHBvcnRzIG11bHRpcGxlIHR5cGVzIG9mIFBYUCwgYnV0DQo+IHRoaXMgc2VyaWVz
IG9ubHkgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBQWFAgSFdEUk0sIHdoaWNoIGlzIG1haW5seQ0K
PiB0YXJnZXRlZCBhdCBlbmNyeXB0aW5nIGRhdGEgdGhhdCBpcyBnb2luZyB0byBiZSBkaXNwbGF5
ZWQuDQo+IA0KPiBFdmVuIHRob3VnaCB3ZSBvbmx5IHBsYW4gdG8gc3VwcG9ydCAxIHR5cGUgb2Yg
UFhQIGZvciBub3csIHRoZSBpbnRlcmZhY2UNCj4gaGFzIGJlZW4gZGVzaWduZWQgdG8gYWxsb3cg
c3VwcG9ydCBmb3Igb3RoZXIgUFhQIHR5cGVzIHRvIGJlIGFkZGVkIGF0IGENCj4gbGF0ZXIgcG9p
bnQgaW4gdGltZS4NCj4gDQo+IEEgdXNlciBpcyBleHBlY3RlZCB0byBtYXJrIGJvdGggQk8gYW5k
IGV4ZWNfcXVldWVzIGFzIHVzaW5nIFBYUCBhbmQgdGhlDQo+IGRyaXZlciB3aWxsIG1ha2Ugc3Vy
ZSB0aGF0IFBYUCBpcyBydW5uaW5nIGFuZCB0aGF0IHRoZSBlbmNyeXB0aW9uIGlzDQo+IHZhbGlk
IGFuZCB0aGF0IG5vIGV4ZWN1dGlvbiBoYXBwZW5zIHdpdGggYW4gb3V0ZGF0ZWQgZW5jcnlwdGlv
bi4NCj4gDQo+IFJGQzogVGhlIHNlcmllcyBpcyBpbiBhIGRlY2VudCBzdGF0ZSBhbmQgYWxsIG15
IGxvY2FsIHRlc3RzIGFyZSB3b3JraW5nDQo+IG9uIE1UTCwgYnV0IEknbSBzZWVpbmcgZmFpbHVy
ZXMgb24gTE5MOyB0aG9zZSBhcmUgY3VycmVudGx5IHRyZW5kaW5nIHRvDQo+IGJlaW5nIGlzc3Vl
cyB3aXRoIHRoZSBjb250ZW50cyBvZiB0aGUgdGVzdCBiYXRjaCwgYnV0IEkgZGlkbid0IHdhbnQg
dG8NCj4gaG9sZCB0aGUgc2VyaWVzIGJhY2sgdW50aWwgSSB3YXMgc3VyZSBvZiB0aGF0IGJlY2F1
c2UgdGhlcmUgYXJlIGEgY291cGxlDQo+IG9mIGNob2ljZXMgSSBtYWRlIHdoZXJlIEknZCBsaWtl
IGZlZWRiYWNrLCBzbyBzZW5kaW5nIGl0IGFzIGEgUkZDIHNvIEkNCj4gY2FuIGdldCB0aGF0IGZl
ZWRiYWNrIHdoaWxlIEkgY29tcGxldGUgdGhlIGRlYnVnLiBUaGUgMiBhcmVhcyBpbiB3aGljaA0K
PiBJJ2QgbGlrZSBmZWVkYmFjayBhcmU6DQo+IA0KPiAxKSBWTS9CTyBjaGFuZ2VzOg0KPiAgICAg
LSBQWFAgcmVxdWlyZXMgUFBHVFQgc3VibWlzc2lvbnMgZnJvbSBpbnNpZGUgdGhlIGRyaXZlciwg
d2hpY2ggaXNuJ3QNCj4gICAgICAgY3VycmVudGx5IHN1cHBvcnRlZC4gSSd2ZSBob29rZWQgaXQg
dXAgKHBhdGNoIDMpLCBidXQgSSdkIGxpa2UgYW4NCj4gICAgICAgZXhwZXJ0IGV5ZSB0byBjb25m
aXJtIEkgZGlkbid0IGRvIGFueXRoaW5nIHN0dXBpZC4NCj4gICAgIC0gV2UgbmVlZCB0byByZWpl
Y3Qgc3VibWlzc2lvbnMgdXNpbmcgVk1zIHdpdGggbWFwcGVkIGludmFsaWQgQk9zLg0KPiAgICAg
ICBJJ3ZlIGRvbmUgdGhpcyBieSBjaGVja2luZyBhbGwgbWFwcGVkIEJPcyBmb3IgUFhQIHN1Ym1p
c3Npb25zDQo+ICAgICAgIChwYXRjaCAxMSksIGJ1dCBJJ20gb3BlbiB0byBpZGVhcyBvbiBob3cg
dG8gZG8gdGhpcyBkaWZmZXJlbnRseS4NCj4gDQo+IDIpIEFQSTogYXMgbWVudGlvbmVkIGFib3Zl
LCBJJ3ZlIGtlcHQgdGhpcyBmbGV4aWJsZS4gSnVzdCB3YW50ZWQgdG8NCj4gICAgY29uZmlybSBu
byBvbmUgaGFkIGFueXRoaW5nIGFnYWluc3QgdGhlIGFwcHJvYWNoLiBTZWUgcGF0Y2hlcyA5LTEx
LiANCg0KT3RoZXIgdGhlbiB0aGUgY29tbWVudCBpbiBwYXRjaCAxMCB1QVBJIGxvb2tzIGdvb2Qu
DQoNCj4gDQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCj4gQ2M6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29t
Pg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IENjOiBU
aG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IA0K
PiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvICgxNCk6DQo+ICAgZHJtL3hlOiBNYWtlIGV4ZWNfcXVl
dWVfa2lsbCBzYWZlIHRvIGNhbGwgdHdpY2UNCj4gICBkcm0veGUvcHhwOiBJbml0aWFsaXplIFBY
UCBzdHJ1Y3R1cmUgYW5kIEtDUiByZWcNCj4gICBkcm0veGUvcHhwOiBBbGxvY2F0ZSBQWFAgZXhl
Y3V0aW9uIHJlc291cmNlcw0KPiAgIGRybS94ZS9weHA6IEFkZCBWQ1MgaW5saW5lIHRlcm1pbmF0
aW9uIHN1cHBvcnQNCj4gICBkcm0veGUvcHhwOiBBZGQgR1NDIHNlc3Npb24gaW52YWxpZGF0aW9u
IHN1cHBvcnQNCj4gICBkcm0veGUvcHhwOiBIYW5kbGUgdGhlIFBYUCB0ZXJtaW5hdGlvbiBpbnRl
cnJ1cHQNCj4gICBkcm0veGUvcHhwOiBBZGQgR1NDIHNlc3Npb24gaW5pdGlhbGl6YXRpb24gc3Vw
cG9ydA0KPiAgIGRybS94ZS9weHA6IEFkZCBob29rcyB0byBtYXJrIGFuIGV4ZWMgcXVldWUgYXMg
dXNpbmcgUFhQDQo+ICAgZHJtL3hlL3B4cDogQWRkIEFQSSB0byBtYXJrIGEgcXVldWUgYXMgdXNp
bmcgUFhQDQo+ICAgZHJtL3hlL3B4cDogYWRkIGEgcXVlcnkgZm9yIFBYUCBzdGF0dXMNCj4gICBk
cm0veGUvcHhwOiBBZGQgQVBJIHRvIG1hcmsgYSBCTyBhcyB1c2luZyBQWFANCj4gICBkcm0veGUv
cHhwOiBhZGQgUFhQIFBNIHN1cHBvcnQNCj4gICBkcm0veGUvcHhwOiBBZGQgUFhQIGRlYnVnZnMg
c3VwcG9ydA0KPiAgIGRybS94ZS9weHA6IEVuYWJsZSBQWFAgZm9yIE1UTA0KPiANCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMyArDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUvYWJpL2dzY19weHBfY29tbWFuZHNfYWJpLmggfCAgNDAgKw0KPiAgLi4u
L3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvcHhwL2ludGVsX3B4cC5oICAgIHwgIDE0ICstDQo+ICAu
Li4vZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfaW5zdHJfZGVmcy5oICAgfCAgIDEgKw0KPiAg
Li4uL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21meF9jb21tYW5kcy5oIHwgIDI5ICsNCj4g
IC4uLi9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5oICB8ICAgNSArDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oICAgICAgfCAgIDEgKw0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oICAgICAgICAgIHwgICA4ICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX3B4cF9yZWdzLmggICAgICAgICB8ICAyMyAr
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyAgICAgICAgICAgICAgICAgICAgfCAxMDAg
KystDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaCAgICAgICAgICAgICAgICAgICAgfCAg
IDUgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvX3R5cGVzLmggICAgICAgICAgICAgIHwg
ICAzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMgICAgICAgICAgICAgICB8
ICAgMyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICAgICAgICAgICAg
fCAgIDYgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oICAgICAgICAg
IHwgICA4ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jICAgICAgICAgICAgICAg
ICAgfCAgIDYgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYyAgICAgICAg
ICAgIHwgIDQ4ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5oICAgICAg
ICAgICAgfCAgIDUgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMu
aCAgICAgIHwgICA3ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgICAg
ICAgICAgICB8ICAgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jICAgICAgICAg
ICAgICAgICAgIHwgIDIwICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMgICAgICAg
ICAgICAgICAgICAgfCAgMTQgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaCAgICAg
ICAgICAgICAgICAgICB8ICAgNyArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jICAg
ICAgICAgICAgICAgICAgIHwgICAzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jICAg
ICAgICAgICAgICAgICAgICB8ICA0MiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cC5j
ICAgICAgICAgICAgICAgICAgIHwgNzEzICsrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3B4cC5oICAgICAgICAgICAgICAgICAgIHwgIDMyICsNCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9weHBfZGVidWdmcy5jICAgICAgICAgICB8IDEyMCArKysNCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9weHBfZGVidWdmcy5oICAgICAgICAgICB8ICAxMyArDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcHhwX3N1Ym1pdC5jICAgICAgICAgICAgfCA1NDkgKysrKysrKysr
KysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHBfc3VibWl0LmggICAgICAgICAgICB8
ICAyMCArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwX3R5cGVzLmggICAgICAgICAgICAg
fCAxMDMgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyAgICAgICAgICAgICAg
ICAgfCAgMzMgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgICAgICAgICAg
ICAgIHwgICA0ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICAgICAgICAg
ICAgICAgfCAxNDggKysrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmggICAgICAgICAg
ICAgICAgICAgIHwgICA4ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV90eXBlcy5oICAg
ICAgICAgICAgICB8ICAgMSArDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAgICAg
ICAgICAgICAgICAgfCAgODMgKy0NCj4gIDM4IGZpbGVzIGNoYW5nZWQsIDIxOTAgaW5zZXJ0aW9u
cygrKSwgNDAgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3hlL2luc3RydWN0aW9ucy94ZV9tZnhfY29tbWFuZHMuaA0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX3B4cF9yZWdzLmgNCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcHhwX2RlYnVnZnMuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9weHBfZGVidWdmcy5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cF9zdWJtaXQuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHBfc3VibWl0LmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwX3R5cGVzLmgNCj4gDQoNCg==
