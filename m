Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F389CD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 10:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EB510E49B;
	Tue, 26 May 2026 10:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAglaCce";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E0710E498
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779791924; x=1811327924;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=9Y/wo0d63PZwG4iDCDLe8EFw2CcCzeMkjp4wdw9ZbZc=;
 b=CAglaCceeSr3J2muWeCxYaL2DXHjrDc4V6kqRHef0It6rgKynQHtdIpJ
 spBRw9Z4MPmeaNRojXyPyPp7TzH/oBigyWT0xa/047RIkOUBSgq6m1Tty
 0gPO1ac94riaQqSUKoRvdTnp/N16PqY+YKwMfMv7eF8ux4haSFAzK47Vj
 6IAdIAEVWwGXN/hM4wqRkESycX4HSxWxf2eObtWnQsbVQ2OjQDVRQg/e+
 D+TAcs123v26iS7ZAMrAVXfLiFIO9Lc86rmrFD4TGBCpOKIM4G3u1PH9+
 i/KGx0Hv9voNAV+BzXu1Jd7Ahi/arIS7YV0XMmUM3hDma6iyvEqQO2kQo A==;
X-CSE-ConnectionGUID: oc/6uCTRRAK5mnOApABfaA==
X-CSE-MsgGUID: Q+rZXluETHOzhhRrQ5dstQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="68124983"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="68124983"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:38:43 -0700
X-CSE-ConnectionGUID: 1/2qWVAITgGEbGrcEZkUOQ==
X-CSE-MsgGUID: /Ms3Il4JTKCa7wDRj8/Mgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="238864881"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:38:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 03:38:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 03:38:42 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 03:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbgXFJSL6xWxcYT8W+sHco6LrOyqo4xdxc2WQ/6Cc7RTg8vtX7mgt1we+uqxbf8rgY0mUV4tCRX197FXxbzZdecDTZylGR5+3NaS6ZpSQdiIRsASZtotKlj5pMVwNM+sapAjzgh8uw4cA9esqPkpzb58bpQISj3ft9dtuBgolj5cCySLGfLi98YoSNUMTOjfEuBcuYXN9EwuwE3zZqDMdHN0HX27pXZJcSHQU24lUIFD0lwd+RBg/WMYkJfQXSzI657ktAPYHaDgnJlyNjklKDdwwcnI4KCtj6npomV+gylFlwgrRb3YFJTaVjPQpK0zOu8zusu8hcmchCVyyyXxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Y/wo0d63PZwG4iDCDLe8EFw2CcCzeMkjp4wdw9ZbZc=;
 b=njKTmU7ODYkWXUI06P80xAtAEJTCEL0ZGwqNVyrDYB+l5sVlMzQXdsZvoWuU9fjMuJE1M2BoCmqcFWgW4yGMktuRJNxJVGep9l1Ubua3ocToOv4PrIe+tdi8SSFBpV9pFzyuOtG4A78J3kMBDLVejxNmxhuzyJSwAtlqw391LNaIfTLNNGHAAtt7y9fgtrl62hbZIRd+eEoqHvtHLYTkFGNqg/CKfYMQM2TVa7rSWudZTLfidVpj5BM2Y3+FwL0jgGWJx4w+YVatYRU1vKb4Hu5b8vynxa/+ZgF5t7Ai9NSfTtSpZsZm4SYMExdGYvasDd/BcMzyAxRtg2FI0cKz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Tue, 26 May 2026 10:38:38 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 10:38:37 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>, "Nguyen,
 Brian3" <brian3.nguyen@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Wang, X" <x.wang@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: drm/xe: include suspended queues in TLB
 invalidation
Thread-Topic: [PATCH 5/5] drm/xe: drm/xe: include suspended queues in TLB
 invalidation
Thread-Index: AQHc7OmGGp1TmpPeIkiWAmQmAF4nVrYgHckA
Date: Tue, 26 May 2026 10:38:37 +0000
Message-ID: <2dbbb738db3b94be3b439f678e724e421a803edf.camel@intel.com>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
 <20260526082700.1383831-6-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260526082700.1383831-6-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|IA0PR11MB7211:EE_
