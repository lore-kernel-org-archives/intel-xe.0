Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA64EC5DF94
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 08:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9674810E68F;
	Mon, 24 Aug 2026 08:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zgl1FApU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9335810E67C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 08:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787558960; x=1819094960;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=yVXFZziRsbmn3CI7GfUQmwhB7QGF67cbjN/Zh4oZ6ew=;
 b=Zgl1FApUEOP4hUv7b86LWBM2j48VV4dqAfS+hLz7S2qCExNm7Fxm0kg1
 wwfNEtmiJcSAovQsTWB6Keacv2AKujfnu2TuwTm9iv6jOvUtayD992pVT
 tzRxVz+F/xLg/IN5B7sf6gv86Vcs+cE+TmiWPAk6z5WkKLnXyvaObTkjR
 KpQev7Fo1JwWJZ8Zalm7FZxL/6L36H/5hEmWFK0NXwuqt6mW3Tk+rxaDy
 6K+YT3yhzki7NV5ou5Xb+UT3+hIozvePhpWL05badkn6eVL+SCnO1LShr
 kLtB/Evhll1hXkP3iOSt4y2Ov4G+lN1+iaux8xD46RxTVTt6nzN5gKWnj A==;
X-CSE-ConnectionGUID: zATMIwVNTM6d3j7KT8ilRg==
X-CSE-MsgGUID: 4Pc3BEzHSrKtJrX0cuEBPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91681440"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91681440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:20 -0700
X-CSE-ConnectionGUID: k8vxoD/9Say8V3ne+Y35Iw==
X-CSE-MsgGUID: 427BsU1SQG2PKIHd86Mj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="305135210"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 01:09:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 01:09:18 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBVHSHaObmjoF5OBKdOTCb2qXgfRcEfWK2OqGKLWCNxT4DAXuNEjzwlsU06R1pxbs1KTUYplPg85gqvLuikwcm5EL6la1EIvKFayvNpVBJi/hUZndTJWdlOUotoH4kq3ekInDEKb18SWg13CAV3gX8SFJWZe5JXu9G8gLu8aYBa5gRN+GEpI6MUMKAEPvnWA3/h1aeekp9R/NkHK4BzxlC7i7VlKtSFPVTxsJ+uSttS+9aJwm5Z8qzDNYIh+EkqPDPAknazQ3zK4aMj4olTXltKOzIdB+MehF3VlbXdmT8Xt0Xra0o5qeD/eLwRitMuU24EWmZ2QJQyMsMRXQPH1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tekHoKfLI7dDbgOsmDMDWdaEMGjO3AONOMVgH98amuo=;
 b=ES6E6NTgUF+pKYoePJ/6wxu1nr7XRce1X6RFruoRbRBTgB5GssfVLiyurgbwE4wVrWF/Mc89SJsgMbTsF1muaYf36rYKyNQ2UEg8/MXGccpkrCa3iBVbE1Oh3uvG92IylElSaeHCq3ZpO58ZHjqnHVFmDsvFTwPyg53Cl7GkPhShjWdXPX06/tg6LUmPYTWKMbO6vu+lM+pXu9UM2Ts6mSYQSudCaMmLCFbpJeXMKG37/FbzcFKcxPoBUBuqX0F4Z5XhUmoONpQZmvrcLNHWMIZKd+sOw+koYVNeAki9Fo8hSkSVk/5NANGRQ49lQdiC1bnzn0UK5hEueV+jxRLeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 24 Aug
 2026 08:09:16 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 08:09:16 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 0/4] Introduce PF-mem VRAM regions
