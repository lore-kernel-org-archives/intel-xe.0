Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D945606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NxEwNxIi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D999710F476;
	Tue, 20 Oct 2026 09:56:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E3210F476
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792490157; x=1824026157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/e4l/MJZygbyNKh+4IGh6TWn6YUF/bRXNpcx8zBiinQ=;
 b=NxEwNxIicN33Yka6H2wxTF4I+jGZP9vZy1f/vEcDPqGXceYT9fUWJ6da
 YzO229UGjmPnsqUtddaSzwW9t8s7ZS18hu+VJiNS89pK0ww2GgQNwLTcU
 v119zKJD2NblSNpX9K3oQgBX2WgoV1jW4WOv4PjyHMcgAAjQzGKbEWxh4
 0Zk5cAWcCS+Bj25L84DxPgMRvIY6OIrxpr+k1QACgibzMSW0zTcg+2mUT
 KOqnOgMppwNJyut12L1faCj2G8/PyL+GRF9ZgeNoTxgj7rkgKyEOXnEZh
 yuRnBypSGrExEtWFkPB0cq8RY7h9Npkc6FPYqc3dKJHb6RjRhM1+tV2Qf Q==;
X-CSE-ConnectionGUID: jEWeT7x2Qx6vbPU/kwWvAg==
X-CSE-MsgGUID: 6h/m7czaTtC8z0hAuGmqug==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1216438"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1216438"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:55:57 -0700
X-CSE-ConnectionGUID: pmtM0gQQR56DuFndwd1/sg==
X-CSE-MsgGUID: 8nP6oKcjQNeL+jsJNFy3pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2667707"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:55:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 02:55:55 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTMuBkmOL+2gd3NNkkKjJRi5u/XzEyWFrwAaWNv+3sEgs1DagsVL+LfAwk+8WTklC2Dj+im9SUtj4ykZRV7YHrnKEUlJElexU2rlVVucBJ2WreowvwrYEI0Zk3ymerOzNrbgcBYjKitWD7J2sJfE0+GMdEUVIR1QOBuKbDDHBDVCn8cw/S6vU6cwkljSlG2OYHxDbonPOaF85O4vpa1D5zTrc4RIHSzud67n0ksUyu0biemKIEU2HqSo9C7n27zDTBudTlGs7KG7vRLl+lPZg1LOUQohFUIgSLZWulj2ydepGOAIJ2G0dSg/4Ig+S56bvwhc11ROfo5FcAbMg8TbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMfJePZ3zPwQJQ8W6cEVIEtHh0e95ZMOpgHh1KI11II=;
 b=nRioK4wLGcwRnuiBkd2qyb02cEsIkp/0t+CdSi9Dkq6MFMvJ5ICyHnSKCB/g/BSY2LeKcQwikB/sx0cFbP1ewCl6jm6uB/LWQX544fYhgHInWD11oEzx62D7MQp67Izd/ERpZfOnAodoSttNpHCqlRbBWa1L1gYe3iCiVJbEOcTlO3i7S3WRhtuLZMWO5LVBAgHgu/r6KuxaxgbKT0JpH8eocZyL6gjIW2x+52Xxifn0qH5xY7TMsY9BLj3K/06RCAwi0WoQcNvuSMzOubn/S8vZDLJq+McRiWYirXD3FM43X/y36J/JElxLbc/24rJ55fePGfuFKfzAP3vL03J7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 09:55:53 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 09:55:53 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 3/4] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
