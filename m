Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543F8C677C4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 14:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C22A10E687;
	Wed, 11 Jun 2025 14:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKX+FxMA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095F010E669
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749652281; x=1781188281;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nNbjCOiunN7lUaly/tLcInfqx1alsmqZuasXm5wqheI=;
 b=DKX+FxMAHTeNG4pMNBx6ViqembYDfpgnCD+EIeM3GXdHI4XQzUgZ7yPp
 cBmkqQ6zoXlM0DuM6pLLtj7fyqU2NBUvVVAouHS+mdGHpg4MDFw5EHm6c
 tdlp/Dfk+8KmRK/WslgSuItYt1eYXviuv0+2dwK7/dYvj6ehbstO/PE4s
 f7KvkzNT5Vz3ZcAFa0q9nVdwoO/nQXqZhGP6IQ2UCFt5kdHuYunSVsC9L
 +2x9ZSO5XB9YarcNsj354vref/+2i/FOqtOD5MAHFGILDSorQk6XDsYKP
 5tqOMMx997XkmFaGJ7MCJDhIEIMuMEf9XgBiRip3Bf/vtpyajqY1t5Juo Q==;
X-CSE-ConnectionGUID: FUTSeeNmS/OximmH3EuoEg==
X-CSE-MsgGUID: AA35zXQCRTq7gyab8A5Wtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62409080"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="62409080"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 07:31:20 -0700
X-CSE-ConnectionGUID: iNc4rzzSRomjvSnJ434QYQ==
X-CSE-MsgGUID: ZKnf1p/fQzCSo4eKLSs64g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="147094980"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 07:31:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 07:31:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 07:31:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 07:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS0ir3ySTuzDQRN1/+R2/RYEtRkrQ52zLUHEXExVN7JCuTyo2+1SwqyXRT9Ti1VMdf9GAaZw9FQASvt/dysSrzwg1PQIBwGeeBExFjoqpUggpnvr0L8+dLXZxlXTmz4jwEqKG1d4FI4iOKuhRd8Pnnb279yhmhZ2TDsQQGblkvL2hFpuhnZVKAqKC22HQb7hXu+pzbd0MUduGIKmIhSK01g8LkHwhignaTJbRIyoXvbF9+T2BaiDcsBnntFQ0Hjx7w7N0ef4kSSnTdTO1+fssRjhS4CBS4WF/b+kRCQQMZfmJYmVjUNpMs16yr02X1qHVoraXqNsCFfcL4jeOiH/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNbjCOiunN7lUaly/tLcInfqx1alsmqZuasXm5wqheI=;
 b=Ssu2iNHncts4EecKhEcA0uiPh9VaXdyM4z5jksv9vE8vp5ta2MjE0OU7ei9mfi54c2/ztQ32TcgH8/2JN+gZdnYp/qZ6uL/d2oxMgxwwkiLrPeiU5T7vcFcUzCVMV3oHY+4irg0E5gSMIg+kzJoHrGpK+Coz3HJb9wGUHhG1fdZP5Szm7uzHrzrVXCC5KHnBG8DJj3OMMI7tHMeIwS6OF/zjB5s8B+RjE9eKZHW67/JwcjTl0/sGODVIDuWP29VrNJ6YzLDqf3Y09f6mmD+u9CU3Utnt21nOC3j8uWAu72Pr7GnSVu3AcIRjjz2aHeW/rDxP+6D+bDrJWOmMnN8oaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by DM6PR11MB4627.namprd11.prod.outlook.com (2603:10b6:5:2a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 11 Jun
 2025 14:31:11 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb%6]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 14:31:11 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/9] drm/xe/xe3: Add support for graphics IP version 30.03
Thread-Topic: [PATCH 2/9] drm/xe/xe3: Add support for graphics IP version 30.03
Thread-Index: AQHb1xxfa9Kn4stWjEuazpkxis4nqrP6ag2AgAAWxZA=
Date: Wed, 11 Jun 2025 14:31:11 +0000
Message-ID: <IA1PR11MB62664CCCD3CC85B0DEE17306E275A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-3-dnyaneshwar.bhadane@intel.com>
 <aEaGeVzvD0MwXW81@bvivekan-mob1>