Date: Mon, 24 Aug 2026 10:09:04 +0200
Message-ID: <20260824080908.701133-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0199.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::28) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BL4PR11MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8f1755-51cb-4a5b-c8a5-08df01b6fd73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: G/8ua8sgcqXCvTcFDry/YCaZeA2moSSovjaA2NMJlewy89zogitPASQQMOrgu+QPDXtgfD1l2jibOwKzh2851GSSu4NqDO+SZBLVxK4F+6GWXcWbcMmpm/hMX5D26NLNskp4CeCDLY876Gf2pdYkbshNN/9kwUVwwJ6gLHOKq8iXdHo00s4cWyKU/GOzG1fMNPLtBOvVR/QGvcbB4WfFzSGIU9T9yrNN/4NhcHpBkS2fR+fQRoyghjq9Fm2wBtLGXMVg783f5fDZzFbeE1InOX/pF9IGB39MDf/ZuTJK6WhgMuxd7NwKiGgVYbnFBXpKulVRBF4OXbWJ8uz2B8NxlneGDwRQ+N/3DRTsJ1MCIzWsamYw6kGqUKFV5kZ1qQRs1l2ivT5DEMlVir2iYeRay/RWsy7v+plD4aV13LBIn0+pOLNZwYdXxOTBSD9TcOhXKYyLI1mXQI5dJAYSwpeOagDuTjaCn8oydC2gBtksbzYcdMBGIkafz2MDDleX8FxH0db9Wos79ARUUahAXtg+wc+f/JwGAA0OQd48I5e22WfmcHXLcbT3H1YvWgySaJRnxhBqPJVA7i+s9dizINAp0mIhCJ5KYMr1PRScY2+NJY12vVHDPou5ywwEktr+GqY9gEAkAgGcWSuYhJFt2XcsJlwwPj1HOJ2zEvFAvj4zBbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1czaDhXeThwM0JFcEJiTjFFQ1krWjNCQnZKWG9oWno5Mnd1L096ME1qN0ZV?=
 =?utf-8?B?MWtDRVIwY0JzSnBSUjVJS08yaldIU1c1UCtERDc1bHFPTzNaQkovelNnNDVV?=
 =?utf-8?B?OHBXV05BZWVjazUwWGUxSGhjeHpTb3hCQU9QYnA3TlNZYldKelF3SzZmYzdJ?=
 =?utf-8?B?Y05oTjhQbi9IOWlsbkVGbkFVSnFiVnB6SkNLSm5IejlVOVdXK3IxcTNyUnZP?=
 =?utf-8?B?ak9kWUxnazQzRGZDaTVsL1lvNis0bkY3ODdDd2RJVUhxbnJ3b3JSeTI4bUJw?=
 =?utf-8?B?Y2YrQmxJRWhtbzhWMXd2aGRvd2wzVi85K3RiVDJXY3FualI4cGJmcDh0SGtT?=
 =?utf-8?B?WXd3SFNWQXBkSXVnMG5pZjBMNVhTc0N6bTJKaEJrSjhyN0RJZ2RiZ0VoQ1Vm?=
 =?utf-8?B?UkNJYU1HUmRuMmtCMjl3QjhyVHQxNnJqZFNJVjdra3V3VGQ4QWFIdjd2eFA0?=
 =?utf-8?B?MDNQSG5XbzBvRVJzL21iTysvcHlNL2NjV0tZOENJZ3U4YTd1M3l2WEJtYjBR?=
 =?utf-8?B?TDNuTTF3bUhycEcxS28yY0EzcEhqTTRMaHNFVDF5VUdxL0NSbmpaaU4xUEZI?=
 =?utf-8?B?SHc3NW1yeUIyNTA4VlNKaDY2cmNhVE5IeFNPZ2ZWTWJnZ1ovQ0UxcDc3Q2dr?=
 =?utf-8?B?SllTK3h1OFRhQVl6eXJoMGxuNjVCMnIzemY0dUhaNDJxdUVsL3c3a1ovM0Jt?=
 =?utf-8?B?aVlqZW9mQmZiQ0tPVFEzVGpCNWtqdmhFZ0pjemUrT3dJVkVCMit3TldTeGIw?=
 =?utf-8?B?RzhsNWZ2RER4ZUZ2UmlJVWZDMG5pM3VNRjl5NmQzQndURE0ycm1hM1hHOWJj?=
 =?utf-8?B?VVJGZWVZTGVCb3VyVXhFbE9oeld6dVB2clNlYy9SU3ljc0RKNGpwTkEyZUpy?=
 =?utf-8?B?K1dvYjYwQ0h3UEt4dTJYdEt3MzZIVFJaSC90UGR2ZlVOdEkxbVZwVGc1MWlW?=
 =?utf-8?B?d1JMNjdjUCtnQldwTzBlZFExcjI2U2RKTU51WFJmeGlDcW40L2pSYUpJUTFx?=
 =?utf-8?B?amF3dFEyL3pTU2JIdDN4anUvYnNaQjRBZHlhT2JLcnJQRDkySWlpbXFyS2pE?=
 =?utf-8?B?dE9BOTNYNGE4YlhzVXJFNU1YV0s4Y004Mkh4dE9CRFRiY29oZHQ5SzlXTmFQ?=
 =?utf-8?B?TlFwQjNRQWZ1SEh1ckw2Qm5SUVJnSjJacHRDZ0Q3RWNyNFdPcnRjN0RtS2Ur?=
 =?utf-8?B?SDgwaUN1YzM1RWUrWXVaQ0VIR2IrRDk0UDlpOWVvdDBFRzFDU3FnSkUxbDRE?=
 =?utf-8?B?empPcmVCMFZialczL0dPU21BZ2VnMEkxNmJOeWxPbTZXU2lhZENsMElGaVZK?=
 =?utf-8?B?RDk1YjhXUk5BUFNyWEp5QVFwUW5UN2pBc3RldHpROUpPOFpVcVEwKzV1cjNT?=
 =?utf-8?B?bi96bDBramRnQ3RZL2czbU95ZVJuZVdmQ3dRbmJWSUtoMjdUM1Urd1F1KzRZ?=
 =?utf-8?B?WWhaS0EvMlptM0lLYnhnUVZ6U1NoTXBMSC9iQ3JNbGd2U1F2dlFoNktnRXI4?=
 =?utf-8?B?Q0VLNlZ4WmZXYjRBWDl3bkVhVlZ5OXdraDNPejNnWG84YURNRmZUYkNscFNG?=
 =?utf-8?B?U3J2WXdVNzRqbXA1TjVJVnEzZlhRWEVrbEdzelJQUi9mbDZoMnVyTVA1RUoy?=
 =?utf-8?B?SGxBMW54K2k5M3FSdDczUG9IN25UWWZVOHc4bmc3SnRBallDeGdGb0lGUU1E?=
 =?utf-8?B?UytkWmxhMkpEVUxESkhEMzczbStreEhHL01rNkRGbXZuWUF0THA0bzIvaGVy?=
 =?utf-8?B?dzZsb2JjRFRWaDl4UTViZUpHOStuTFVYNTZPdVBreU1mQ3dxS3IwTm5scEY1?=
 =?utf-8?B?ZUdqcXhSY0xxeDhwaTY0K3poTnVmclVQaXdxR0lFMHl1dG9hRThqWlo4YWI4?=
 =?utf-8?B?VCtoMEdTNFpMRVJSakw2MFpDczg3Zzc1MU1hWWoxQ29VZFhMamZrK0tTUGZS?=
 =?utf-8?B?VGkrOTBwTlpaRGx6ejhIdHRmbTJEczQ1WmdTa1lFRkVaWmx6Tmc2YjF6bGtC?=
 =?utf-8?B?aXhWUENZSnluVlhYVmUzL3BjTDg5RDZzWUtjNExhakJSRHdaWVJmZjlhc3E3?=
 =?utf-8?B?S3NLd0xOL0lIdHdUd29pY0NldzBNVlhlTTh6cVZIZStrUzVOODVLS3ljSjZk?=
 =?utf-8?B?U0YzTkozSHRHR01xczMvNnBySys5VmNKVGNzd0NQajhNN2NxUm5LRngrUFVp?=
 =?utf-8?B?ZFNGV25MY29FQkcvaUY0TzBlVXJ4RGJFcDUxbFRYa1hDbzFNUnhUNFlMQ1lI?=
 =?utf-8?B?OUh6REpIMFBpUDRaT1NqaThGZUU3R3R0ZXRKSXowZlpxeHFuNHFNQTVUc2pD?=
 =?utf-8?B?TDFwOW5LY2JJbUFXQzJOYjZIZ0hnWmg3SlBvbmR4TjVzaTQ3WXdFOEpnMWpX?=
 =?utf-8?Q?5/XiP2aimtPNP/oo=3D?=