x-ms-office365-filtering-correlation-id: 0cf5d914-8d32-46bc-e57d-08debb12f218
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|56012099003|11063799006|4143699003|22082099003|18002099003|38070700021|921020;
x-microsoft-antispam-message-info: Mc8ZdVbZB9mB+L14lKZQy2G8BrinU5Ohw8S19WY5b1oeMCdcGdmRSt5SyBXI0mTNFb8bS9A0gLOJyp0HHknLNjTrRZGTIE2GhbdGVr/GouYCFV4CSGZkrxIQ7ry2/E2wF8pZ27idiMWr5pXsFzisz0bC4iKvafnzlI/0wvBVo0VPu6N5511HC2alNpoKButeoF/kPM9089vVFpobVZ78EE22U2N7HwypRQ+cY8qCs1BSTsxoqEIprgJhprNHuh/sKXK2tkjPoxfdVhp8Dyy4RpyUuYulwGBojHdWMUjdHYXeLBNYRmu0umUEyBAlbNukm+9PYtd7XUJnmNseEeTQJSSpdYUmdqO6cqaezFPwjRzLE/Qx6hD3jApsr0lSga+a+hcp405OMyHt7fp6GXsDfiYlj6WlRXfrf2ZJUFl67zsbA5ZU3RJIY/gPkpUZ9QqE4XwF2oKGSxOqRBWrFnbqG6D2s66oIZM2Nt7vU94QFRLNjY0rEaGXo4Papa0YRh+kIIeHr+zZL0LcX5BNRYJ+YMZ27LXrXaltSFgxRzQsvoSDbRVOi/bIjf9FbX5ON1/0OMR4jwAhm8WVo/e5aSGD1uqppU5Q07Nsh4MKgOhcZqsZgF9Li1E1+vNn9I2CwnLi9fm7LgXdCTy47f29Xyk/8lKE3spIQpd6R08wagCsy3Cd/ASr2iQtrHjZ97tlp4cMc+gN9iXSl9SFdmfAqLdnR3Vv1W9wpzugZ/opFJCuG8L4aosdmDSXa6Mdvh1LGCfcI/MiMUWKRKPXWYrpdIUtNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(56012099003)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFRXUkpPaElGWHZTMVZpbHJ2TnRxVyt4NDBLMG4wQ1FUZFFpL0xqanI5elJW?=
 =?utf-8?B?eWQzZDB2WS9KT0tjZ09DalRIRzhHSVMwc3RXaEtXQWlqQmQwTkE3SXlsc1hV?=
 =?utf-8?B?WHRtTjliejIvSHJ5MU9TM0tNa2Y3SUJwL2s4Y20wU2ZETmRRRE43bFRhNzFG?=
 =?utf-8?B?T0c2dHJCeE55bm42dUorOXUwNk5MMDFKVU4zazErWnZhOG1uQW1GMDNkSHNS?=
 =?utf-8?B?UlN2MVF1OEFlSWNWRW5TcVU2SkhhVlF4d0dWdmJFSVNzRVVzODNMNWxUbXV1?=
 =?utf-8?B?K05GSE5tb3JtRTFiWnZva3Y4WW14bngrOFRDNlMzT3lpVnpyd3dLTTJKeU9r?=
 =?utf-8?B?ZGFzV284UkxySXRuSm5SbGZ3Nmd2K2lJVVpuZTJxcWpkVXZqbldpeTlqU1F5?=
 =?utf-8?B?WXluYnNtOHJXYWlaRS9TUVRuMW5EZXZycXM1eFF6b25FWjJ1aUdTS2YzL3J0?=
 =?utf-8?B?aDBLU2Z4ZTdlbHZBaVROUWNHbmt1MWlzbWpqZ2d1Tjg1RXlzRUNETmE2L0tS?=
 =?utf-8?B?V25mUTdtaG85TFJUMFd4eVJ5THdBTHdRTGFYVStPcTc4TVlnWld2TXFSSVJm?=
 =?utf-8?B?V0NoTUtFVTJMTktwSlRXZ28rSzNrWDJDTndDQmxhV0tWNjhOU1psOEp2bFpG?=
 =?utf-8?B?U2hjK283UDBuL2twRkRmQUdxUnRWZS8wNjJ6NWR5OC9EOUNoR2pXZkM5d3ZK?=
 =?utf-8?B?VnJaVWFEZVZwaUtVb3l3SGdnd2dmZTNxTmxxMGRJWktleEluSXVLdTFnYS9q?=
 =?utf-8?B?OTVzL2w5d2YzbE5LeTQ4TWVWamhLVlE1cUVtQ1VRSStkVFpmdFlYWjFqYU1z?=
 =?utf-8?B?N2NXak1NU08xWU50LzlkSkROOGV2Ny9ya1FVR1dWcFA0UHVBeHllVUp1dEc0?=
 =?utf-8?B?aUw0VTA0N2s2QWs4SlVMUUxHMDVHRG4vRVZ5dDlEZFRGb3NwMW1TbzlLK0VV?=
 =?utf-8?B?RnJadThLUk9CalVmNzc1Q1RVSUVzcmFQK0t5eU9ZTnBWMnF4VXBRbFF4b0JE?=
 =?utf-8?B?NCtsV1EwcTZHQU5JU253dmZjak9KQlAzWTk3MDJpeXQrYm0yRDVIbkdpWkl5?=
 =?utf-8?B?c1NqSjAwTndQa1VyamdKY3ZVSXRkNm9ZSitlenA0angzK3Q1K0NieFY3cHA3?=
 =?utf-8?B?bjR1V050aDlqWFM3OTV0dkdVVWZPRldEUmlPcEt5cmZ0dWQyYUVvSjBtU1Nx?=
 =?utf-8?B?eUVQQ0VOdWRjWVZMTDkxdnNSeUNVWmxuSkFMSC9aUTJBZUJXSktqR2dpRENI?=
 =?utf-8?B?NFgwbWwvai84QjNxb2dLVWpJZm0rTUN4a0hKOFlKTWtuN28rMlU1YlhsTzM5?=
 =?utf-8?B?eHV3MWpsNHFLUjVlS2Znc2F3aWp3dGJXVG1wRWxtZ2psSSs1Y3gzRWNFWjN5?=
 =?utf-8?B?K0ltdVc3cS9ic0JJZDhkMThDbldjcHBFSENsZXNvYThRS3R2aTloUTlZWXRh?=
 =?utf-8?B?NERBcGhWZmdHUk0zaDVmRHlQK284WEZiMEpFWUdlT0FiMTBEK0pNY2ZDMUU0?=
 =?utf-8?B?clJEMFl5NEsxU3dxM1NLRWpRbUpqeXdiYUV5VEN3UDhKZjliem52MHJOaHB2?=
 =?utf-8?B?TGhoSjJNSTNUOHFhT0ZhS0RYbHBuZmhyNldWWU5LbHJIMDcrTmx6eUx3a1FY?=
 =?utf-8?B?ZUFXekJMNlBlMTdDVzlieU53YmRWWVlWK1UrbWlHbnoxbGdHNkd4RXJoRlds?=
 =?utf-8?B?TGVRb0pndmxLNEtoRTc0N21hU0JpcWpMZ01wemdZdE5CSk5tb0hMV0RkbVVE?=
 =?utf-8?B?dFFSQzRnc2FsQUtjZjMyY0k3MmZ4MWc0YU9vZG9yakl5T1E1QnBweVE4MTVH?=
 =?utf-8?B?c3JvM2Vkd21DZnRqOWRGS2dTWTB4OGdRSHd0Y0h3WjgwTU0xaWtJakhHalhy?=
 =?utf-8?B?d3N5d1J2UDV5NjV4eUFUTWJQSUtxbU9aeTVERlQ0NjlpQ1dvYSsvZkFEMkNo?=
 =?utf-8?B?SFNKcm1kT1djTGc0ek9Wa05DSlNLOWp0Y3FtUnBDOFYxb2lpL0JPVzFRTVhy?=
 =?utf-8?B?S1ludUd5S0RQK2p5S2hyVk1FS2FKRW4rTFhROWFkb3R2TE1DUVFYWFcyanJr?=
 =?utf-8?B?c1dXU1ViZ3VWd1ZGdE9oWUVRVmJKWE1kcmYvNSs5Y1A3cjlxQnJOdlVZWkRF?=
 =?utf-8?B?cStKWkxBbkl2ZHFXZ3hYMFAzRHFLdkpMQUp6Zkp1d0RrUktOK29oNGQ4VGtH?=
 =?utf-8?B?R1h3VnBGYnVVanpIWFoxY1pCWVJyblJueDYwK01wcC9PQ3NWZlpBVldDVlNX?=
 =?utf-8?B?UXFVSjZSeGZFRHp5NG1JK1ZEeHdjOTdLNHVoaG5nNDhZeUxZbGVMd1AwUXlS?=
 =?utf-8?B?V1kxTkZjZ09YbWZQVysyZ0MvU0pJQ2ZHN1RubmgvU2lGaDdTQUt0cG9GTm5G?=
 =?utf-8?Q?asOyl3GXeW0BSl95xP+EglqwegFGCmcoZ4HUZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0243B08705E3FD419E79223919652C24@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: d6rjsCsc460xUVsJTIxO8a2K1FCCCy36wxt8Ku2RfEyDC1a9Ypbnr6Izrb7AOD4LNecKC29AicXwdm5+n3QgH4Ff1RSumKM9jmCh/2XplJ3MsCC8qvGJmjoctcHEQ79bVRw7VBE1ovgQJNH3tYsYRZCGUnZ1tL4vAVxbpjKS52yy7OQQmgjnl9iT0l5SdDZsuc7ep9aKeIGen7WmPLoOy7x/A0CkEAuZ9nq9cl9iEQz94aRDVBb1N244BUFRKPF9eMH22A5fO1dC0WAy8eureZxHEQfxLeh7DIlgrXvB05xtnp4i+9r+fO0pzIlKyMIXT8XFNiKaAz5S6aIplU8UXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf5d914-8d32-46bc-e57d-08debb12f218
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 10:38:37.8078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cxxvhyG6bwO+yjkfRQ9MmKAdrMg7aR1iFl1i/1EreimiDNwO+CnigcUbHuGtryj5chvqBQ55EuZcv9PYwil/6g3JjCkEc8Y0jZd6+hWk3rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
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

