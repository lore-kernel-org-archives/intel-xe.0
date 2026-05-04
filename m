Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5CEFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 15:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E2510E3C5;
	Mon,  4 May 2026 15:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cz3dWsLU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A208110E3D2
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777909840; x=1809445840;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8eRPHV39vNZKAGhliEZPuSnHlETEE29wnQD+S4OtCuY=;
 b=Cz3dWsLUtLnxYLa/TVofSKzrpIpYs0nOIaMoGw1YytDHmQwrMf5KXinV
 94sEkwloU9ap0WGe0rFLGybpSBMstDvGXNwLADtWdbjpN04Awb4Vf0ve5
 ioiBvUKLA0qHrSzXMmUUZ6vEEPc3CVpTM5s17WLq/sh1npGCkpedrIPa7
 7pnysrlOHuTJR4tEFNEp1jS22rfylfvwvXHt45E8mYwQE0dPGNNzSPCYW
 40P2efXhn8uz5SudwQRdVNBrxNDZqgGma2rZaISHa25wGVctkiu2z2hHo
 r2/8nDr2Ovq/tyJy4bJVYKdB5yHpm52ry/PaBt71Kds8eKjOJbnU5zS46 A==;
X-CSE-ConnectionGUID: ncKR0AvjRY2bjVRiwrzUhg==
X-CSE-MsgGUID: kGI3zrbYTQelZv/rN1g32A==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="104217728"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="104217728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:50:40 -0700
X-CSE-ConnectionGUID: hRreg4SARg+LawsHGn677A==
X-CSE-MsgGUID: DHvXqhE0TGGfGCdNr1na6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="258898699"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:50:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:50:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 08:50:39 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B41mWmkttIQ6fqe+XtJoBmzoaWr0BOuHdu49bAW96NZ/LGVkyRgG+QAKTwSSBSsVTCwohYicgJFrXnLMuyKZ7gJo8nYHve8Lkr3tTlpGZL/91BR326c5GosfKCeZHe8P43JYA6oyHygknjFMuKas6X5FVxnRV6xykDBe1MNSr4abbwHdcEy000odYVoFjOzZ/mfpuakyqrECdnuLflqeElNM0Tm7az5Q/eNNs2vsZlzSlRB0JDj/UvszzETIMrbq9XwKv7+x2ZjCOoHn2rNB8avIGdYXEGUp5lGkF5NBdnGLK6v4mYtAgSao3J4dczaApO3y7t+/w9pijCFM/kyUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eRPHV39vNZKAGhliEZPuSnHlETEE29wnQD+S4OtCuY=;
 b=naqFhBu/rFCTRsg7kk9taUlzbRUF0hZMV1R0lelEAxC9q3PH2lygjbk3ssLU6ORRG0PtPooLobMw4GCuhX2pqn1x2I/0MoMr6dgTMo+chSRpDKigk57jFqvHcxRLOL7Q67PlJYEjrCnvif1I4q2D8Hurw7gnTIB7tBlNWjXnVbEncpF68pfsWHupS2NZLfxsQtqmgHzFEBjS6afaOVsHu2GDqkXsO6VO3vdMXuk4bGOlO/gKudOLe+1IGBYbr1LnzKK1aBcRalid2jtjc5JNcde+HGtQR+jfLEDfpOsfamhFGOGPWZeoxM+6VdldukhCYFYI0OmYb8tr7DVsx9M6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH0PR11MB8213.namprd11.prod.outlook.com (2603:10b6:610:18b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 15:50:35 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 15:50:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
Thread-Topic: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
Thread-Index: AQHc24CiQo5s8b+4uE6kK9lOFblYaLX+Ai2AgAACSwA=
Date: Mon, 4 May 2026 15:50:33 +0000
Message-ID: <0579da16c8a003849b608d29ea37b3f86a9ddc17.camel@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-5-stuart.summers@intel.com>
 <875x53dvvo.fsf@intel.com>
In-Reply-To: <875x53dvvo.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH0PR11MB8213:EE_
x-ms-office365-filtering-correlation-id: 4f3760c0-4c72-4a12-ecc8-08dea9f4e098
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: wL0T/WfpdGAQOGqLgxBUiPja+j88tQuIYh8bpR6j035rt3xU6UgpYzgbLFyx/IvNphs+F/q2vl9wbC6uvTxi5i7YGQPo3RVi9KmPVuiNbg0IWjVu1CG6CVUmOagTWHi0a0bip193GclTmDQqRYYNd5uSWf9dG7E3eLfmO+kuPsS0LbQ+lEMP5r0nrA+MQf9BUNdQ/YgY08ADNZDMpylSOsp6lzaGMx3pgAYGbFSPPr6HNvDa0tV55miptZTQxu2sFx702+1YUqAUjS6qY2Bm1JxmuF3bqXDoJVWxoJ49+CDsLiQ9eIJyZ3Qjl+AS4awabGWg5Rmt9/QJcSaGtV5aS5uLUec9J3q6yq920CyhVlt5IbilWohqi6uP31rXuExSQinn2zcMw6X9HwY/YHfmN2fJYHojIfISsriFwWJI+p4REvLPiUTJv9QuhM6MpWNEEMt9vQFG8YqqdHBXaJe9nhgrW94ho9su0YyCsl6+noPgJNMHmTkr4F7FBRmfuvF82qFDoIZR4ePi0oMeZrRi8dLIrYAyxKNiqfjPqSZG9Oh80QCzfQ9EIl+lnwuM6iII3KyusiOa3kLLepABXegGcBzCmC8cJRai4of5L8GVVUMXQ8jT5RO/CeO5Bf2tYKEzOVVmtIAjD5Ac0mwZU2oJeh8cL3RSKW5fnkly+iAXhwuAcPOEKxwOGSTFzwrgVZMUxXv+RyTg+rvYmtvRpdc/J9HwYIHBbmqJIXSlfzTUzYs7NlZOfJ4BSI8II81in3eu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTI4Mm91em8zbjc1THdPb2llOGdNclgwL3VtTEJHek1xQ2hTQmpUZWVkTHdY?=
 =?utf-8?B?ekUzQlNqN1N3YUJ1RVBhVXNySUZMSkltQTNJMGphck1Kb3FMSGhwMmE1Nnpp?=
 =?utf-8?B?WmkvNjNIZjhGQis3U3hQZCtXSDRlU0pWKzg5N0E5eXZld3kyRWE2TjB3SUFw?=
 =?utf-8?B?Tk81T1VPU2xaRXpKR3dGQzdJRVhJWmd1bkNvSk1iVlVjeEhzWmFuZXdWYTFI?=
 =?utf-8?B?akVQd3htZFNFUGZPZENOWUVndERJQm9lRzh3czFUWE1aVXlYaGRMOE9xSTZ2?=
 =?utf-8?B?RElmZ0xaK28ydEpBZ0pCOHhhcHhRN2MvU2xwSlRyTlVjcFc3REVDZWVBRGlv?=
 =?utf-8?B?bGgrRWd5OTlRdTJzSWlReUVISlYwTDVCR2o0cml6OTdrL2I1YVk5ZDFqZk1a?=
 =?utf-8?B?dmZtSFR5TTNGN2h4NnFEQkFEV0RuMFAwei9HVGMxa3NHWUlTbjZPZjRueGZM?=
 =?utf-8?B?OEw5SWdmZTE1UzI2aGFvVlVNckJKazFwdFVEbHg0bC9NSTNoUXpnKzFubk54?=
 =?utf-8?B?U3p3SnZKUDlNYlh5SnEzK256Umd3RFJxN3NmREVGYTdZYlVQaEtPQ1QxVk12?=
 =?utf-8?B?dHdlZUhPRTdsdFErZ1FSa3RpUWQwZERqSG5ZcjI5M2R0OGgyck1TZVEzSEtM?=
 =?utf-8?B?YWVFaldydVg0bjdMem1PUDQ1b3ZhK0FYeG5RVUpabkNEZW00Q3pZOWIxL2Ja?=
 =?utf-8?B?d2Y0QjFINFRjVnFGdmVBV0JSZThsbWhsc0NIYk1jMlBkSmJkL0lzaXNHQ1k3?=
 =?utf-8?B?ZW1sc3ZuQnh3QWU2VDk5c3JBK2E4V1o2TTNWTXJRdEN1YmdkaTkyQmw3Sjg5?=
 =?utf-8?B?S0MyakY3aTlDWE03cUtYRStLSFFaY3BVZi9IZkZYTDZSNDdtaGkwcXlGc3A3?=
 =?utf-8?B?Y1pYZDNQWUR3RDJxVThidEJDNEV2SHAzVFhjS0QyYXZ3N0FFNDJGRHZOSWZG?=
 =?utf-8?B?bjl4WDhTR1RoeGxocC9GY09BRldkb2U0WkhqTjVjUmNKdkJmbGd1cUVCSHQ3?=
 =?utf-8?B?NlVaRWF6N0ZKN3lONGVtdy9Eb0FhNlFGOU1qRmRLejdDRlYzcDZEbkhMNHox?=
 =?utf-8?B?UHNCaGhFNG1GRDVsT2xHWlRoaHZkMDJ0ZWFKaHJLMDVkSmp0NHRNZ3M4SFJQ?=
 =?utf-8?B?MkcvZ2dZZ1VzaEttVDk5OEJBd3NJK0VqZXBvUW9DZWFNbWc2U001M2pJRm1j?=
 =?utf-8?B?RDBOV2xmWDhkNTZWYTZ1eUx2TnZsMi9rc3Z1dWVjWkVSa3ZxUUlKNWNoTEJB?=
 =?utf-8?B?bmlIaEFBRUF3blQ0TUEvcTB6SFpPOFdjTG5VWDNyQzRPRzBHVmw5NEJUMlNG?=
 =?utf-8?B?QWVlKzhsR2FJZFFMMmIxNWlLL0tkUmwvcnJ6U1l3cnpaV1dDUFBzU0ZlZFBB?=
 =?utf-8?B?R2dlTG9hd3pBZ3pXS1pIZjlJRUgxZDZTdzFPT2ZHbDMxZVZkQUk1UDlLamx3?=
 =?utf-8?B?ZlkwRmIwaTVrRU5qaTFOQUxOZHZCUDFlMlBWejhUU2toN3N4dUN4cCtPV1VO?=
 =?utf-8?B?L1Q0enBGdmt1djQzcnpuTzRxVVdGTDFONXNQc3ArdU5ialZST1VjQjczamFO?=
 =?utf-8?B?TnVwVTJjY29xRVBQRkpZQ0NLakd5bnRZSDdpWjBvYXkvS1FUbXVucVYycGNZ?=
 =?utf-8?B?K0svTWt5YXQvSitjQ3p1TExWYVJuMTlPc3lydjNjT1kveTBFcE1LSzNFZ2Vk?=
 =?utf-8?B?ZEJPODRWOXdvOXM1VzdHaTIyY2R5N1ZDNlRCY3dNUmQ4WHlQWXpHN25XNml3?=
 =?utf-8?B?UDBkWXovVVprUG45VGZBN0lEMVUvWUtVVnYxQXBjRDV5UzFuSmxRVWdiNmJi?=
 =?utf-8?B?UjFmV25ORW9DMTQ4WkRGNlhSaGs5V2M4Umx6T1d5bVBJM3pSQ283YlFrMGU3?=
 =?utf-8?B?U3Z0NWl2b2ovSS96dFI5TzJFK0trejhLVCs2dkRvRGRvYytZNGZBUGloNG5o?=
 =?utf-8?B?amJDa2FwZUZOUUFQY1dZOGYrbm1adFVYV1lNVWxrNnIwUnVxWUNXU242T1RS?=
 =?utf-8?B?dE5aNyt4RWc0Mm1RT0RWVVk4ck9QQTNPSjUyczVWSDRvaS8vNnBZOG1ZaHFS?=
 =?utf-8?B?RnB3THBSUkRRb2JNdGNQSFNyTy9XMFhDM3dMbzI2cWUxL01tMWw4S1l4bG1t?=
 =?utf-8?B?T21RMzV6TjJXSmRUZVNFRHpuYXJUUXFUdHgzV2lOVGRSTGdDcHVFbzBoNUF4?=
 =?utf-8?B?TWExL09URUhic013YlpCbXhyVWpzUlEwSHJXT29xRjlwdVhBS3c5aXJKREZG?=
 =?utf-8?B?TDJuK2w2QW41dGQzcVQ5ZWpMamE1RVVvZjlGR3JPOEtqVGZjRWYzZFFKay9y?=
 =?utf-8?B?bFdrTzdDMnBndUNIcnZSVlhLZ3I2UDJ4bjl1QlIxZkxscU5XSXJxTTZMUTlI?=
 =?utf-8?Q?9swy9sRMWAPzW55I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD4B505B19399F4F93D4019C38C6D969@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TTcweUVWN79d4JGiXQSLiL7AZu5k/79QM7hL9ymrwAOW6TQJlZ2FiCNaFXXx63PNttqYHg1qqLokeKRz+dkyxS/M3fA5ZB2AsMB4WvAG4DU4DFfzBtYx+c2jlXUEjPIHDYRJIX2hZuUE4F7V8iCH1KYklM3+TpE0c337JTh844gHZLyr6Gi0ptM3Owq3a+ZqAyjLqz8egIlBVouKc22gp+2VV7ZC6txkW8P1q1BJ8cxdig2Ey9rYeY9AQpYiwOFWpvOotAszr6R34PVYJ1k+CA9FUAF/5gG3aGdyl3vIhtU05DcNtz2bRwKF2tqLdphRxHtP9DV01fJmo6J9l2W2HA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3760c0-4c72-4a12-ecc8-08dea9f4e098
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 15:50:33.7948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ipg0+k8na9pLR+Xv7CNCfPqaQI9FVRgsN4R6TowHbhVP5NFZ6B9UXrLmdEsgziAxO5KY9NZd42U7rdWiqPKzgMuq+PoYXTk5xh3bJ9bYitQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8213
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

T24gTW9uLCAyMDI2LTA1LTA0IGF0IDEyOjQyIC0wMzAwLCBHdXN0YXZvIFNvdXNhIHdyb3RlOg0K
PiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPiB3cml0ZXM6DQo+IA0K
PiA+IEFkZCB0aGUgc2tlbGV0b24gY29kZSBmb3IgYSBuZXcgZGVidWcgc3BlY2lmaWMgY29uZmln
ZnMgZ3JvdXAuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFy
dC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiBBc3Npc3RlZC1ieTogQ29waWxvdDpjbGF1ZGUtb3B1
cy00LjcNCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDIgKysNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25m
aWdmcy5jwqDCoMKgwqDCoMKgIHzCoCA0ICsrKysNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9jb25maWdmc19kZWJ1Zy5jIHwgMTQgKysrKysrKysrKysrKysNCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5oIHzCoCA4ICsrKysrKysrDQo+ID4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfY29uZmlnZnNfdHlwZXMuaCB8wqAgNyArKysrKysrDQo+ID4gwqA1IGZp
bGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuYw0KPiA+IMKgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5oDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gaW5kZXggMDk2NjFmMDc5ZDAzLi5iNTg2NjdiMGIxOGUg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gQEAgLTE2MSw2ICsxNjEsOCBAQCB4ZS0k
KENPTkZJR19IV01PTikgKz0geGVfaHdtb24ubw0KPiA+IMKgDQo+ID4gwqB4ZS0kKENPTkZJR19Q
RVJGX0VWRU5UUykgKz0geGVfcG11Lm8NCj4gPiDCoHhlLSQoQ09ORklHX0NPTkZJR0ZTX0ZTKSAr
PSB4ZV9jb25maWdmcy5vDQo+ID4gK3hlX2RlYnVnX2NvbmZpZ2ZzX29iai0kKENPTkZJR19EUk1f
WEVfREVCVUcpIDo9DQo+ID4geGVfY29uZmlnZnNfZGVidWcubw0KPiA+ICt4ZS0kKENPTkZJR19D
T05GSUdGU19GUykgKz0gJCh4ZV9kZWJ1Z19jb25maWdmc19vYmoteSkNCj4gDQo+IFdoYXQgYXJl
IHRoZSBkb3duc2lkZXMgb2Yga2VlcGluZyB0aGlzIGF2YWlsYWJsZSBmb3Igbm9uLWRlYnVnDQo+
IGJ1aWxkcz8NCj4gDQo+IEkgaW1hZ2luZSB0aGF0IHRoZSBkZWJ1ZyBjb25maWdmcyBjb3VsZCBi
ZSB1c2VmdWwgZm9yIHNvbWVvbmUgbm90DQo+IGludm9sdmVkIGluIGtlcm5lbCBkZXZlbG9wbWVu
dCB3b3JraW5nIHRvZ2V0aGVyIHdpdGggdGhlIGRldmVsb3BlcnMNCj4gdG8NCj4gZGVidWcgaXNz
dWVzIHdpdGhvdXQgbmVlZGluZyB0byByZWJ1aWxkIHRoZWlyIGtlcm5lbC4NCg0KU28gdGhlIGZv
Y2FsIHBhcmFtZXRlciB3ZSBoYWQgaW4gaTkxNSB3YXMgZW5hYmxlX3JjNi4gU29tZXRoaW5nIGxp
a2UNCnRoaXMgaXMgd2hhdCB3ZSBleHBsaWNpdGx5IGRvbid0IHdhbnQgdG8gZXhwb3NlIHRvIGEg
Z2VuZXJhbCB1c2VyIGFzIGl0DQpjYW4gaGF2ZSB1bmZvcmVzZWVuIGNvbnNlcXVlbmNlcyAobGlr
ZSBoYXZpbmcgdmVyeSBoaWdoIHBvd2VyIHVzYWdlKS4NCkJ1dCwgaGF2aW5nIHRoZSBhYmlsaXR5
IHRvIGRpc2FibGUgcmM2IGZvciBkZWJ1ZyBwdXJwb3NlcyBhcyBhDQpkZXZlbG9wZXIgaXMgZXh0
cmVtZWx5IHVzZWZ1bCBhdCBuYXJyb3dpbmcgZG93biBjZXJ0YWluIHR5cGVzIG9mIGJ1Z3MNCmF0
IHRoZSBoYXJkd2FyZS9zb2Z0d2FyZSBpbnRlcmZhY2UuDQoNClRoYXQncyBqdXN0IG9uZSBleGFt
cGxlLCBidXQgdGhlcmUgYXJlIGEgYnVuY2ggb2YgdGhpbmdzIHRoYXQgY291bGQgZml0DQp0aGlz
IGNhdGVnb3J5IGFuZCBJIGV4cGVjdCB3ZSdsbCBoYXZlIGV2ZW4gbW9yZSB1c2UgY2FzZXMgb3Zl
ciB0aW1lLsKgDQoNClJpZ2h0IG5vdyB3ZSBoYXZlIHRvIGhvbGQgdGhlc2UgdHlwZXMgb2YgY2hh
bmdlcyBpbiBhIHNpZGUgYnJhbmNoIG5vdA0KZXhwb3NlZCBleHRlcm5hbGx5IGFuZCBJIHJlYWxs
eSB3YW50IHRvIGNvbnZlcmdlIG91ciBwcm9jZXNzZXMgc28gd2UNCmNhbiBtb3JlIGVhc2lseSBt
YWtlIHRoZXNlIGtpbmRzIG9mIGNoYW5nZXMgYW5kIGxldCB1cyBkZWJ1ZyBkaXJlY3RseQ0Kb3V0
IG9mIGRybS10aXAuDQoNCj4gDQo+ID4gwqANCj4gPiDCoCMgZ3JhcGhpY3MgdmlydHVhbGl6YXRp
b24gKFNSLUlPVikgc3VwcG9ydA0KPiA+IMKgeGUteSArPSBcDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfY29uZmlnZnMuYw0KPiA+IGluZGV4IDEyYjdmZTY1NDQ2ZC4uODVkZjhjZTVjZjJhIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMNCj4gPiBAQCAtMTAwNiw2ICsxMDA2LDEw
IEBAIHN0YXRpYyBzdHJ1Y3QgY29uZmlnX2dyb3VwDQo+ID4gKnhlX2NvbmZpZ19tYWtlX2Rldmlj
ZV9ncm91cChzdHJ1Y3QgY29uZmlnX2dyb3VwICpncm8NCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGNvbmZpZ19ncm91cF9pbml0X3R5cGVfbmFtZSgmZGV2LT5zcmlvdiwgInNy
aW92IiwNCj4gPiAmeGVfY29uZmlnX3NyaW92X3R5cGUpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY29uZmlnZnNfYWRkX2RlZmF1bHRfZ3JvdXAoJmRldi0+c3Jpb3YsICZk
ZXYtDQo+ID4gPmdyb3VwKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ICsjaWYgSVNfRU5B
QkxFRChDT05GSUdfRFJNX1hFX0RFQlVHKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoGNvbmZpZ19ncm91
cF9pbml0X3R5cGVfbmFtZSgmZGV2LT5kZWJ1ZywgImRlYnVnIiwNCj4gPiAmeGVfY29uZmlnZnNf
ZGVidWdfdHlwZSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgY29uZmlnZnNfYWRkX2RlZmF1bHRfZ3Jv
dXAoJmRldi0+ZGVidWcsICZkZXYtPmdyb3VwKTsNCj4gPiArI2VuZGlmDQo+IA0KPiBJIGd1ZXNz
IHRoZXJlIGlzbid0IG11Y2ggd2UgY2FuIGRvIGFib3V0IGl0IHRvZGF5LCBidXQsIGJhc2VkIG9u
IHdoYXQNCj4gSQ0KPiByZWFkIGluIGNvbmZpZ2ZzIGRvY3VtZW50YXRpb24gYSB3aGlsZSBhZ28s
IEkgc3VzcGVjdCBpdCB3YXNuJ3QNCj4gcmVhbGx5DQo+IGRlc2lnbmVkIHdpdGggYXJiaXRyYXJ5
IGhpZXJhcmNoaWVzIG9mIGNvbmZpZyBpdGVtcyBpbiBtaW5kLsKgIEl0DQo+IHdvdWxkDQo+IGJl
IG5pY2UgaWYgdGhlcmUgd2FzIGFuIEFQSSBmb3IgdGhhdCB0aG91Z2guDQo+IA0KPiBCYXNpY2Fs
bHksIGEgY29uZmlnIGdyb3VwIGlzIGV4cGVjdGVkIHRvIGJlIGEgZGlyZWN0b3J5IHRvIGNvbnRh
aW4gYQ0KPiBzZXQNCj4gb2YgY29uZmlnIGl0ZW1zIG9mIHRoZSBzYW1lIHR5cGUsIHdoaWNoIGlz
IG5vdCB0aGUgY2FzZSBvbiBvdXINCj4gY3VycmVudA0KPiB1c2FnZSAoaS5lLiB0aGUgInNyaW92
IiBhbmQgbm93IHRoZSAiZGVidWciIGdyb3VwKS4NCj4gDQo+IEkgZ3Vlc3Mgd2UgYXJlIGFibGUg
dG8gZ2V0IG91ciBkZXNpcmVkIGJlaGF2aW9yIChiYXNpY2FsbHkganVzdCBhDQo+IHN1YmRpcmVj
dG9yeSBiZWhhdmluZyBhcyBhIGNvbmZpZyBpdGVtKSBieSBub3QgaW1wbGVtZW50aW5nIHRoZQ0K
PiAibWFrZV9pdGVtIiBob29rLsKgIE5vdCBzdXJlIGlmIHRoYXQncyBhbiBleHBlY3RlZCB1c2Ug
b2YgdGhlIEFQSSBvcg0KPiBpZg0KPiB0aGF0J3MgbW9yZSBvZiBhIGhhY2sgb24gb3VyIHNpZGUg
YW5kIGNvdWxkIGNvbWUgYmFjayB0byBiaXRlIHVzIGluDQo+IHRoZQ0KPiBmdXR1cmUuDQoNCkht
Li4gb2sgdGhhdCdzIGdvb2QgZmVlZGJhY2suIEkgZG8gbGlrZSBidWNrZXRpbmcgdGhlc2UgaW4g
Z3JvdXBzIGFuZA0Kc3ViZGlyZWN0b3JpZXMuIEl0IGFsc28gbWFrZXMgaXQgZWFzeSB0byBzaG93
IG9yIG5vdCBzaG93IGJhc2VkIG9uIHRoZQ0KS2NvbmZpZy4gQnV0IGxldCBtZSBnbyB0aHJvdWdo
IGFuZCBtYWtlIHN1cmUgdGhlcmUgaXNuJ3Qgc29tZXRoaW5nIG1vcmUNCnN1aXRlZCBoZXJlLiBI
YXBweSB0byBoZWFyIGFueSBvdGhlciBmZWVkYmFjayBhcyB3ZWxsIGhlcmUuDQoNClRoYW5rcywN
ClN0dWFydA0KDQo+IA0KPiAtLQ0KPiBHdXN0YXZvIFNvdXNhDQo+IA0KPiA+IMKgDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoG11dGV4X2luaXQoJmRldi0+bG9jayk7DQo+ID4gwqANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2RlYnVnLmMNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQ1NjE3MjgyY2VjNQ0KPiA+IC0tLSAvZGV2L251
bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuYw0KPiA+
IEBAIC0wLDAgKzEsMTQgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0K
PiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+
ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9jb25maWdmcy5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAieGVfY29uZmlnZnNf
ZGVidWcuaCINCj4gPiArI2luY2x1ZGUgInhlX2NvbmZpZ2ZzX3R5cGVzLmgiDQo+ID4gKw0KPiA+
ICtjb25zdCBzdHJ1Y3QgY29uZmlnX2l0ZW1fdHlwZSB4ZV9jb25maWdmc19kZWJ1Z190eXBlID0g
ew0KPiA+ICvCoMKgwqDCoMKgwqDCoC5jdF9vd25lcsKgwqDCoMKgwqDCoMKgPSBUSElTX01PRFVM
RSwNCj4gPiArfTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZp
Z2ZzX2RlYnVnLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5o
DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjAxMTcw
ZGMyZjk3ZQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfY29uZmlnZnNfZGVidWcuaA0KPiA+IEBAIC0wLDAgKzEsOCBAQA0KPiA+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCDCqSAy
MDI2IEludGVsIENvcnBvcmF0aW9uDQo+ID4gKyAqLw0KPiA+ICsjaWZuZGVmIF9YRV9DT05GSUdG
U19ERUJVR19IXw0KPiA+ICsjZGVmaW5lIF9YRV9DT05GSUdGU19ERUJVR19IXw0KPiA+ICsNCj4g
PiArI2VuZGlmIC8qIF9YRV9DT05GSUdGU19ERUJVR19IXyAqLw0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfdHlwZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVzLmgNCj4gPiBpbmRleCA5MzUwOTdhYWZhOTYuLmM5ZDk0
YTNjMjZhNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNf
dHlwZXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc190eXBlcy5o
DQo+ID4gQEAgLTI0LDYgKzI0LDkgQEAgc3RydWN0IHdhX2JiIHsNCj4gPiDCoHN0cnVjdCB4ZV9j
b25maWdfZ3JvdXBfZGV2aWNlIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGNvbmZpZ19n
cm91cCBncm91cDsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGNvbmZpZ19ncm91cCBzcmlv
djsNCj4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9ERUJVRykNCj4gPiArwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgY29uZmlnX2dyb3VwIGRlYnVnOw0KPiA+ICsjZW5kaWYNCj4gPiDCoA0K
PiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfY29uZmlnX2RldmljZSB7DQo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgd2FfYmINCj4gPiBjdHhfcmVzdG9yZV9t
aWRfYmJbWEVfRU5HSU5FX0NMQVNTX01BWF07DQo+ID4gQEAgLTU2LDQgKzU5LDggQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgeGVfY29uZmlnX2RldmljZQ0KPiA+ICp4ZV9jb25maWdmc190b19kZXZp
Y2Uoc3RydWN0IGNvbmZpZ19pdGVtDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAmeGVfY29u
ZmlnZnNfdG9fZ3JvdXBfZGV2aWNlKGl0ZW0pLT5jb25maWc7DQo+ID4gwqB9DQo+ID4gwqANCj4g
PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9ERUJVRykNCj4gPiArZXh0ZXJuIGNvbnN0
IHN0cnVjdCBjb25maWdfaXRlbV90eXBlIHhlX2NvbmZpZ2ZzX2RlYnVnX3R5cGU7DQo+ID4gKyNl
bmRpZg0KPiA+ICsNCj4gPiDCoCNlbmRpZiAvKiBfWEVfQ09ORklHRlNfVFlQRVNfSF8gKi8NCj4g
PiAtLSANCj4gPiAyLjQzLjANCg0K