Date: Tue, 20 Oct 2026 11:55:31 +0200
Message-ID: <20261020095532.473609-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020095532.473609-1-piotr.piorkowski@intel.com>
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::24) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4d98a3-62d1-4ce3-436e-08df2e90546f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: weJWSm5/UDMHPLoM8ZnPdYMPOmbMeFNhibMjD2D9ks8I1x1YCmpJsNxBoSGEM45nmO3+ycCUj0LK17nEmGzj5TGx4gWpDE9TfVyzYqngePFjhx9Y64z4bx8BRCPX+6AzTM7UQ0+wXJU1IZI5Hb/7nSsSxiGfsEDF5x9ZoN+CO0GYW6/AE7MG1UrOdr1WPK9wrouBsWM+HcY29XBWNLG2P+GTMYRNkMpIHrv57mEb+b5Ppl/AflcgllHf6zs9fs43EKSDLVvIT/1CX06xfNdmXewzXTHuI8ZVA8BVHkPdN3QdfyeXIULR4riRbtolJhst7NfLoxDEx/3G4pHu3+qMqTADOjBl+iDec+v50G8l2hTqLF+nSp7wVgd7n0Wqv4C5KlJYKhA9M+JvNh9CsiaxId8GFWPc963dQ1M0LF69pPaPl/4z616FgiN5wKW8D3r3uEqPhbz5elhnWwdWc8dlE74L58pEejzYTvxOd49pl1S0N9K11Fv9/2k6QJaNTHnJCE6aemYLaxUHaEJvj39fHVUo+iCA9ItM7LOmmWJ7dl4Gl6ix0zzaJA/cGJALvTcaCpGGVJEMm1CWfN308AEbEqhhzzmp3CW/uyN4hRYuWKfH2f2dLiQStd/NhYlDJbZ0x0patXOnI00Kb2Qeyn4/fz0WqInWVWRlpKDvx4lXHCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnBZeU5kWnN6bW8rbGFUVFNKSnJWS3o0TzZIdFBLRWNTUXlRKzl3d3N2a2cz?=
 =?utf-8?B?emhTb3NHdGcyZmJ0VHdwYTRtaVNqYVpiMTVLN0dQQVZ0a201dFRDZG1UenJv?=
 =?utf-8?B?TlNteC9wWWFJUHo4YkZyMStST2orM01JckE2STdSQnM1L09XM0E1eVFGdEtj?=
 =?utf-8?B?czUyMy9qU1ZjQlBiM2tMaUxiaG5nUThUWFNZM09ETWlEajY3NGtiR3lZbzdT?=
 =?utf-8?B?ZWFSWEwyKzZXSklpTFdPNnpTMnBVc0VYTG1IWFFHTHlxVHU4em0xYVREcHhR?=
 =?utf-8?B?TklLUDlMTFhoSkZvVlRaeDBFU0k5ZFdldUhaaDdqMCtXVVdwbkpYeDVUREJq?=
 =?utf-8?B?dm5CeWkvR2JkZ0hqMDZFL2lyYXA3Mnc0WllVNnFWVzE2RXFacHZBMURZVFBj?=
 =?utf-8?B?MjZUcWd6VHMxS3hSWGo1eldQWHJ0QjQxSTFxeFlZRnZsU1FIL3UrSHVyeW0r?=
 =?utf-8?B?QTkwT21QMzRCTTRGQUtQb0U5cW5SZFIzamxTT29PTWlrazVWUEpNUGdHNEE0?=
 =?utf-8?B?VDVQeWw2T1gvU0NUaDdFMjVpdXRaeWYvTWFYRXppd21SSUVSb280Tk1EYjdD?=
 =?utf-8?B?WWlhTlViOUpieFAzKzJZOCtMY0ZLUTFlTEpkY1dheGdhQWtTdjZjeU0xN3dN?=
 =?utf-8?B?NnV0RWNWWUdwUFROTXMwa3BDY0dCdUlDbHYrNVE5ckg4K0t3SHlwRlJUa0tY?=
 =?utf-8?B?K3pWbW5GWk9rUGRUSDRmZ25ra3U1MjRJOW1BUkN0VTBTeHk1UmJaZWgraXRP?=
 =?utf-8?B?bVRHcVBiYzFIQ3lXYk5hQ01QV2tkK3ZzaWVZM01mU2dQbHlvSTQ5dVJJNlQy?=
 =?utf-8?B?NC9QTk8xYXlVNHhhcVZRM0JxdEpyZXhwT0dGai9SZFdTZHkzYnNxU1RqNjVo?=
 =?utf-8?B?aHhCMlB2aUt4anl5ckZTMXNsTG1YR3ZGMEpMN3MxcERQRWt4SytzVGVqQkpO?=
 =?utf-8?B?ZjlIcU5LbjBvNG1nOHZsdzZyN2g3SzkrdzFpMnRuTHFlbmFiZDhDVDl3R3Q1?=
 =?utf-8?B?Ny9TMEgrTGx1dGMzdWhLWjVRRjR1SSs4Ykt3eW9ZMXc5REtCMCt4MWF0eEJl?=
 =?utf-8?B?UmlEaG5lSURDa0EweDNSckRISEdvczFxVnVHdmgxRm1rOUlFYktZWVJVNmtp?=
 =?utf-8?B?S1I0Zk1qYVhERk91OFJtNWxpNzJQbXpMV0hydkFKWjhzWmJjYnBlVEgxK1VN?=
 =?utf-8?B?cmtBNkFxQ0Z5RzVLMy9lR1J3eXdyZzh3SzdUZ2pHUW1EWERseC9XVmhLTTN0?=
 =?utf-8?B?dkllOW9NUGp4VTN3RGg3U2NMakhVRkZOL0ROWjFveTI4T09ETGhGdlZUdStH?=
 =?utf-8?B?SUp1VDJHTzNpcVI0TXpyUXh1TGtnK0pXbDZ2c0dvcGVzOC9QaEg2L3U1TS9m?=
 =?utf-8?B?cFFCYWtsTGhHT213Y0E0VjlaRGZXclZiaml1dXkrbzdDOTRqREtzRWZPRVoy?=
 =?utf-8?B?eWlWcGMvQzZPaTVFanB5d29PVjkyZW45Y1NNdkt4TlB6c3pmdUV2MW5rY1gv?=
 =?utf-8?B?RjRzNGZLWC9ocWpob1FiQ3VjcGJDUUl5akFKQnJJNS8wWngzUU1vWnJ5L1hY?=
 =?utf-8?B?SlpQaEp3a2t4U3Y4aVNLMFhQM1hjN01TODR5N29CU2dBTStOaFU2OEY1UVNM?=
 =?utf-8?B?cXVWWGlYSllwdW4zd3E2cVVTM3NQVVY5MVJHb0Rvbmt0eW0xV3BkS1pqQ1B0?=
 =?utf-8?B?eHh1TFU3RzAwTFFQTjlmS3hvamNyTHJTRlJmT1dIRjZiUHE4YWhWVlVaV3dG?=
 =?utf-8?B?SzdPakdreHVVYVRoQlRGVkg5U3dhdW5DTWEvVlljT2MxNkNXSG9XQ1JudXJN?=
 =?utf-8?B?VEw1NjhnWmQ0OWpUSDlDZTRsMjdOZ1YvMW1WSG5ZVDNjS255SnVyZmlOblNJ?=
 =?utf-8?B?d1hZcitOWStHTnFsbmcxVStKRFEzNjRQVHprZWY3UGhpSm9CRlI3YjNSY0Iy?=
 =?utf-8?B?TXg0bXFKZDZhZUwySEVvMEdiWkVRaDQ1MHRCeWIyMEhLdHJUZkZSbmZGQzIz?=
 =?utf-8?B?dnhqVlluQ1FFY3htV0ZwekNWMUhlTXE3djJnZnVXSnh1ODZZeEMxc1hHSDV4?=
 =?utf-8?B?TTNJejlGWFdtYnBlL3NHaEF5L2FBSElrREdkSzhCRklGU080SFVTcVlxcHA5?=
 =?utf-8?B?bnM1cGIyTjBrOXplanl4NVNwdTNzc2pwMjZRbkhmSldKL3czcmxjS2VNeU9Q?=
 =?utf-8?B?WlcxZmZjOGRUYUlVUWh1dWEzY1lJUUVKOGhvRUJ5ekFCVFR1cGovRjdZOG5m?=
 =?utf-8?B?SWJxZ1I5bHNHMlB1bzNCbU5aNnlQbDJnQndCSjFURUY2SXJPazhCcVRoYkJy?=
 =?utf-8?B?dk9ZVGtaQndlRUhBMEIzVWpKaFowb3lPcHlTcHJtVHVRQWxxSE9oaHkyNjN2?=
 =?utf-8?Q?DVRGPJjU9NBk9Eu8=3D?=
