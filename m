Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF85C10FC454
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 22:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A54410E03A;
	Wed,  8 Apr 2026 22:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvraDYne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F72710E03A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 22:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775685772; x=1807221772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MHPInv+CQFwrDFouu4IIW2Vw23ViEcA6rTGMqnPWVmU=;
 b=hvraDYnemmpLVmFc15T+RUiClNVGzTToRVavXz1JIklFA/mApFtE1h49
 4MhbHaG04dORFeUG0OsDi/cZRhWeXyqeHP2scQDlFXj+7GkRh7ak5INa9
 ZsLDLcZTIncdOqV3XfhFWu7GWvagb2uqXrLnvQesSeqIoXSSfFro8DLfZ
 xNhiJj9d+nbBbaZugkhKe1hpKrKiOz8jXQzns4D3xJI+hOk61xrLkZ94s
 nBUAWUHbJczAy8AF/hz1XoRiARe9AyFanvMOMrGWau+22gmrKS26SCGBm
 z4+NYu/gkcxEFJL9KseHWPVrQRCKI+ZkX+sU4T0QV313MtBfIUNv47FtI g==;
X-CSE-ConnectionGUID: 0v+ozeyMTwimYG2UjAytvg==
X-CSE-MsgGUID: OviKHLBZQvuaMYlmPMvoBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="99312523"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="99312523"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 15:02:52 -0700
X-CSE-ConnectionGUID: 0REDe/L1RJCpOql50YZ+IQ==
X-CSE-MsgGUID: 7H+jJaOKRI28kxw8r6+MsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="228820750"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 15:02:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 15:02:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 15:02:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 15:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqserlvMwBILf0uSkPn4tlbpEFnG+tNsGaEJN6LxCjav83SxTKddkRCWIPpK15pKptHB3NDJCo8K+/6MoYh41jOJH1lGzbQq6PZt/5Ksvb0tV26HPvJWL7oW0WJGdEGb6/kRHci5vQ2YtLib/7B/rfpMjcnkUXEXxQC2d4pWE2e/DTUioqJnDAr8OisoE+2i7avaXDVycJymsPQRj/z1yQtDi1xPTEh6VHlL4Bdw5SWXAJG7kz4I54OISyUhQO+8a1KP/Lc4PzPBJY3bH0oWpNM4HBKqPxZIz2emYWddANSKXTT7LQckesvISSH2GG69po4YwqI6KZxpksKuUpOsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHPInv+CQFwrDFouu4IIW2Vw23ViEcA6rTGMqnPWVmU=;
 b=esrMZJqeYo8HOmJbvXqLZOcUZs6EBz072+BmkbkZJQcNKpkFZpbtoakoPlcYJpqX2F5NjMxfycEaRJGbcKiTnf8e3rq2U7PtgMIZ3pHZs+WCFis++rTtZVuNBv8F7kDGGKWIKcstcES5OYKsJQzwooOkDEtbVjvnybKz4/bXy3+g14vTqRosBapj4T5fN+HUmzCRXfHfaV449EqBZboMcw0Zjl3C9exll69LXd6DbCK6tXAFD5j4NJd3yYSLnqX8lp8rn6DemMqdafHQMbe4oE3qEMJd89jEWNjk2YCu77KuVDo55ezoW5Dw6g/mOt0TSewd1PNwUfmDL++pWgJF1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 22:02:37 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 22:02:37 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Topic: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Index: AQHcxhg8yO26mtYm2UibF1dNW13x57XTWxyAgACYxoCAATRbAIAAkmKA
Date: Wed, 8 Apr 2026 22:02:37 +0000
Message-ID: <0e92b7492481ae3214630878e40f405aeb7f0d2b.camel@intel.com>
References: <20260406225338.98533-1-stuart.summers@intel.com>
 <fa58f4c0-d126-417f-803f-7a521c5df8da@intel.com>
 <4c38349fdee090e69100437781c3f5cc2a354b4c.camel@intel.com>
 <07168815102825e019bfd6eb7ad9b82dd0040953@intel.com>