X-Exchange-RoutingPolicyChecked: rf3bVwCB9rzL83bXh8sspXiqEQixZbC2P9V7YMrqNX4nhTZyM3g2RKBV4pZrDjK2eSCwYbkJ3gR+YE+55BRrXFKl02kQGFAdGmKDdypR4y+7fWkWC2F9hJk9fEwuKRG6ohYmIRMnJOhwP8uZ85ObNo7HWJaSSmCvrD/7V0tCFJ5KepErDsC4avk+oJz0SnTos9iY0tOFM5b65XDug1MUp7EtrGNxRCLTmRQ99cPe6c3sQoAC770iuB/6YrDMM88IvsZTaD9RUMtM2OGnqIO/fxxhENh7o9dG24NhRnC8BnSe/5ouh0yIpTnZ5KIIvKLyxj15Z+qCkXhXA2PJS7AIdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8f1755-51cb-4a5b-c8a5-08df01b6fd73
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 08:09:15.9341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BFMv++yUyhAE6VdhjHTrFY28r6gbndVVKf0S8QVTuFNnHW0K4HpqLpPAOXnLlRvfgZFgokS4JHBoHubryjvUUqi2lJsPLXt1Fa0bUe9KfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series lays the groundwork for PF-mem regions: VRAM regions
dedicated to kernel-only allocations, where buffers are allocated
exclusively by the kernel driver and are never exposed to userspace
workloads.

