Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31366C5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 14:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92AD10EC4F;
	Tue, 11 Aug 2026 14:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P78FEIAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB34A10EC4F
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786458317; x=1817994317;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hAVZDx9HasKoiojnPGrsEI+Of84GDa8Ln3W/7kWEFko=;
 b=P78FEIAh97L+In3mXb4hgJc6Tj00uSdYQDiAaze8d52uY8p4PvryTiPO
 Y/2nTn11oYnX6KR8KSYsDFAkJ5z5RlZv0T3OG7ga6DVFLqeOqLz1z8DXR
 A8RJMG6kbejo2j2OKBHpjBf3KDRrbRPVXK6DOTfIdhE2KIpp4IRRqYKPJ
 TGM0KLxyFfOcydzAnZn6P4l+zRiu/5YBrJVv7YRI+cE30W+fRsekpgqC7
 6kaPBpaVUIjcmc1jr1zfgIFL1eGP5P7yZ5gEB9/7Hec2XVsgJCEkUMdui
 de/jdFqPQQ4PKpYUIwnet+25vlyb42nQLWiEczpGfF0qrapC8g6WclgZs Q==;
X-CSE-ConnectionGUID: RlMsTXjTRhS9ne2ry6uTVw==
X-CSE-MsgGUID: hQ1Ye03FSoatqEyuxpQrag==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="112536195"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="112536195"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 07:25:16 -0700
X-CSE-ConnectionGUID: pjoZkxEBRVqla9+XNzZnHg==
X-CSE-MsgGUID: 39k0Yv3jRsCjvL5cUbr9Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="293294362"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 07:25:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 07:25:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 07:25:15 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 07:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeKp0JrR7MVt4N6Sp00yz8ODnoNyKuJo3+mj1kWlOMfqPlTaS7eywnMt0ZAV4W5IXHTzCcOz+F+egE9pxYpbqWBshKdzjZiJNSHRLJyA4JXAP6xYEP6k/BI4AoEZo9q0WSBXSWdyEJ8FWDiWSXp0i+0o+44MC75sB4Sgrqu3x3s0jk1qVg9BG5Ih+b+EvKq5MyRQaSuUmYZcWFVju1b1wqgpZ7dlQstdBUVQugEr1mZcuuBNHOMz8v96Mcawx0lpa58cMgPcd4Fnj9TpiT6dTEnW0FlxtKkR3IN+6XgtqZvcqCsGfHJLDgTcmeeHZ+4ZjPgqH6xOq15Uazv1Ghe6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlHuN/RiddlWrvuk0e3ZAOhqI74XaJCx9bqjXKt1JuU=;
 b=oZ6EW2YChAAr1zN4RuLvzuBzXlQVVGzpzG235VC0UZVqrp+uFxoeaPPiwE8ThNrsIICEQKTJXuex4DlyrMaY0PIFiEg8sQ7qeHAhWDVqjcJXiTme2sVCMzp/GD/3K3hJKCVJhRAnt/QblnqU3dNZsTmtqroU9//ljXc6sfApROuyQXBiR3IIl+VAR8a+daxWGdfsMHBzbefAfs1ICixUkRvmK5x0xdpBsbKPVQfquJmKAVaMO8BFu9lVZU1/iGNq8vSzSQElItnMUVC9In17AFVhd9HTa/85H/k/RNbWNuxUHPpeurXWwwmrEiPVDFTW6PPgT57UdLZ4kfU3aga7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH3PR11MB7347.namprd11.prod.outlook.com (2603:10b6:610:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 14:25:13 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 14:25:12 +0000