In-Reply-To: <07168815102825e019bfd6eb7ad9b82dd0040953@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB8278:EE_
x-ms-office365-filtering-correlation-id: 9041941b-e2a3-47a8-7e5b-08de95ba8bbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 1AtrnOUMclDNV3ocODFoUiZpQb7FTFZpDXI0z4ZY00V9UfBJSSuHGjrNizY3fU2r07xoxQcVq1+CA9vEtNM7nR90LUXom07kBccUvt+xKHMXidebx6e8qEUaVZim10/V4dkWPYMAmY2d3oEl4REvePsxHqvdGctpukqoYvhgmjEiUxRgMxoDzEEfXMYq5Ij6vPhniTEECsgkmqJBDtUhtafVjaA4ecPW9/YyjtC6pPngZ4RIQl9CqT82MnihVWOLsBIbF6Vd56o7/o7T70KDoVCZzsV3F0+INKxfin8NGgBA/hBSfZFxUfMiBHMg4pPPHKkljHRw+NlIWmHfwr+tklA/LKbMMDJWQFbXHGoS9puZpESbSrwXf2zJj78LQOJDMee9PbBj4Qq3+gQeENBDUOEkF6bKuOgQcAAHdiMHqBgghsEvOIXRVzb7lmZt2obr3Y3e9YpElljO96zMOfC+zH8sDW20szn0N3meVMHuxXgwk9ifTDu396f831vyQY3K+eb/Z6KM+M/0RJ6K1KedO1LfhxTVf5dZZhxGvdDS9RkYxRBn5CNFdxa/VcuDBBY0sTjkkFPHSwT9jH4v6NaSx3wSGyzQ+W2SQQYjtiK8jaq/4Is7wvJgFeF2j5Q86T6pWZ3TuogWUjZeLSXHOIUE34pqBtBHO5AScSITJrqWdL7/1crddevrAwYorz+bbIhO95qYCMHJwo4F01m21dzhE8XKPjrkWhOwOIX91TElivPyuBUtQL/lIeXiCwUiTM6vpsqNCQrs2eRdDl0KVAe3PMVeWjBifmLgf+axTKMFBmE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzFkcTJEcVN6enMwUFVuUDRZVUFIVmVRbEJwbzdJY0l5UjNiUEVRYXNmTjQv?=
 =?utf-8?B?WXJuWHZLdEZFbUJacDcvSitoYm9HYjBNanVjcHplbmlDRDVOUnRBYWJOQmp6?=
 =?utf-8?B?dHVTdTdza0RBdGRUMFRwRkpWVk1BT3U5VVZnb1ZmbVR6Um5kakdQc2dRbDVQ?=
 =?utf-8?B?YWNMa1hPM0Y5czNxcjdtSEJ1aVZWanEvNzR1Y0NBVHoyZCtDTE0rVkFtSWhF?=
 =?utf-8?B?Z2grZ0J2ZTRBZE1jWUZxMlg5WnpsU2FhbFJQQkRPaUdwbFR5SzJKditrdk5j?=
 =?utf-8?B?SFhmbmw1dVYvOTd0Vlg1T0xzS2dKSE1sY25SZXVBTys2elhabVZabXlwK2Nj?=
 =?utf-8?B?QW4xUjU0QzUyTjBSeXNOV2oyV3NsWVA4L2xxTCtOb0tUTjJFSHVNdHBXL3BC?=
 =?utf-8?B?Z1hkVDdQM0xBVFN3bGUvTWlrRVZZM2RtUFFEblh6aTBYVklaQ0RGbTBGYkFy?=
 =?utf-8?B?WEIzR1Bia3k0T0hYOW93TlVNNXJ3amk0Vjg1WFhxQlBxb05URThRQXVKbEtE?=
 =?utf-8?B?anppbmZVWXhQam5CUVpwM3JwUXVCMGliZEYwemNZMnBpOG8vSGkvdVlHQU1u?=
 =?utf-8?B?STZrZU9HV05QNmdqclpNN05OYkI0ZkgvTnZUNXBBTVJqN2Vva2J4bzEvSU5X?=
 =?utf-8?B?ZHN4YmpBWDRQd0pzUVB0Tm1LMXNGb3dTMFhFQVkyVW1rb0wxcmlrKzZwdDhW?=
 =?utf-8?B?L2tWc0ZUN29TQU9KM01FdzhVbzBZbEFnaVpjSUFjWE5zQy9PQUpYa2xmVS9F?=
 =?utf-8?B?SitEVUNFNlM1MUhvUGREWU0zMXhKamtBSHNkcmgyb0JkZEJhbjJ1cm5jSG5o?=
 =?utf-8?B?TnBLcmxLSnNaUXdYa3duM1A2SDNUbUsrWXUrS1FoMWdkYzFLUkxmUWUrbUE0?=
 =?utf-8?B?MWk3OEc4L1VxeVZjZXhkdUR0d0ZSS1FhTDdFQllQbTgwTDQ2OCtnRFI5YkI5?=
 =?utf-8?B?TUFnZUhtL2Z6czQ1a1RYSk0zK0lobnlUOGV2dFd3SThYcHRWVlp1REhseUNX?=
 =?utf-8?B?NmNCTFBvL3dYUU0zTERydlpmS0hTcjBnRWl6b3I0MVdNbVFmT0ZPb3NKSndR?=
 =?utf-8?B?eWVTcTBnL3BUakJsL0NSdGVMV05CTTZYTi9BU1VLYlFKZityYlk5WU1KbUEx?=
 =?utf-8?B?NlZlQzlLWGp4cDRvSEFRZjlQY2xKemxHbTRHeXB3SFpJU0ZYRU5vWHlpSlJ4?=
 =?utf-8?B?WWVuU3B5cUQ4TGZjQWlMZnMwSmhsMXY4bWo1Y20vV0NjbTFPVWljSzhtTUR1?=
 =?utf-8?B?dkVkVEJySmk3dXhST3ovSTBiLzFMVzZPUmJNUUxEM2hYL3kwQ1ZscU1zY3Nu?=
 =?utf-8?B?d1dCNnVaeXcwczRnMGl3M1E0ZUFBWTRGSnJuM3FUbk9iWFBlN0IvT05wOEJI?=
 =?utf-8?B?aEZOZDRnRHBYc08rSVFiL1Fqd3V5YVhEanlnT2xtTTMyZ3ViZmUxTUJoeVFG?=
 =?utf-8?B?cGQvZ1c3UFQ4TGpZQ1J6QjNrQStsRlc0Q0lNWE13US92RS8wZ1M2dGoyMEFL?=
 =?utf-8?B?ZmJvTldMRUl2K29LQ2dqTm96MlVGQkNvODdZVnM3WGdrNmx3SGVPZVlSakpT?=
 =?utf-8?B?NVpCekdsc1dwYm92YldsT253Z1oxMnE2WmhlZ0ZZclJ3Y0xMcUtwMmJIcEU2?=
 =?utf-8?B?NGh0SFM2WHQ1MGI0Vnh1VEoxMlc0RGwvK204R1lNbW5maUhQM2RDbkFCY1VK?=
 =?utf-8?B?QlFxUWZJL3JsVGdBd0luZXh5bHBXTG9wbUVDNUg4UTJsQnZwMnBQOXFrOWpW?=
 =?utf-8?B?QU56ZDVEczk5VXJ5ZFFiLzBybDZmYTkzekE2WFVPM1lVZ2FNcGZ1VWRiTDIy?=
 =?utf-8?B?L1pyVXA5bWlxVXkvN0NiZFZKK09ZUUhvSktMMFVQamZsNU5ZM3ZMelpjNmY5?=
 =?utf-8?B?ZGpGVXZrOHkzb1VGUm8veVlua3pTV1draDlaOG4vK050bXBuM2lCNVNNUXhK?=
 =?utf-8?B?RVVFUlJPb3lHd1c5WE1tOEwvMW5MUmt4blAzUThRc1RsYk5PNGhPTFVVTnc4?=
 =?utf-8?B?aDJNaUplRVJhZStWRHZhOWVvM3NWZlBUMXJhZU5kdzlTbytMb2VrWDR5S2hX?=
 =?utf-8?B?cml3dWJkTWJCN3FQUUVFWG4zWWVrUW1ycGV5ak9QbkZUdmRNWFZUV25Nd1NU?=
 =?utf-8?B?V1pHaUJRMnFOd1RvaEJ3UER0Rk5ldS9laFN0TkNIblhGc0dJV1lTcEI2amty?=
 =?utf-8?B?dmQ5MkhFN0pmZ3FJVlBwT3ZSVk0wN0ptRHFpcnpyS2V1RFo3anlSSHYwM2hV?=
 =?utf-8?B?NVhiVGFhbUFMK1RtM0hwdUNpTGlxck51SmJjSHNNVE5OVkhSbngwd1V2VjZK?=
 =?utf-8?B?Mlo2Y1ZFeDdWWEE1Y3l6UDJVK2RRWlRmNmErQkFXVXF4bUw4NWVNTjZGcjVm?=
 =?utf-8?Q?xF9sOw3lbYNMchRU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3459F5065D63DE4BBAEAFEC512B2E660@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l0OcMvsa7sLyHgf0CXdVeO3XvY9qDKw6lHIlL1K3I2MlFxHj6hhYmlC0xOLCdvZ/b9p+qyfUKCuXDu6Q2yJvSwlnssNzkirgDfUbFQjjj+sw95g3uXsBafPTOl91YeYzuR8PuS1u5gbmg+wvZJpARWfMNkcjvikUK2bgN0nUhTh/Vmba2OWUI0DxSF+1mC4x5jRf0QEpobxOIzkONOeLR2Iq4d80JWXnpwehr02a6YD8nGKrTRUosEcK0RhQ+wXT33DpPu2fxcvUdM+Z+XyNuu09N3pzu1CDlPyUYQr+ZWWNVtCesCFQ6rK7t1i9lpuWG2mhdVUNO35ASqWjkZJTug==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9041941b-e2a3-47a8-7e5b-08de95ba8bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 22:02:37.3639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RvvCliItcUga9+yBlo5Eh7gzRfCfvomvUgflYA4ReTg7qKDr2QQPbMNs8l8DKPfuDyAWcq0ha2ahdka0+A2QnkRPyq3rNRpk4oEzkOqYxRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
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