T24gVHVlLCAyMDI2LTA1LTI2IGF0IDEzOjU3ICswNTMwLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1
ZHVAaW50ZWwuY29tDQp3cm90ZToNCj4gRnJvbTogTmd1eWVuIEJyaWFuMyA8YnJpYW4zLm5ndXll
bkBpbnRlbC5jb20+DQo+IA0KPiBDb250ZXh0LWJhc2VkIFRMQiBpbnZhbGlkYXRpb24gY3VycmVu
dGx5IHNlbGVjdHMgb25seSBhY3RpdmUgZXhlYw0KPiBxdWV1ZXMuIER1cmluZyByZWJpbmQgZmxv
d3MsIHF1ZXVlcyBtYXkgYmUgc3VzcGVuZGVkIHdoaWxlIHN0aWxsDQo+IGFzc29jaWF0ZWQgd2l0
aCB0aGUgVk0sIGNhdXNpbmcgdGhlbSB0byBiZSBza2lwcGVkIGZyb20gaW52YWxpZGF0aW9uLg0K
PiANCj4gSW5jbHVkZSBzdXNwZW5kZWQgcXVldWVzIGluIHRoZSBjdHggaW52YWxpZGF0aW9uIHNl
bGVjdGlvbiBwYXRoIHNvDQo+IHRoZXkNCj4gYXJlIGludmFsaWRhdGVkIGFzIHdlbGwuDQo+IA0K
PiBUaGlzIGF2b2lkcyBtaXNzaW5nIFRMQiBpbnZhbGlkYXRpb24gb24gc3VzcGVuZGVkIHF1ZXVl
cyBpbiBMUiBmbG93cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5ndXllbiBCcmlhbjMgPGJyaWFu
My5uZ3V5ZW5AaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBUYW5ndWR1IFRpbGFrIFRpcnVt
YWxlc2gNCj4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMgfCAxMCArKysrKysrLS0tDQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYw0KPiBpbmRleCBjZWQ1OGY0NmY4
NDYuLmQ4NTcwNGE1YjYxNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y190bGJfaW52YWwuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZh
bC5jDQo+IEBAIC0yMjUsOCArMjI1LDEwIEBAIHN0YXRpYyBpbnQgc2VuZF90bGJfaW52YWxfY3R4
X3BwZ3R0KHN0cnVjdA0KPiB4ZV90bGJfaW52YWwgKnRsYl9pbnZhbCwgdTMyIHNlcW5vLA0KPiDC
oAlzdHJ1Y3QgeGVfdm0gKnZtOw0KPiDCoAlMSVNUX0hFQUQodGxiX2ludmFsX2xpc3QpOw0KPiDC
oAlpbnQgZXJyID0gMCwgaWQgPSBndWNfdG9fZ3QoZ3VjKS0+aW5mby5pZDsNCj4gKwlib29sIGhh
c19jdHhfdGxiX2ludmFsID0geGUtPmluZm8uaGFzX2N0eF90bGJfaW52YWw7DQo+IMKgDQo+IMKg
CWxvY2tkZXBfYXNzZXJ0X2hlbGQoJnRsYl9pbnZhbC0+c2Vxbm9fbG9jayk7DQo+ICsJeGVfYXNz
ZXJ0KHhlLCBoYXNfY3R4X3RsYl9pbnZhbCk7DQo+IMKgDQo+IMKgCWlmICh4ZS0+aW5mby5mb3Jj
ZV9leGVjbGlzdCkNCj4gwqAJCXJldHVybiAtRUNBTkNFTEVEOw0KPiBAQCAtMjU2LDggKzI1OCw4
IEBAIHN0YXRpYyBpbnQgc2VuZF90bGJfaW52YWxfY3R4X3BwZ3R0KHN0cnVjdA0KPiB4ZV90bGJf
aW52YWwgKnRsYl9pbnZhbCwgdTMyIHNlcW5vLA0KPiDCoA0KPiDCoAkvKg0KPiDCoAkgKiBNb3Zl
IGV4ZWMgcXVldWVzIHRvIGEgdGVtcG9yYXJ5IGxpc3QgdG8gaXNzdWUNCj4gaW52YWxpZGF0aW9u
cy4gVGhlIGV4ZWMNCj4gLQkgKiBxdWV1ZSBtdXN0IGFjdGl2ZSBhbmQgYSByZWZlcmVuY2UgbXVz
dCBiZSB0YWtlbiB0bw0KPiBwcmV2ZW50IGNvbmN1cnJlbnQNCj4gLQkgKiBkZXJlZ2lzdHJhdGlv
bnMuDQo+ICsJICogcXVldWUgbXVzdCBiZSBhY3RpdmUgb3Igc3VzcGVuZGVkIChjdHggaW52YWxp
ZGF0aW9uIHBhdGgNCj4gb25seSksIGFuZCBhDQo+ICsJICogcmVmZXJlbmNlIG11c3QgYmUgdGFr
ZW4gdG8gcHJldmVudCBjb25jdXJyZW50DQo+IGRlcmVnaXN0cmF0aW9ucy4NCj4gwqAJICoNCj4g
wqAJICogTGlzdCBtb2RpZmljYXRpb24gaXMgc2FmZSBiZWNhdXNlIHdlIGhvbGQgJ3ZtLQ0KPiA+
ZXhlY19xdWV1ZXMubG9jaycgZm9yDQo+IMKgCSAqIHJlYWRpbmcsIHdoaWNoIHByZXZlbnRzIGV4
dGVybmFsIG1vZGlmaWNhdGlvbnMuIFVzaW5nIGENCj4gcGVyLUdUIGxpc3QNCj4gQEAgLTI2Niw3
ICsyNjgsOSBAQCBzdGF0aWMgaW50IHNlbmRfdGxiX2ludmFsX2N0eF9wcGd0dChzdHJ1Y3QNCj4g
eGVfdGxiX2ludmFsICp0bGJfaW52YWwsIHUzMiBzZXFubywNCj4gwqAJICovDQo+IMKgCWxpc3Rf
Zm9yX2VhY2hfZW50cnlfc2FmZShxLCBuZXh0LCAmdm0tPmV4ZWNfcXVldWVzLmxpc3RbaWRdLA0K
PiDCoAkJCQkgdm1fZXhlY19xdWV1ZV9saW5rKSB7DQo+IC0JCWlmIChxLT5vcHMtPmFjdGl2ZShx
KSAmJg0KPiB4ZV9leGVjX3F1ZXVlX2dldF91bmxlc3NfemVybyhxKSkgew0KPiArCQlpZiAoKHEt
Pm9wcy0+YWN0aXZlKHEpIHx8DQo+ICsJCcKgwqDCoMKgIChoYXNfY3R4X3RsYl9pbnZhbCAmJg0K
PiB4ZV9leGVjX3F1ZXVlX2lzX3N1c3BlbmRlZChxKSkpICYmDQo+ICsJCcKgwqDCoCB4ZV9leGVj
X3F1ZXVlX2dldF91bmxlc3NfemVybyhxKSkgew0KDQpJJ20gd29uZGVyaW5nIHdoYXQgc3RvcHMg
dGhlIGV4ZWNfcXVldWUgZnJvbSBjaGFuZ2luZyBzdGF0ZSB3aGlsZSB3ZSdyZQ0KY2hlY2tpbmcg
aXQgaGVyZT8gTGV0J3Mgc2F5IHRoZSBhY3RpdmUoKSBjYWxsIHJldHVybnMgZmFsc2UgYW5kIHRo
ZW4NCnRoZSBleGVjX3F1ZXVlIGlzIHJlc3VtZWQgYW5kIHRoZSBzdXNwZW5kZWQoKSBjYWxsIGFs
c28gcmV0dXJucyBmYWxzZT8NCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KDQo+IMKgCQkJbGFzdF9x
ID0gcTsNCj4gwqAJCQlsaXN0X21vdmVfdGFpbCgmcS0+dm1fZXhlY19xdWV1ZV9saW5rLA0KPiAm
dGxiX2ludmFsX2xpc3QpOw0KPiDCoAkJfQ0K