X-Exchange-RoutingPolicyChecked: o/wMLNYIS3ex6Qf/0TJV+gCiT2H0sY9KpLimOhPa0ZlHKhZetVTzxScffmobWfKCnZ6/t/eL8qi+1dNmZRGVY63BuZxEyhtbcp/30E3rHF8vsj4CaS869hoI8+jmv+6hCEGhvwOZD5XFIaFg71ePncYP8HibUsf1Oi0XsqcUkRFiOR68VTVArmvJWPNXbfT23AQTxlGGRl+yKafcjc1rEqbFg/IEDOtndPTbQ/QMydNhljwFdTU9lIYYW/U7kpnLMS3oZ92gf3nI3vj5mN1wYkdeNgf3efTDncg0gZcBwV4qAFyKYlX8WwwJPHTfXePvS/UlsJguzT+XfjMSP5pYgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4d98a3-62d1-4ce3-436e-08df2e90546f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:55:53.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtkXE+iSsVLwfQ6MBi8fa56obZ7LkhX9HwzaqtxnZk8mcvxHeVvPirLPQqfHNhe9dLzM7KIJeaaSU/1iGiHGyJbXB5y5zQZ17iuqoZ2Skqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

GGTT initialization currently uses the full available range for both the
usable and shareable pools, regardless of the SR-IOV mode. The range is
read from hardware on native and PF devices and assigned by GuC on VFs.