In-Reply-To: <aEaGeVzvD0MwXW81@bvivekan-mob1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|DM6PR11MB4627:EE_
x-ms-office365-filtering-correlation-id: 7cc8c5b4-f800-475d-41f3-08dda8f49ce1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d2ZVWURub1poYUttQ0RVcUNkVnFOV2NmbjZTenBZd2NCZEFrdW9hUUhQTnZH?=
 =?utf-8?B?eHJub1NPL2dYcExYckNZWnJYNkpDdGxkRGhQanpCN1RXTFF3TUI2YmhzRUhC?=
 =?utf-8?B?K2h0ZXlFZXZIdDRMbmplbng4ZFloZzVzQUlaREROT2RsUldGOXRtcW9ESm1y?=
 =?utf-8?B?TUpaeHRBTkFlNWhLc2VYbFlGK3EzZEJwK1pOWWM0OGFibWplSWV2eEI5L2FN?=
 =?utf-8?B?M08rMVRQZ3YxK0gwRmJrbFlXajlCZnVQVXRTbTB6WnM3TDl0SHhYQjFVU256?=
 =?utf-8?B?dXVYTGh5MHZhdmJuVkhuTTl3c0lZUHFDMS9pZEExQjJ6VldMVjdCUUdLR1JU?=
 =?utf-8?B?TXgzWEFrRGkxNDhqRnBjVXE3aDRsOUlCSTg1UXRUK1g0amJWV1NCMDZ5MEpn?=
 =?utf-8?B?ZkpNZ3c4NWpHdEtHWTY3Qk9NWGlkQ0RiMDNiaXVCVS9lSHViVm1nZlBqWUdp?=
 =?utf-8?B?SVRKVlpyK1lrb3VBQjczUklxbG1zWDIrMWltLys0MmE5WURhS0xIWGNkWHY5?=
 =?utf-8?B?cmJRUWpZVmE0b3Q1MG5yS09kZlgyZ2RDdndpZ1RZbFBGQVVkSVF4SGlEWWZy?=
 =?utf-8?B?Ym9Dc1kxYW9BeUVrSFpuTEMrZmNsTUFsWWNORm9OR2grUzRiV2FEOXV4Q3Rl?=
 =?utf-8?B?Z0xrRTNQMk5GSERudWc4V2FoTk9tVVNmcVFWMXJKVFA5Z25wcjZiU2dkVzRo?=
 =?utf-8?B?VWEreTFTTzIyczhSZXc2cmoxSHhvZnJSVGwweUpQZ2J6cnN5QlJ0cEp4eDZH?=
 =?utf-8?B?WEFhVmdNc0tQNzZkd3pqVHJ0eUhnb3hDOWt1OGZFbUdWallTSHRBT0tpQmpV?=
 =?utf-8?B?d1VCdDFVZW9TbzRJODE0blZKbHVMWDhDMEtCRmdHUmR1cWVDaCsxbEFnRHR0?=
 =?utf-8?B?VXA5dlgwTnVOc05rYU01OHR2WC9CMHNqWis1U1FnWUJvZkJhdER6Z1VEckJw?=
 =?utf-8?B?RE5RNS9NWEpIOEJ5alRBdDZ3RW5QZUY1MzduVnNIbUtBR25VajVwYVJNYldJ?=
 =?utf-8?B?WkVWamVlQ0FvUkhxb0tHcDNTb2NYK0ZWV2wxYk9zK1B2ck5sRVlCeERGKzdJ?=
 =?utf-8?B?cEVwR3FBTkdUTFlmaEcrVkNraldJRVorSnFKUnRCR3psb1FlbGowVkhJUU9q?=
 =?utf-8?B?Y2xpL2J4MDN1dy9MVXBacHc0bUV1eURDdVJ6YjI4Ny9vRy9xSUhQYzZ2c1Ar?=
 =?utf-8?B?Q1BMa1FZNHgwRDRxSWxJRzFmNXlMQURVT3JNd2lNR3ZLR1ZIUE04Ty9iR3dQ?=
 =?utf-8?B?d29kcTd0SXAybmhtVkxHUWdpaDdoc1ovMHJrZkNCRkpXNHJ0bGpGelVaV2ZQ?=
 =?utf-8?B?NW8rYW05VjFCd3dpU2pabWx1UHl2SFoxMXJwREFCcTY4dERWazRCb3dha1dY?=
 =?utf-8?B?SnpxRzFyT3BZRTVyOXNBMjh2bmRBOTJPVFZldWtlOGY3TXhlYTJBcUx0Z0lZ?=
 =?utf-8?B?NFNweTFkVHhLVzEzSGZhY2RURDV6QVA2VVd6ZkF2aE9hejg2UFV5bE9XR0VI?=
 =?utf-8?B?dlJ5Zy9LR1RJcGRUSGZnNHMzbUtUR003WmF3RmJBRzJGWlhZRE9XTnlXaENh?=
 =?utf-8?B?Z3BHQTNmZlh5d3VRVjVXWDFGcTlRM3Q3KzljWGZkeUR5a3BhSldlV0d0NEZD?=
 =?utf-8?B?cjJyQjNaT29UU0h6Tno0TW1YRUU3SE1YV3lqMWVhK3RmcTdaRm1Md2J5cWpr?=
 =?utf-8?B?N3l4cGNudVI3Tk8zdG4rTUc2dS9OLys0QUNBSVgxNy9PekY1eU1ra2NUZkJv?=
 =?utf-8?B?eHRBSytUd1l6aTV5R1dpSDlHelpCTlM0NXREcTZacnFONTZITlJJbkx1NW1n?=
 =?utf-8?B?T2RSMDczY0tsRDRIemQ0aEdsSGg1WjhJVlFicHhjTCtYSXFmUnZKODNGSkZj?=
 =?utf-8?B?bGVJcnBMU0RRdTFNSmFWZzJxczlhN2hLcGFPZFFFbEF0YmJHeFVpRDJCTzJr?=
 =?utf-8?B?b0dBUHRhcm00VE1JamluSk9DYzhIazR6ZTVIMlJ6R3NpSWYzalVUT1ptbXJV?=
 =?utf-8?B?RmRtemhpYzl3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGhVRGFWbGQ0b1lZUjM2ZEUvbXhFbTZIQkE5TkF4bUF5YkV5b2N6a05xSURz?=
 =?utf-8?B?dHkwOUx1cFh1WmI5bkJZVTBKbE1sZzFJa3pNdmgvaTBZOC82Unl5Y3hMS3lO?=
 =?utf-8?B?U3NOc0FQbjVPdW56Zjk1Wm9FeW55TmNDYVExWk82TW8zUDFvQ3kzQlZwelFl?=
 =?utf-8?B?QnhyZUxQNDljSWY1aE9RY2txeGExOWhHaDhnQnRWdzVyTy9wZXVoZm5YclFD?=
 =?utf-8?B?ZnBIKzUvZkhzNlBXTXVjQW1BcHk2c2NheWhTVUZZU0lJRER5bFdVUUgxZWRC?=
 =?utf-8?B?clJJbjFzVEVRTnB3ejQwTFZtRUgrVWJHR3dURHI1eUVkb1pDcUdnOEEvVEV2?=
 =?utf-8?B?cVBRZklyREg3OEJqSHhaQWViR0VoRW42MU1pWUpsVDVXZkVsMEpzOUgzUDVj?=
 =?utf-8?B?T3hMK1VieWFHTzVDbEx1eDRsWFkyZVNrTXp4dXFlSHZtNmh5d0JaNm1uZ3RN?=
 =?utf-8?B?V0I2V1VndUhsMEtrVE9ZNE1UQngvTTRvN3FVYVN6WWxOMWVDdHE0Mysxbkhw?=
 =?utf-8?B?c3Y3cVJ2bVVEajgvNnY4ZHRoelNaOUJiQ3ZTSVZoTWNLRjRyNUx0V0Rtd0dW?=
 =?utf-8?B?NzBWajlKWDZJK0ZMNE9oWTRRNTNBV1l6ZFNQeVZzR2FqWFNscVNrd0NWMC9I?=
 =?utf-8?B?UnFSMWVaMUJXWDB5c2xEOU0wTFRFOHJwSGdVbTlYcmsyK0taMFNFYlMwdElB?=
 =?utf-8?B?ZnUranVQc2crZ1dtMUN6TnN4bWFoektIUkN0QlFuYlVHc2sycUJOUlRZdk9K?=
 =?utf-8?B?Z3d1QUhVV3ljWDl4VW5sLzlqLzFVQVlkYy9ZVUZDZm51Tkd5djgwQm42L2Jq?=
 =?utf-8?B?aGJxRGtCdHRubG5icnhtWkVvdHBGOUFqR2lyMzlTZlIvWk1hZnBMZjJ1eXJ2?=
 =?utf-8?B?WGh0aGQ1MVJkcm1iZHR4T1BFbFFNV0VqdEZyejRONVVCSzhNS1RwdkFxa21V?=
 =?utf-8?B?K0l6Q0lnNk00RmVtS3Z0U0F3dzZVdGFuV0lxWE5lRThuS1gwbWh3U3B6SGpp?=
 =?utf-8?B?Q2daNmNBN1lUM2JOUmV1aXIwOHUyR1N0OS84c1Q4K1pYL05YV2pSU0E0YVhY?=
 =?utf-8?B?aG1oR3NMeWxvbVJSR2puMlNobGF5Qk9zV0VvUllYVnJiT3FxOWMzQzVacHFt?=
 =?utf-8?B?bnJxTDFrbEF4dFF1cDQvQlorM29pNlN3dFRJM25PQzlZZTJueTBOR2NlMUhV?=
 =?utf-8?B?S1JMakhDTVR5TFpUQ0lXZlZZY1NGNjFORFQ3NzlWc000Yjgya1hkZEI2YjA5?=
 =?utf-8?B?QnJVNEUwb2kzQXp1NVdmSXIrQjhrQ2d6V09YRWZZUmh4bXBqazk2cjZLNk9D?=
 =?utf-8?B?RmRMcGhBV0VQbTdhMU5aWEdXNnFtbmgvSTBzN0JJaGlhVm0rVXplVG9nTWRW?=
 =?utf-8?B?OTd1bmNjZnUzMTJFN0JZNGlJbEU4aUJBMTNQSTVLQVVpOTRIbHRTZEVsRHor?=
 =?utf-8?B?NXZQZ1czRkN1dFR3UzQ2akttUjUzWjNzMHFpRHRpbGhhTUcwRmcvMEhyQTdD?=
 =?utf-8?B?cGxBK3ZYNXFnazNjb1ZJV0tTaEw2akJJTlcrNy95cjk1ZDBjY3ZLSjhEcUw3?=
 =?utf-8?B?cjN3cHQxQWNTU29zQUNmZ09KSWl1UkxJQmM0b0NNSGdIYU5ZeG5ZM1RuUXRC?=
 =?utf-8?B?Nkoxb3F1L1JnaTBDNllqcGtQNjNDUThKVjA3eWY2MVRKR1hXbmVsWTVQdlF6?=
 =?utf-8?B?ajdtYWNuNFhidThwNnFBdTBKVk5zZkkzVmNJc3VmQm5xVEpPZWI5K3B5UWlx?=
 =?utf-8?B?bVhnUHl1eWJMYnNVdFExODg2QTVhbFhQYmxxRzNCTXBmTDlPQ1dHRDg2R1Iw?=
 =?utf-8?B?cGZyZnFuczFQU05xbTNKaXZJZ3RKNEZMSVgzZHdPcDYxZnF2TlFjYm1ETk43?=
 =?utf-8?B?MHNyWFZHdTdKb0o5SzRjVVI4ak5YRjRaeEh1SjlNdFZNcWN0MXQxYmpxRk5Y?=
 =?utf-8?B?MVBtV3ZKVVkrZW9ZVlZIZDBERCtseU5iMEkrWGYzR25TbUM1SitQeXhqeW1i?=
 =?utf-8?B?NkptVUJzejE1bExyeG94S3J6ZkltMDhjdmxlemU3VjVaQWZXV212bGs3ak1U?=
 =?utf-8?B?dEtiU0VkT0lia0Z0UGZiWHRRc2tEaEg5ZCtoZDJJWStOU1pPWVZBTlI5dE0w?=
 =?utf-8?B?elA2MHZpMEM3YVpqQVdjM3o2ZW9ldlhIMEdKbE9YcVdaZXlPVGt3Yk5NV1hS?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc8c5b4-f800-475d-41f3-08dda8f49ce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 14:31:11.3396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1VHODoGecLowyFt76vMtVmtmgvV6/3EmBbtoLwyqd6OIAZRx3g9g0jVUy+1BRtNncf6bTWCOofLPMPL577OiIkPgJcJ5/kAD2CxJPSg583w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4627
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2ZWthbmFuZGFuLCBC
YWxhc3VicmFtYW5pDQo+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+
IFNlbnQ6IE1vbmRheSwgSnVuZSA5LCAyMDI1IDEyOjMwIFBNDQo+IFRvOiBCaGFkYW5lLCBEbnlh
bmVzaHdhciA8ZG55YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9w
ZXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvOV0gZHJtL3hlL3hlMzogQWRk
IHN1cHBvcnQgZm9yIGdyYXBoaWNzIElQIHZlcnNpb24gMzAuMDMNCj4gDQo+IE9uIDA3LjA2LjIw
MjUgMDE6MjAsIERueWFuZXNod2FyIEJoYWRhbmUgd3JvdGU6DQo+ID4gRnJvbTogTWF0dCBSb3Bl
ciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gPg0KPiA+IEdyYXBoaWNzIHZlcnNpb24g
MzAuMDMgc2hvdWxkIGJlIHRyZWF0ZWQgdGhlIHNhbWUgYXMgb3RoZXIgWGUzIElQLCBidXQNCj4g
PiB3aWxsIGhhdmUgYSBzbGlnaHRseSBkaWZmZXJlbnQgc2V0IG9mIHdvcmthcm91bmRzLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEbnlhbmVzaHdhciBCaGFkYW5lIDxkbnlhbmVzaHdhci5i
aGFkYW5lQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bj
aS5jICAgICAgICB8IDEgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyAgICAgICAg
IHwgNCArKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMgfCA1ICsr
KystDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ID4gaW5kZXggYjU1NTk4MDBkYjdhLi44ODI0YTgw
MTZiMWMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ID4gQEAgLTE4Myw2ICsxODMsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2lwIGdyYXBoaWNzX2lwc1tdID0gew0KPiA+ICAJeyAy
MDA0LCAiWGUyX0xQRyIsICZncmFwaGljc194ZTIgfSwNCj4gPiAgCXsgMzAwMCwgIlhlM19MUEci
LCAmZ3JhcGhpY3NfeGUyIH0sDQo+ID4gIAl7IDMwMDEsICJYZTNfTFBHIiwgJmdyYXBoaWNzX3hl
MiB9LA0KPiA+ICsJeyAzMDAzLCAiWGUzX0xQRyIsICZncmFwaGljc194ZTIgfSwNCj4gPiAgfTsN
Cj4gPg0KPiA+ICAvKiBQcmUtR01ESUQgTWVkaWEgSVBzICovDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4g
PiBpbmRleCA2NzE5NmJhYTQyNDkuLjVmNzUwMDU0YTljNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93
YS5jDQo+ID4gQEAgLTY0MCw2ICs2NDAsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBf
ZW50cnlfc3IgZW5naW5lX3dhc1tdID0gew0KPiA+ICAJICBYRV9SVFBfQUNUSU9OUyhTRVQoUklO
R19QU01JX0NUTCgwKSwNCj4gUkNfU0VNQV9JRExFX01TR19ESVNBQkxFLA0KPiA+ICAJCQkgICAg
IFhFX1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVfQkFTRSkpKQ0KPiA+ICAJfSwNCj4gPiArCXsgWEVf
UlRQX05BTUUoIjE0MDIxNDAyODg4IiksDQo+ID4gKwkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19W
RVJTSU9OKDMwMDMpLA0KPiBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5kZXJfb3JfY29tcHV0
ZSkpLA0KPiA+ICsJICBYRV9SVFBfQUNUSU9OUyhTRVQoSEFMRl9TTElDRV9DSElDS0VONywNCj4g
PiArQ0xFQVJfT1BUSU1JWkFUSU9OX0RJU0FCTEUpKQ0KPiBJbnN0ZWFkIG9mIGFkZGluZyBhIG5l
dyBlbnRyeSwgY2FuIHlvdSBleHRlbmQgdGhlIHJhbmdlIG9mIHRoZSBhbHJlYWR5IGV4aXN0aW5n
DQo+IGVudHJ5IC0+IEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMzAwMCwgMzAwMSkgPw0KPiANClRo
YW5rcywgSSBoYXZlIHVwZGF0ZWQgaW4gdGhlIG5ldyByZXZpc2lvbi4NCg0KRG55YW5lc2h3YXIs
DQoNCj4gUmVnYXJkcywNCj4gQmFsYQ0KPiA+ICsJfSwNCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9zciBscmNfd2FzW10gPSB7IGRpZmYgLS1naXQN
Cj4gPiBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gPiBpbmRleCA5ZWZjNWFjY2Q0M2QuLjU1N2Qy
M2MxYmI5ZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1
bGVzDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiA+IEBA
IC0zMyw5ICszMywxMSBAQA0KPiA+ICAxNDAyMjI5Mzc0OAlHUkFQSElDU19WRVJTSU9OKDIwMDEp
DQo+ID4gIAkJR1JBUEhJQ1NfVkVSU0lPTigyMDA0KQ0KPiA+ICAJCUdSQVBISUNTX1ZFUlNJT05f
UkFOR0UoMzAwMCwgMzAwMSkNCj4gPiArCQlHUkFQSElDU19WRVJTSU9OKDMwMDMpDQo+ID4gIDIy
MDE5Nzk0NDA2CUdSQVBISUNTX1ZFUlNJT04oMjAwMSkNCj4gPiAgCQlHUkFQSElDU19WRVJTSU9O
KDIwMDQpDQo+ID4gIAkJR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgzMDAwLCAzMDAxKQ0KPiA+ICsJ
CUdSQVBISUNTX1ZFUlNJT04oMzAwMykNCj4gPiAgMjIwMTkzMzg0ODcJTUVESUFfVkVSU0lPTigy
MDAwKQ0KPiA+ICAJCUdSQVBISUNTX1ZFUlNJT04oMjAwMSkNCj4gPiAgCQlNRURJQV9WRVJTSU9O
KDMwMDApLCBNRURJQV9TVEVQKEEwLCBCMCksDQo+IEZVTkMoeGVfcnRwX21hdGNoX25vdF9zcmlv
dl92ZikNCj4gPiBAQCAtNTcsNSArNTksNiBAQCBub19tZWRpYV9sMwlNRURJQV9WRVJTSU9OKDMw
MDApDQo+ID4gIAkJR1JBUEhJQ1NfVkVSU0lPTigxMjYwKSwgR1JBUEhJQ1NfU1RFUChBMCwgQjAp
DQo+ID4gIDE2MDIzMTA1MjMyCUdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMjAwMSwgMzAwMSkNCj4g
PiAgCQlNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDEsIDMwMDApDQo+ID4gLTE2MDI2NTA4NzA4CUdS
QVBISUNTX1ZFUlNJT05fUkFOR0UoMTIwMCwgMzAwMSkNCj4gPiArCQlHUkFQSElDU19WRVJTSU9O
KDMwMDMpDQo+ID4gKzE2MDI2NTA4NzA4CUdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMTIwMCwgMzAw
MykNCj4gPiAgCQlNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDAsIDMwMDApDQo+ID4gLS0NCj4gPiAy
LjM0LjENCj4gPg0K
