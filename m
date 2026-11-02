Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13881606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oIDoU8I+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA4810EDA9;
	Mon,  2 Nov 2026 12:54:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D15410EDD6
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793624087; x=1825160087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T77zIC7Jgnw0TTlerP5LGlfh4KdId2LlbZWv5bMb6hY=;
 b=oIDoU8I+t1D7tyxq8V0VOXf4dx/OW6A/oI/ZF9qxzehb9fchr/z0v1Tp
 S4OuSHBehHcJKB1h+A2QL/5IXd/5nAWy675SEaW84mDtYOMCA8DcGoj7O
 n7zgtj+0EYcDig1PO7Po4OpXSUbpdYlZHeQGospYW7VUjaVv5J65EQgVm
 y3xy6rGhHYoI1HNE2Iqma65J9tmwom3M+vTMe4PygXcu2eA7QE5G82FeI
 BLyRyVk+cwtApgn9vHQiKYaDjkiNqTU+qfpeoeTQ1sJ5lDWY+RP7WxG2a
 i3v0B5vKzTBOFEuVVesRDjT0piqdZhN7JWrZX1X687nSj2YxTnwX5FTve Q==;
X-CSE-ConnectionGUID: 8XOMSfXwTo6TsvM0XE3hQg==
X-CSE-MsgGUID: Ey2kD2w0TaW7V55RSBXFvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2325805"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2325805"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:54:46 -0800
X-CSE-ConnectionGUID: o20rC0d6Q2miifJ906H8Zw==
X-CSE-MsgGUID: sNEq6FozT4ubZ2Ndkv2+2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6288709"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:54:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:54:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 04:54:45 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:54:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHG7cxc3uUxKv5xRZZrSyzxSMeR9mAsvNK4TctcB1zCljvM+zXhmgfZY1h7Qc8zJ8CSFUqaYuGwCE9UnwEdWStevWQhzxO6AdDk+8uVoGiX7g6rDgybDh08Z6xL0Nf2O62mr2C7A8Vze8NtahZZ4Fd1KGVSsYsyfUtylJjxU5mXSVgvUBELVs4GwzDt3Z8BssTn5SbcOtgEzkM0FQ4JSuitw7YncVSL5TL9FLbnw8GncwkQtxlIbQaVTe9w5L3G9hVgCuvle0vK+d2QKIULXcz2/oTUpbCXUuBNXduCmHK67SCwUdZMkrmQmzT7bI5dXnHh1iIc1QDr57J0jQ1KIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpIH4vgesjVXPhGBQCmvytxMAVHJClGKJQJYHNYQhlM=;
 b=Wri+mI/BazeNsCxo7wYCPyX/YjZ28qIBQc4P0392OSR7vFBUYtJluDAeDOdQqshA3/AdCcDaEnEebw6Tr722OISp1bnTmfNBFANWapNMqwk1k45v/33B/XBdU/joPVBnHYAUFvFeHjT4XlI2Z8C10/Ej+XoRO5xbLGBnnYqBCDDa0HOUse8DOKhGsOREVj5zuTEGICGbRxYQ74cQfZmTCOLBR1OK0Ad0ghCAYTriKlC99ivpxcu1giYbf91CWuDlg2s48K6nV4yR1JvQrBa8yDyU4W8swLy/otMbkwuTNd66TZsjaAFcQGbPJVPasJtEuoabNiD+BZpnFuGxwZbRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:54:20 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:54:19 +0000
Date: Mon, 2 Nov 2026 18:24:12 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v2 05/10] drm/xe: Bail from adjust_idledly() if no
 applicable workaround