Separate range discovery from pool setup and initialize the pools based on
SR-IOV mode. Native and VF modes use only the usable pool. Shared PF mode
uses both pools over the same full range, so they fully overlap.

v2:
 - Rename the native range discovery helper to ggtt_probe().
 - Treat out-of-range VF GGTT as invalid instead of clamping it.
 - Move GGTT range logging into the common initialization path.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 129 ++++++++++++++++++++++++++---------
 1 file changed, 96 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8c8354d47782d..2173c4bd26a90 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -390,9 +390,99 @@ static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
 	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
 }
 
-int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
+static int ggtt_probe(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned int gsm_size;
+
+	if (GRAPHICS_VERx100(xe) >= 1250)
+		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
+	else
+		gsm_size = probe_gsm_size(pdev);
+
+	if (!gsm_size) {
+		xe_log_err_fatal(ggtt->tile, GGTT, -ENOMEM,
+				 "Hardware reported no preallocated GSM\n");
+		return -ENOMEM;
+	}
+
+	*start = xe_wopcm_size(xe);
+	*size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
+
+	return 0;
+}
+
+static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	u64 wopcm = xe_wopcm_size(xe);
+
+	*start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
+	*size = xe_tile_sriov_vf_ggtt(ggtt->tile);
+
+	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
+		xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
+				 "Invalid GGTT configuration: %#llx-%#llx\n",
+				 *start, *start + *size - 1);
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
+static int ggtt_read_available_range(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	int err;
+
+	if (IS_SRIOV_VF(xe))
+		err = ggtt_get_range_from_guc(ggtt, start, size);
+	else
+		err = ggtt_probe(ggtt, start, size);
+	if (err)
+		return err;
+
+	if (!IS_SRIOV_VF(xe) && *start + *size > GUC_GGTT_TOP)
+		*size = GUC_GGTT_TOP - *start;
+
+	return 0;
+}
+
+static void ggtt_init_native(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt_init_ranges(ggtt, start, size, size, 0);
+}
+
+static void ggtt_init_shared(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, size, size);
+}
+
+static void ggtt_init_generic(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (!IS_SRIOV_PF(xe))
+		ggtt_init_native(ggtt, start, size);
+	else
+		ggtt_init_shared(ggtt, start, size);
+
+	xe_tile_info(ggtt->tile, "GGTT usable %#llx-%#llx = %lluK\n",
+		     ggtt->start, ggtt->start + ggtt->size - 1,
+		     ggtt->size / SZ_1K);
+#ifdef CONFIG_PCI_IOV
+	if (IS_SRIOV_PF(xe))
+		xe_tile_info(ggtt->tile, "GGTT shareable %#llx-%#llx = %lluK\n",
+			     ggtt->start + ggtt_shareable_start(ggtt),
+			     ggtt->start + ggtt->full_size - 1,
+			     ggtt->shareable_size / SZ_1K);
+#endif
+}
+
+int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
+{
+	ggtt_init_generic(ggtt, start, size);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -420,43 +510,17 @@ static void dev_fini_ggtt(void *arg)
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
+	u64 ggtt_start, ggtt_size;
 	int err;
 
-	if (!IS_SRIOV_VF(xe)) {
-		if (GRAPHICS_VERx100(xe) >= 1250)
-			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
-		else
-			gsm_size = probe_gsm_size(pdev);
-		if (gsm_size == 0) {
-			xe_log_err_fatal(ggtt->tile, GGTT, -ENOMEM,
-					 "Hardware reported no preallocated GSM\n");
-			return -ENOMEM;
-		}
-		ggtt_start = wopcm;
-		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
-	} else {
-		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
-		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
-
-		if (ggtt_start < wopcm ||
-		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
-			xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
-					 "Invalid GGTT configuration: %#llx-%#llx\n",
-					 ggtt_start, ggtt_start + ggtt_size - 1);
-			return -ERANGE;
-		}
-	}
+	err = ggtt_read_available_range(ggtt, &ggtt_start, &ggtt_size);
+	if (err)
+		return err;
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
-		ggtt_size = GUC_GGTT_TOP - ggtt_start;
-
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
@@ -469,8 +533,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
-			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
+	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
-- 
2.34.1