Message-ID: <79ac52c2-c9e7-444b-aa71-f1381ecc60e5@intel.com>
Date: Tue, 11 Aug 2026 19:55:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/23] drm/xe/kunit: Setup driver data in the test
 device
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-14-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-14-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH3PR11MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: e0892e4e-1ef9-4800-2b55-08def7b45acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: lV4Hwu9zlJ/VPjjgDYYuAKZjRj10DSNIO75SyF+Q0tL1dQr9/QNlCsS44LHKXLYsPTlCeMx0lQa0BLE1FvNly1MB9CXvWlYtmwI1Ft52OQaLdEOQ3OEg8e+oHijgfVYCU7lin7wJnyL+fMFWHGiZ5URBEvYbd4hk1vmEn+JUGjN5h0YJXcL5SwCST3NVFNQZv/bcJULMMQ2eCumGGcDkP1mv7C4ECbXouil9jQyLv+Nts7I4U+AiRA+wze69bpU3A8QLwhoHS/49sHK7KpQs4/PYL6Uj1rlYSF88Hqa130Q9ZQpble3pLaLnA8x0h2eRihzdWTxoD/MrxtGc/O7qt6dwCb1SnVaOO/jkoHUWPDbd6RHt8Toc/pJ7TkQMnY3NNarJvkTAuaKmerXPOUtWySEUWKxsePypMQujnKdkeiahllPProY51ms21k/7rLGczEizttkaqVbi6Yyj1MBynZWU7/j3K6z3h5d5w64eUPXE9j2L6DzWxEvHGY5kHmnpVe9kea0ElxSJwgdhl34msn3nEP/oNvdPV0spyRk3XhQR41HZQ2HLb50+KIMoDXNBYUqopyoQ9IhGoeZXf7LsBCz7S/UV6F+PEsFA15Qx6lyD01M9/H3Z5XS38+zqIrpvAAM8yYpYpZIHQ2xk3oZVZPp3NqUMXguhD1GfN6k51uU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0NLbW5OU3VvdzFwNkIrVTlDZTFWOVZHaTdzdzF2Y1FUbzM3bHZwVUl1Ym9q?=
 =?utf-8?B?aCtvY0QvdW5rSjEzbVVFOW5xOFd1ODBBYkpvMnpmY0g0RTByUmdWd1pJQTZI?=
 =?utf-8?B?U3A2ZlEwL1Q3ejl5UHVZVHdpOWRIRE5haHBxeU85RmpqZmlxbkRrMG9nTFo4?=
 =?utf-8?B?OEhnMmdpbmJPU0syL0NZeFN2bTcvdE9QSDBjU3Bpc0E5Ym81QmZNYjJLd01i?=
 =?utf-8?B?WlFNQTRZM1pVSFkrUFp4NzFrMlZPcTVoNFAzUnVyTkZHOW5ubnl2QVN1UWlE?=
 =?utf-8?B?Mm1jOXd2NUIwSHJ6WmF0cytqbldBZnFjWDhXWXBaL1VwS1JOTzdZNjN1dDNx?=
 =?utf-8?B?bmNpMHQrMW1pdXBIMTRZQWN5SXFDRitCL0lNZzhuUXM5UmVKaDNpMm1LcjJP?=
 =?utf-8?B?RzcyM3MxU2xBUVROVlhHQXliTUUyTDFtVWhDU25DOE8xbXdQckZ1RXVpemtQ?=
 =?utf-8?B?NjNoNjF0V25yYnVOVlZlelczNFN6MkYxNUtUU2ROME9WbENLZ3pzYXVIbk5M?=
 =?utf-8?B?UFNyK3VXZVg1NDd6YkxObGZIOTFDcVA3VTBRV2dwb0NIMXRmdlBqMkdQZmhZ?=
 =?utf-8?B?YVd6Y3pqL3luTE90R281WWNaakJkaXJiVEZKMWpQVEFPdmQxM3dFQXlQK3ZQ?=
 =?utf-8?B?TTFXMzFqQjV2Q3lZY3hLN0s4SVFFd29XbzR3Umg4ZUNsME9wTlVSb1ZPWHo4?=
 =?utf-8?B?RC9VNW9jY0JPRHNxWUxxOHdoVjV3cjc4TnVsakhEWWt2SHRDdFZya3ZxVXRU?=
 =?utf-8?B?SXJUSnVSRW5Tc3B3UnBraitMWkc0SzhacHFTUm5VRXV6dGhPNURFNmc2djBp?=
 =?utf-8?B?NWx2VlM1V3JKOXVKWWZZbXZzSFJYL0ZDWmFQOVNUcEg2YVlQZTJMK21kS21a?=
 =?utf-8?B?OHRwTGlEdHFSYVB1VVFOVm45UmJYU0R0NnFESDZNUWdac0UyRml5aTU2ZHpS?=
 =?utf-8?B?L05tRmtGZVVlTUFDaGpqb2FYOE1GM2I5VnRKcFpDaHJDUXNYOENubjAwN0ov?=
 =?utf-8?B?eXNIZzBQd3FnT1h4WDM0VDdya0tsd1JrVlhla2FOYXdKSzVxMDlOc01Pc2JH?=
 =?utf-8?B?VWdnM3VSWUQzejc3Z21GOXBRWWkzdm5sVVFFMFhBdmlNN1dGc1VFbVQ3cXJo?=
 =?utf-8?B?cmpWdFZGZ01KNzQrYTlMNHVkeTF6c0RTaVkyejAvVHBGbDBKb3phVXhicE9N?=
 =?utf-8?B?ZkI0bjRCSXE4b2VmV1IwbERFamJDRDlzKzNiR1U5VEdrQzBwa3BaajVkTW16?=
 =?utf-8?B?TnNKSjI3NFR1QWYxcnA1NU9rVGNQMEhSS1ozV3d3UExMMFZZSmdGenpKYkVm?=
 =?utf-8?B?NXlzYmJ5U3BMSklrWlhPNDFhWCt4NWNEdGFodjdlUHByUTFjaUFXU1RBTzY5?=
 =?utf-8?B?d09WRGFISFUvRjkyL2p3YTd1a01zeVFsV2I0c2dETkFKdlZxMXczNUwvQXFF?=
 =?utf-8?B?NGxid1pzTGc0Smg3TGRQcHFpMjVXYjZRbUc2STQrYTJEbXNCL00ya2UwQlF2?=
 =?utf-8?B?K3g4dVFtai9CNmQ3dlZIUEU4cWF1VUNnaXpwOG9ZNVNwZEIvV2QzcFBqVUVX?=
 =?utf-8?B?YURVS1dqSHF5U1VwNjk4MXg0OWJxOEM5bmlQN0NncXhvMFZWUy9SaUVNeEw3?=
 =?utf-8?B?blI0VS9CSkhUVmo5TUJXcStReDBMSlB2SllFQUlheVFvVWxUWWhFazVXZ1NG?=
 =?utf-8?B?QlZiUWZrZmdsVnppWExsd2lqRkFiSVRhUFB5YkdEMUtycmNDQkc4OGpxR3Vp?=
 =?utf-8?B?NnFQZ3pxaisxcWJuWWU2Z3l1c3IrR2VjeFcrNnFsMU9PZTA0aC9YTmZLcHJU?=
 =?utf-8?B?dmV5RlhqT3JHM1d2Vk8yVm5qd0svQWYwcXVxK05xOVJQT09CUFFTS25pL1ZW?=
 =?utf-8?B?MXdub3pna0lVN2t5WFExTFNIalQyUDd1c1VoRmxRcGtKT1JpWEwyS2FXOHhL?=
 =?utf-8?B?RVB6MDduYVVNTG0wS0RpNTRlTVhuelYzbHpVdEZ3WmdmQnc5R2oxTkU4L3BY?=
 =?utf-8?B?Qjc2anJIMUo2ZFpBUmt5WVZvYUpMaGtacm1mWG9iOUtrRHBMQzlsNmdZV3NU?=
 =?utf-8?B?cEN5cHVrMDMxL0YraTIxTEpDOHZWZHR1Mit3WjlKSkUyM3hnWGhRbWlBakll?=
 =?utf-8?B?Ui9VMXF6OUlIOHhTUTNRL2hOeFI3dVhzSnBMTmIwV0wyQzlsRlFMRGlDNkdl?=
 =?utf-8?B?OFNoZGFDM1NSRFhaQlg2Y3YvRFFoSDJEVWVULzhORkZqZTlQTTNKQzl5Tk8w?=
 =?utf-8?B?TDBWUFhBZmp2Q2lGVzdFUlhBS1JWQ0xtY2ZYcTV2MGhCL09oQll6V3RHSHpo?=
 =?utf-8?B?cFFtelB1Wm94S09velc2RjI2L3k0WFBvTEV1dVViRS9EbGNvc2lJTlhyRHVi?=
 =?utf-8?Q?KwRa25jqhpOe3Vgc=3D?=