Today a tile exposes a single VRAM region shared by both kernel and
userspace allocations. Some use cases need a separate VRAM region
carved out of a tile and reserved for the kernel driver only. For
example, on an SR-IOV PF most of the tile VRAM is provisioned to VFs;
the kernel driver still needs its own allocations, which must come from
a region reserved for the kernel and kept apart from the VRAM handed
out to VFs. That reserved kernel region is what PF-mem provides.

To support this, the VRAM region abstraction needs a way to distinguish
regions by purpose, dedicated TTM placements so the BO paths can route
and evict such buffers correctly, and helpers to create a region from a
caller-provided parent, offset, and size.

v1 -> v2:
 - Add comments explaining why PF-mem is excluded from user BO eviction
   (Sashiko).
 - Resolve xe_ttm_vram_mgr_alloc_sgt() physical address via
   xe_map_resource_to_region() instead of the tile's
   VRAM region (Sashiko).
 - Enforce page alignment on offset/size and guard against a NULL
   parent BAR mapping (Sashiko)
v2 -> v3:
 - Add XE_VRAM_BINDING_NONE as the zero value, use
   XE_VRAM_BINDING_DEVICE for the aggregate device VRAM region, and
   validate binding, ID, and placement during region allocation and
   initialization (Sashiko)
 - Enforce page alignment for PF-mem offsets and sizes, and reject
   regions with a NULL parent BAR mapping (Sashiko)
 - Use a mock BAR mapping that fits into a pointer on 32-bit builds.
   (Sashiko).
 - Exercise page-aligned out-of-bounds ranges separately from unaligned
   offset and size validation in the PF-mem KUnit tests (Sashiko).

Piotr Piórkowski (4):
  drm/xe/vram: Add binding information to VRAM regions
  drm/xe/ttm: Add PF-mem VRAM placement types for TTM
  drm/xe/vram: Add initial support for PF-mem regions
  drm/xe/kunit: Add tests for PF-mem regions

 drivers/gpu/drm/xe/tests/xe_vram.c   | 118 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c           |  25 ++++--
 drivers/gpu/drm/xe/xe_bo.h           |  17 ++++
 drivers/gpu/drm/xe/xe_bo_evict.c     |   7 +-
 drivers/gpu/drm/xe/xe_device.c       |   2 +-
 drivers/gpu/drm/xe/xe_pm.c           |   4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h   |   9 +-
 drivers/gpu/drm/xe/xe_tile.c         |  10 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |   9 +-
 drivers/gpu/drm/xe/xe_vram.c         | 118 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram.h         |  11 ++-
 drivers/gpu/drm/xe/xe_vram_types.h   |  18 +++-
 12 files changed, 316 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

-- 
2.34.1