T24gV2VkLCAyMDI2LTA0LTA4IGF0IDE2OjE4ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVHVlLCAwNyBBcHIgMjAyNiwgIlN1bW1lcnMsIFN0dWFydCIgPHN0dWFydC5zdW1tZXJzQGlu
dGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI2LTA0LTA3IGF0IDExOjQ4ICswMjAw
LCBNaWNoYWwgV2FqZGVjemtvIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBPbiA0LzcvMjAyNiAxMjo1
MyBBTSwgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+ID4gPiA+IEZyb206IEpvaG4gSGFycmlzb24g
PEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBHdUMgcHJvdmlk
ZXMgdGhlIGFiaWxpdHkgdG8gZ2F0aGVyIGxvZ3MgdGhyb3VnaCBhIGhhcmR3YXJlDQo+ID4gPiA+
IGludGVyZmFjZQ0KPiA+ID4gPiBjYWxsZWQgTlBLLiBGb3IgY2VydGFpbiBkZWJ1Z2dpbmcgc2Nl
bmFyaW9zIHRoaXMgY2FuIGJlDQo+ID4gPiA+IGFkdmFudGFnZW91cw0KPiA+ID4gPiBvdmVyIGdl
dHRpbmcgbG9ncyBmcm9tIG1lbW9yeSAob3IgaW4gYWRkaXRpb24gdG8pLg0KPiA+ID4gPiANCj4g
PiA+ID4gQWRkIGEgaG9vayBmb3IgdGhpcyBhbHRlcm5hdGUgZGVidWdnaW5nIG1vZGUgdmlhIGEg
Y29uZmlnZnMuDQo+ID4gPiA+IFRoaXMNCj4gPiA+ID4gdHJhbnNsYXRlcyBpbnRvIGEgcGFyYW1l
dGVyIHBhc3NlZCB0byBHdUMgZHVyaW5nIGxvYWQgdGltZS4NCj4gPiA+ID4gDQo+ID4gPiA+IHYy
OiBDb252ZXJ0IHRvIGNvbmZpZ2ZzIGZyb20gbW9kcGFyYW0gKE1hdHQpDQo+ID4gPiA+IHYzOiBD
b25maWdmcyBkb2N1bWVudGF0aW9uIGZvcm1hdHRpbmcgKFNodWljaGVuZykNCj4gPiA+ID4gwqDC
oMKgIEtlcm5lbGRvYy9jb21tZW50IGFkZCArIGNvbmZpZ2ZzIGVudHJ5IG9yZGVyaW5nDQo+ID4g
PiA+IMKgwqDCoCBPbmx5IHNldCB0aGUgZ3VjX2xvZ190YXJnZXQgd2hlbiBHdUMgbG9nIGlzIGVu
YWJsZWQNCj4gPiA+ID4gKERhbmllbGUpDQo+ID4gPiANCj4gPiA+IG5pdDogd2UgbWF5IGtlZXAg
Y2hhbmdlIGxvZyB1bmRlciAtLS0gc28gaXQgc3RheXMgb24gdGhlIE1MIG9ubHkNCj4gPiANCj4g
PiBPayBtYWtlcyBzZW5zZSBJJ2xsIGRvIHRoYXQgb24gdGhlIG5leHQgdXBsb2FkLg0KPiANCj4g
SXMgdGhpcyBhbiBpbnRlbnRpb25hbCBkZXZpYXRpb24gZnJvbSB0aGUgcXVpdGUgcHJldmFsZW50
IGRybQ0KPiBzdWJzeXN0ZW0NCj4gc3R5bGUgb2YgaW5jbHVkaW5nIHRoZSBjaGFuZ2Vsb2cgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlPw0KPiANCj4gSSdtIG5vdCBkZWFkIHNldCBvbiBlaXRoZXIgc3R5
bGUgcGVyc29uYWxseSwgYnV0IEkgZG8gbm90IGxpa2UNCj4gY29uZmxpY3RpbmcgcmV2aWV3IGZl
ZWRiYWNrLCBhbmQgcGVvcGxlIG5vdCBrbm93aW5nIHdoYXQgdG8gZG8uDQoNCkkgYWdyZWUgaXQg
d291bGQgYmUgbmljZSB0byBoYXZlIGNvbnNpc3RlbmN5LCB3aGF0ZXZlciB3ZSBkZWNpZGUuIEkN
CmRvbid0IGhhdmUgYSBzdHJvbmcgcHJlZmVyZW5jZSBlaXRoZXIgd2F5LCBhbHRob3VnaCBpdCBp
cyBpbnRlcmVzdGluZw0KdG8gbWUgdG8gc2VlIHByb2dyZXNzaW9uIGxvb2tpbmcgYXQgdGhlIHBh
dGNoIGhpc3RvcnkgLSBidXQgd2UgY2FuIGdldA0KdGhlIHNhbWUgbG9va2luZyBhdCB0aGUgbWFp
bGluZyBsaXN0IGFyY2hpdmVzIHdoaWNoIGlzIHByb2JhYmx5IGV2ZW4NCm1vcmUgaW50ZXJlc3Rp
bmcuDQoNCkRvIHdlIGhhdmUgYSBnZW5lcmFsIHJlY29tbWVuZGF0aW9uIGhlcmU/IEkgZG9uJ3Qg
c2VlIGFueXRoaW5nIGluIHRoZQ0KZ2l0IGZvcm1hdC1wYXRjaCBzZWN0aW9uLiBUaGUga2VybmVs
IGNhbm9uaWNhbCBwYXRjaCBmb3JtYXQNCmRvY3VtZW50YXRpb24gWzFdIGRvZXMgbWVudGlvbiB0
aGlzIGFzIGEgcG9zc2liaWxpdHksIGJ1dCBub3QgYQ0KcmVxdWlyZW1lbnQgKGZyb20gbXkgcmVh
ZGluZyk6DQoiIiINCk9uZSBnb29kIHVzZSBmb3IgdGhlIGFkZGl0aW9uYWwgY29tbWVudHMgYWZ0
ZXIgdGhlIC0tLSBtYXJrZXIgaXMgZm9yIGENCmRpZmZzdGF0LCB0byBzaG93IHdoYXQgZmlsZXMg
aGF2ZSBjaGFuZ2VkLCBhbmQgdGhlIG51bWJlciBvZiBpbnNlcnRlZA0KYW5kIGRlbGV0ZWQgbGlu
ZXMgcGVyIGZpbGUuIEEgZGlmZnN0YXQgaXMgZXNwZWNpYWxseSB1c2VmdWwgb24gYmlnZ2VyDQpw
YXRjaGVzLiBPdGhlciBjb21tZW50cyByZWxldmFudCBvbmx5IHRvIHRoZSBtb21lbnQgb3IgdGhl
IG1haW50YWluZXIsDQpub3Qgc3VpdGFibGUgZm9yIHRoZSBwZXJtYW5lbnQgY2hhbmdlbG9nLCBz
aG91bGQgYWxzbyBnbyBoZXJlLiBBIGdvb2QNCmV4YW1wbGUgb2Ygc3VjaCBjb21tZW50cyBtaWdo
dCBiZSBwYXRjaCBjaGFuZ2Vsb2dzIHdoaWNoIGRlc2NyaWJlIHdoYXQNCmhhcyBjaGFuZ2VkIGJl
dHdlZW4gdGhlIHYxIGFuZCB2MiB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4NCiIiIg0KDQpbMV06DQpo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0LjExL3Byb2Nlc3Mvc3VibWl0dGluZy1w
YXRjaGVzLmh0bWwjdGhlLWNhbm9uaWNhbC1wYXRjaC1mb3JtYXQNCg0KVGhhbmtzLA0KU3R1YXJ0
DQoNCj4gDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+IA0KDQo=