Message-ID: <auiH9H2NZGsRZCht@bvivekan-mobl1>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-5-919fa1c27070@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20261030-wa_16031259911-v2-5-919fa1c27070@intel.com>
X-ClientProxiedBy: MA5PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::17) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: afbd915a-099b-435b-bc64-08df38e06918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|261021123027099003|260925021911599003|260925022911599003|260925021311599003|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261021121427099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NKQDOb9IzJsTxnj1CV9XMEpD85QZshTsz0ygWI/lUdU2NJYF/q8+r/9ZveBP0k5s7HnDGvUHZ57iV1urZAcHit92VjBWHPsOvAa4l1FIUhhOM4K/IYf7uNeQkoUlRKiJs7ru8uWQzk2swmCirGWO4auXJrS5p5OIVGZRaqVOKzOyibFtktGBqyVqaIxk7wa8qMawd3dM1taCi32hC1Sanf748Z8xMAev303LFQbGCiJyzNi2DbsKpjBent5T45/zveMo2YLhd+E8ems4GwifJorEvMqZgsu75+AUfoNO7vA4B7KVKXYIXcMl44h91jY+ayHibXpaPuKHL4GzowQwE2HIz2LSTFROK0HsZnbWAxwZPZc6oIylv3UEBI7LGTgz7BUPHMUlAZz1LPu825XBGKoPv10+/xQpsxeWKofoQEwEfr4F4HkhXlAz3sP7k5x4VSA+nEDXY68KV7gm8O6P2pegmPIVbtV7mGz5y6w0JmCt22VzC8SlO9G5upcYWqRhfFGRc3iKU3h29s6N+2YBLlnrFrwToTSI1nZOs128N+YbY1geLik2agDmxX27x+NwGcOC0fW0cCShw+4f0Iausm3mIX6sXaESv1Z3Bus/wNARcYKUH1hH+4NxabCMW4+apijriVhaxIFtFtbJGr7lRD0W1Yd35yluyDwV4B6+Xq0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261021123027099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEQzeHVHUXJkVnZJdHIzak1Sd2FwemZ5dERLZjMxZDRwMlV6QTJjTnVSTGtz?=
 =?utf-8?B?VXMydkphYVRZVks2ZUtlaG0rZFErS2tvbk1SaDF0UG54ZDhoUUNiUkdDVkxW?=
 =?utf-8?B?TlFCenQ5dGlDazI5RmRKNFppQk5xcDdQQk55UVpYTElsRElod1pZYllKU0hX?=
 =?utf-8?B?RXdEYUtTMWFBbnFhaTlQbUkwbUZDcjNlZDFDSFRYYnAzQnNJdzBDM1pGUzNj?=
 =?utf-8?B?ZEVTSThFMVczMmo4eS9UemFjOGM5MlFhc05XeVJYbjcwK2Jpby9UNkdCZTUz?=
 =?utf-8?B?MHloaXd3cVdPUFpoa3R4bWNWQ0MvQ3ZWU0NxdzZqYStseGNoS3U2RGxGSGta?=
 =?utf-8?B?YjdWSjh4MXhpK2k1YW93RVYxd0p0bndSNmtBcjlUR2dvQ1dnb3AwZ1I3Qmkv?=
 =?utf-8?B?WWtOOXQxNUpTVGZhU2U1dGxoeGFwaWhydWNNWlFSSjFKZVp4Sm05T3I5M2I2?=
 =?utf-8?B?TmI0WkVpQ3dKUCtFNWRJY2FJSVRpS1UvcENRSFBxMFJ5RE0rZEVsTENkVzlu?=
 =?utf-8?B?OStJV0g1Z0pYQXN2ZUFndWhzM0ptd3NJUERKdXBZOUo0RDFZWWFnM1hqNEUr?=
 =?utf-8?B?bldHYUNIQjh4NHdZbFRZc0svclhFNUkxVWJ1Nm1KN3Z5RDVsNjhEMUdWSWNy?=
 =?utf-8?B?OUNMN0RBQkhWbjJBVWc2L3Y0S1UyY3pHTmF0djBCNGx1dXMxK1kzYkMvWVhZ?=
 =?utf-8?B?S045QmRkZlU2RXp4enJtSjNJRXdETnZEcnU4dTV0K1pUeTZKbjRxWUlQRFBo?=
 =?utf-8?B?NDFwZW96QndGNjFKWlFFclpBakZKdFZ2QS9SeTZ5SnhWQUE3QUZXem9tcWtN?=
 =?utf-8?B?NGgvQTB6UnR3ZEQ5VTgvcDhvUGZjNm54enpKYTBaWGw0YS9PM3dKTXRObnA2?=
 =?utf-8?B?SnFkRm95QlNlYlVHenREaWxrSDN6d1R2cmVzZHVBU1pZUlZwNm8vdUExczFM?=
 =?utf-8?B?dnVObG1Ba2R3aVFBV1ZTK1FxMXRGRHJieFptekM2N2pMVWtZWHpicUhCTkd4?=
 =?utf-8?B?TXlOcEFERTU3TVNibU1lek44SXd4VHJTZXJ2d0Fpbi8wS2NwM0xUcXVNRTdV?=
 =?utf-8?B?N2MrQ3o0MTZtS2lFNDd1Ly8zY1FwYnErdXgwK3NvTmMxOExTckl1VWhWNGpJ?=
 =?utf-8?B?cVRxTHRzd015N2E1YVlzdnRnZUdpMkN0VlJORGNUZStodFpSeHFrUFZPT1dJ?=
 =?utf-8?B?bE9UWkYxUXFoVnp1RzF1R0NQdVBjeTRxNEIwZVowSzB2eXV0WkxUMjJsVHU0?=
 =?utf-8?B?K1B4bmdZd2VsenREUGo0eEVJQUNzVEUvUkFWdi9XZ21vL25mVEpUVThpUTg5?=
 =?utf-8?B?SVA4c1BtcnFuWEtlNVU3NDJITjBqTjZFN2VaU2R1a2RHa29hb09BVXRKa0Y4?=
 =?utf-8?B?RzdLSjVoMzlsYnRUY1FjM2hrNTFQSjY4bWVWUisycnFqekhjVDcrQXk2UzRj?=
 =?utf-8?B?dk44VnF5Zi9sY0U5QzdDcncwOUxKRkFIZlRndGhFRm44R3JuT01Ga1JISmRm?=
 =?utf-8?B?bFZLVGMwT0xnU2Y2blF1SEV4VXFLdnQzemhGYUxLVzRZZVE0a1k5SHNSa09F?=
 =?utf-8?B?TnU4bEVsdEt1SXcvK2c0ZWxoV0FtamFiRlNYSzIxdzBaQzA4U2FTQzlraVp0?=
 =?utf-8?B?UHdFWEtqdnlkNUdkeWQyenNJckppZE1WenQ2Z09Va0JHbHo4VkFEY3ZZak5X?=
 =?utf-8?B?a2p3cXlweGxTSTFqQlB3ZG54K2RXZTd4MzB1OTYyT09lNG9aaFhhOWRCK2Z5?=
 =?utf-8?B?RDFLRDJCSW1pYW5CdU1laE1VbjJnb2V3ZE45d3ZmMklQRDVpSnIxOW5qSVRF?=
 =?utf-8?B?VHZrWUgwbXJKZVZHYzQ1bTdDZDBFU3NTaWExQytzazdFcmZrL1BScko2bzhZ?=
 =?utf-8?B?OVhkVVhvTVUzZTJ4VWV6MG9PTmRPL0dhbVFiOGJSZFFoQkVCNXNLaVJXaTRs?=
 =?utf-8?B?dk0zVE94R1cvYWF0R01rRFVXUnhwZFVkMVhxeE5WZHdWR08rd0ZjZlNoU3Y4?=
 =?utf-8?B?bmY4NjlUU3YwL3lQMGYySlJNYXBFMStQTzlScU5KaDVWZFB3V0hlSFpmdUU2?=
 =?utf-8?B?c0lsY3NMc055dzViWE5oVzhERUt6b0dmbDhEVVdNL2RvaVZpR29odkJIdHh0?=
 =?utf-8?B?NzEwYjdDUDRCdnlzV0pLTkFRNWVEL3owYmJscnF5elM3NzdJdTY1emR2M1Nw?=
 =?utf-8?B?Q3FhSTV4dmlpTGsybFN2N3puMEdJeDZ1Y2pxQThVUFlyNVR6UmMycCtzUys1?=
 =?utf-8?B?RTNGMDhrRG9xdHRhYlZjcmFOK1cyS2MxdHl2YXhoVXFJVU5HMEVPWHkrRGtx?=
 =?utf-8?B?elBSaVdpK1d5NWxEVnI1WlFQY3dwVDJidVBBNEZLSm1mRVJQK1F3bmpJelI1?=
 =?utf-8?Q?0xIFRb0qZvZN+74ByHQgDMnEKQlchediy4r1y?=