X-Exchange-RoutingPolicyChecked: Tc0foBUo735OdJlNLVMczDZJtZbh3XhhXmq9lwbcguFFoStyzh/W+7rNkKwAAk7Uyc+cfDEznENCpYN22o22KjFziwefwLotWzY1AJJXesdziuLxWHnXzyz5Qe6TeLDl780yqcGGSqYgGvQEnR0PxukEegSViDGrAyl0nK90LSmq8KhywuxwVVayywlZRsK4ZBW8oviBiYYDiZDKFzQozjL/S/cvACeT7q/2k/VBRSZhEJdySE0yY8ENIb5w2Z1NcCmERixvnC/I+OgiI5S3uCC2yzwOSEHBWJ0lb8eegILie65feDUBiJGU2XwHK6lbKcPz20YrLyBdz1H7G9aslg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0892e4e-1ef9-4800-2b55-08def7b45acd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:25:12.6241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pw6s6GGO9+2N7C2AvxqQ2HV0TsB6bFipZqY6X9QPNseTmPSxdt25TZSmfh8iHy6/owDuDcDrojLgt/B5cz9lf2ensTfTXsPCP4eAbqNT3/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7347
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> While we have helpers pdev_to_xe_device() and kdev_to_xe_device()
> to obtain the xe_device pointer from the struct device pointer or
> from the struct pci_dev pointer, we must also setup the drm_device
> pointer as driver data in the device to make them work.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> index bc5156966ce9..27740b40c8ae 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> @@ -39,6 +39,10 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>   					       struct xe_device,
>   					       drm, DRIVER_GEM);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
> +
> +	dev_set_drvdata(xe->drm.dev, &xe->drm);
> +	KUNIT_ASSERT_PTR_EQ(test, xe, kdev_to_xe_device(dev));
> +
>   	return xe;
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