X-Exchange-RoutingPolicyChecked: l5CUSAnBPa5Y/jHcRAEpJvyQQZ4lLxI8OFjIp9y3jB9i7uopfKQYCCWK7BVwsIB/Ab0EmFJfs0Ssd5qVZ69I/WGrnx30YtHcEez7P9HVCLVu4CgrIzcwPphvBE+tUf/1QKI7tp7SkjqJ0NTB5onXeDoeQ93Z2HiiKaVJHDxufTaWjmAvew8yTmCgIxaUy2yQgu9f6HMJmAGNxsM6CuZUU4+J4MfqpcJhzfIrGUsvKDd7Q9zt3chOG9dJhFGom2/OipBkQACbuaR/oeBVZcpXRyHrieGL0/tKWNgTot0aCti7a5OmcR6cpeD4ZMpQxTVogva5FC97roziVIs2F3LWeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: afbd915a-099b-435b-bc64-08df38e06918
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:54:19.8033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtpDMTR2koI138or8ftKmX00IH7gljTRw55w5O7KjuBep6kqnfa1DrxvlBAtC+bswN2nxZ4/mokmooSCWcWdZGM2yX7t0Mln3K+naFiQFlD+g+oY+BxrQ+NlbalDl+gy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30.10.2026 19:57, Gustavo Sousa wrote:
> Re-organize adjust_idledly() so that we return and avoid touching the
> hardware if no applicable workaround was found.
> 
> Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 01a7baf061eb..32d33c70e7f4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -605,7 +605,7 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  	u64 idledly_ps, idledly_hw_ps;
>  	u64 min_idledly_ps = 0;
>  	u64 max_idledly_ps = -1;
> -	bool inhibit_switch = false;
> +	bool clear_inhibit_switch = false;
>  	bool wa_applied = false;
>  
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> @@ -616,12 +616,6 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  		if (!idledly_units_ps)
>  			return;
>  
> -		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> -		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> -		idledly_ps = idledly * idledly_units_ps;
> -		idledly_hw_ps = idledly_ps;
> -
>  		if (XE_GT_WA(gt, 14025941587))
>  			min_idledly_ps = max(min_idledly_ps, 5000000);
>  
> @@ -633,13 +627,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  					       max_idledly_ps,
>  					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
>  
> -			/* Clear the inhibit switch without disturbing a valid delay. */
> -			if (inhibit_switch) {
> -				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -				wa_applied = true;
> -			}
> +			clear_inhibit_switch = true;
>  		}
>  
> +		/* No applicable workaround found. */
> +		if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
> +			return;

We can skip the check for "max_idledly_ps == -1".

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> +
> +		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +
> +		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
> +			idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +			wa_applied = true;
> +		}
> +
> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> +		idledly_ps = idledly * idledly_units_ps;
> +		idledly_hw_ps = idledly_ps;
> +
>  		/*
>  		 * min_idledly_ps is applied before max_idledly_ps, which takes
>  		 * priority if the two ever conflict (not expected in practice).
> @@ -671,7 +676,8 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  
>  			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
>  				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
> -				  !!inhibit_switch, gt->info.timestamp_base);
> +				  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
> +				  gt->info.timestamp_base);
>  			xe_mmio_write32(&gt->mmio,
>  					RING_IDLEDLY(hwe->mmio_base),
>  					idledly_reg_val);
> 
> -- 
> 2.56.0
> 
