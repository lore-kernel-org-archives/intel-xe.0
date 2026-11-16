Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BFD606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F7tk6YRh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=K6ecRGE2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C586810ED5F;
	Mon, 16 Nov 2026 09:02:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F9910ED5F
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794819738; x=1826355738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LGo0t1y9NEZIQeZ4SkWFAwPZw0q2OcTahZxNR4IJRp4=;
 b=F7tk6YRhrZTgQptRGDbTWZQVKGts1CACilbYVIwZo94sBZtKdLVLd/h+
 Tb8U3zGCNUGrDofVF8nvf9+xEeLedYnQa3DFVmORQ9pm2rVVHTydf5kep
 Du2w+sHjfPIThAOZMdTygPvM1dIOTZoCPlioV7IK1Suf5wtqi5pv6zz1s
 jUGHD6VAgB3IAkH88XirNNlUyK6kta16qvwYagcecriu/Zwsz7zECNec+
 XudGv3s5C9rHO0GYmGBxYDnyTS6MPhStyokBkiIn8Yx/zSAuqHcdKe6Va
 GCmbWutywVcIy6C0bArAyUy8TqpbFtROk0yT11FnhUYvYjdRRKsy9Aibp g==;
X-CSE-ConnectionGUID: Ok4xEm6WTqOtpd0OdrkSaw==
X-CSE-MsgGUID: jhL8tlWfQiG4ZkQYPBsDQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3561108"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3561108"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:18 -0800
X-CSE-ConnectionGUID: 47bCW64aQCm4wN4zWyjn9A==
X-CSE-MsgGUID: JbralK7TQg6rBvDtJ95B/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="11275690"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:02:12 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HW7fu2j2hbbyGPeFYiBNdysolMbIxeOhb8MvgX+22rxmPiCgrRvjojb2u4kfIeYu6FDvrMpuMaQ0fLW8XJ3oVjF3DbysiTLw2nIxNi6WSvhBHFqjGb2md0IOTM55/EOYq8r36Y5mUlVppWcRUOxs5ZbSzdolNAXSptzaFEcd+Q2AnNv96OcNMvTZb6kkaJPpjGRQs148SN8FtWFK56cRvmFki6lXeRyk6AXdCk3+iItBpF2+EFoX4TljT/AjXcCmBOs6mbOag8ISaxOpAK+hyOGeLHq8ifqzLoMYlaLRvLbqQvVw/BBY8CAB/fnciPI2RWMWMB9sYHcr09ZYyFyqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ta4D4fgKtZPhueSJkKyoMt+8lpwOhwn13xNE4pyBrAY=;
 b=qBShj82c2lUNM5nJv0NrqKhPu/3x70Inmm0F1vuurqm9rgIHQ3pGUadMLNhyHvUM6w+opd1XK8DRer6joaxvruJYYKuIWm3/KwW1OvWUEoS8cwlJvQ0DuE2kyzeI3cJfyEgeLhwXubMnN1pBduFUWOGq0DlAY71NVgg1P7EtfUvNZ7u/hrVCG/AM3rJSXEz/t9HZjqpHfai+5mnMXVFpMEQAvLdLVclEBkT/fDiaHbXVhlYQC+9FC+tJOcVlcEeerSonvxJ54D8SdFtOAj6Iz2AqMA9SduyTNsO9SGLf5u9gMMeFR27YCwt+i0T8K5j5JzVmLUyJ1+N3WfcNupPvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ta4D4fgKtZPhueSJkKyoMt+8lpwOhwn13xNE4pyBrAY=;
 b=K6ecRGE2A8S6lhCTMpGqSS90SOS6+TWr0yZMhEfT2RKxidu3PuFPFYZPSeMrVCppOVDJGkHgNN8ULYbeD/J+W5FkWQfnDoyJRz/QH8Q3an9UsGrAg4OqZCeHcFJ0S0x6FnlK0uzd0lJ90eLHcDN5d4XU1L+Rr895yEOMWTAZOCQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:01:23 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:01:23 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v9 4/5] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
Date: Mon, 16 Nov 2026 10:00:52 +0100
Message-Id: <20261116090053.2466938-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
References: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 878d9275-d514-4f36-0443-08df43c03012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|56012099006|11063799006|261102123227099003|261102130727099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: j9jjWXLrx3QfuwspdZ5NRUwiCyUkpcbp8NXKCjpm/ZTt4jZUy5QmZyubp+ScjNinENQvQ5AmUAHU37V7b1xsJRdJbmWXG96/vwrB3umwj15iJfikXUbI9skpuOQSf452WeWO/joX+GzGaSjUM6VJUp4nJtEbztX1XFkaZWhmRTo9GC69ets7gXC9qrxsCSmgtwvf+HaaJYIIHo9mUqsHdtjUiu197fS1pFlczW4Fgjb3UGdg23JnbflNAiiW3FonikfjFW27ycq32ykmJIfdqgHwa7H8egTSeu1sHSeYn6+XPNyYt1Ms2TAvRTZP+xrSJiWDkRkiYL0CTzB4Db5oya/pwwV+DV8Ob3HD8S8uPdbMNQH3jkJ+EdLPIrDsffkG08QTegFqOPTr9NFHBpeVowZNmZR1GQneqbm9yw1yLQQghmAaxoEvwivHpmKE8q0a15H7cM7T1dUFCzEJtf+8gVGZz+NUaLqMissfFuyhPjMZ33HWD82G5IhnGK9YBxxdjx2YeW/sCVUqpfe7gDQQq8+gY3GwSX/BO71kXj7vsZ/okG2OvhkQZXo2bXERuLRjy0MXRZ8YDIKHjj53rkICEPMJ3/evVMvGVfaLj5z1BWYV6pzDTrarN0axRqflQMz2R8GCOrQ/rZVrNPXEVNnitJqrwchjSSxrGQyp9L8Ah6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0tBL3c3RXBZaVRjUitBNGZhTW1rT2h3ZFVaUWFGR2kxUi9CRFNjcTRRMEpU?=
 =?utf-8?B?SVNsL0dOeDI0QktnS2t2QnpwVElKWDB4U2hJZCt1elpGNlRiM2dkNjJ1dHpF?=
 =?utf-8?B?MmQrMmJGTjcwRTZlRWRxNkZaend4L08zbWpNOVB0RGJVRUNPZ3RQeUhpSVll?=
 =?utf-8?B?UWN5WnYvemRBMlQvQkxMYzYvaE81NzcyTFJ4cHRac3p4dVJOcmFRcCtLejU4?=
 =?utf-8?B?L2EzYmhCbnMxK1phTFplakdreEd2SGg2WWVaNWxNT2dWWExlQmdqZE1NeUZI?=
 =?utf-8?B?T1NLNnBIK2prRmdLNzNlcnl1WkNYOGF6V2NqN3ovUVNnMElLUlhsLzN0cHVz?=
 =?utf-8?B?cytjQ2FQUnNYbUR2VUNTVzNva2pIRW5GNjhEZUxIemROenB0bStCZ1kwalZZ?=
 =?utf-8?B?Vk1aMUNtUnUvY1o2ZkVTYXByRExTZXppSVRvQU9zU3JRWjhzZ21iQThsQnNh?=
 =?utf-8?B?ekFNdFl1S3ZJbjJWVWxCN25DYUlxMFhTbmhRbU9FSVNkZWQ5dUtiSERDUWdU?=
 =?utf-8?B?bWFGQjRkdW52aGxHQmF5d3ZBRnpOQzhpK0NKRHdWeExldzJQbi80T2xzeGlU?=
 =?utf-8?B?U1phcWZ0b3pDdG1zQlhZMjZ3R1RZM3RLQ2E3VFNuTE9oZDNoTDFlU0Q1c204?=
 =?utf-8?B?SGZIUU43WlgzU2R4bWlrRUlPK2RvcVgzcG13a21EUHlPTGtxVTFib3BPclEy?=
 =?utf-8?B?T0dYRTNaVkVRYXJqRFk5SGIxclNCZk1RWEd5VitNeFVRTjhIbDNXZ002M2NR?=
 =?utf-8?B?blNwQ2JEdXNkYmwzMm5uSEkvcVpaRlk4S3M1Z2ZiR0hqd1hRQzdvUUpDa3ZQ?=
 =?utf-8?B?ZWFZOXh6aHlSd3RhYkF5QUZzRU95V1hGck9MeFZEREZtSUFXbTUxVlB2d3lj?=
 =?utf-8?B?dDhyT0xRMHkxa0U2T2tuQ0tmS0lSSktmYlRNZEhZNXRoZkNnZFV5NTFHQTVr?=
 =?utf-8?B?b3dtc1FsZXVMazZrMXd2b2pYZThZWHQrL05JWklHUmZYN29CZkJUZ2lpcGhj?=
 =?utf-8?B?NmtxZmhDS3NycHBzTE5DbURxeEtsRzFRaTNCcktVMHpyYUZhQXNPUWtwTWFh?=
 =?utf-8?B?S1h4bHc5eGJheFRqVDhOWGdoVnRUZVY0OUQ1b0Y4Rm1FUlgyKzZiU251K0Vt?=
 =?utf-8?B?ZnAzYjVLK1VxbkpJZDFqL2U2dURtam5sSmNzSlpvNHFPZlpxMTNHejFqRE5x?=
 =?utf-8?B?QU1rbmlCSVJhQ3c4aTZxaklaUWc0ZFZwUEFjOXFHTFlBS09ZeWFYd2ZQVzVz?=
 =?utf-8?B?WUxKSWVTeXJ4eXMyTXh4M1N4bFBPeWxZVFhkOVltODgwV2pSMkZWMnhnL2xt?=
 =?utf-8?B?M29QczE2REV6OHJVWjZ6SGVnTlp3eHZlWlBudnh6WjNNMFcyVWxJUTJSZ0dV?=
 =?utf-8?B?NVF5TnFKRVVnM0ZXK2JhWWtBQkRiTHpXMmpFUGNlMnd6dklJNXZTVWtIMDM1?=
 =?utf-8?B?WnYwbjN5eFFaYm5PL0wranJPRmMxRVJ6Um1aKzVlcWZhSnJ1MVQyS0xGNG5Z?=
 =?utf-8?B?aDA4NzV5bWdVYlZSRHBDVlpTNHZBM09OQVpDbmVXNTVuTzRDMm9JZHNtcW1F?=
 =?utf-8?B?T083VXlwVi8xRVV1WjdkbnJYdkEzd2QvTVYrc0phZmxEenRBWkRqK01LdXE1?=
 =?utf-8?B?QTNZNmd6K1lFQm9jK0JpZzN5U3UxK0lRSWN2VDlPZWExb2V0MWg0MktlclZ1?=
 =?utf-8?B?aUtqQUpWQ3pucnowZGxUZGpjOHVwbGh5b0pFODJPaVVlaXlMMHNNRFI2eHNt?=
 =?utf-8?B?ajlqS0dJQkFKRDQ4b05lcUlqSHVPVDBmZXRRR2dhbzFSSVFKVXNtQmIxTmx2?=
 =?utf-8?B?aERPeU1BU0NxWjl2OGJML1NMVndGZUVUZU9WWEdUblVCWWhTVmdTWXE2K2V6?=
 =?utf-8?B?SHRCYzY4cWVtWVRIVjJudkpya3pvc3BjVFk0dGpZN1ZncUhySXpqQ3RkTXpm?=
 =?utf-8?B?Uzc5TVZ5aGpJRWZSVWhBc3M0VjE5K0pNdWp1bVQ2aUZxbm5FNHpPRG1uTHds?=
 =?utf-8?B?WFhGc3FMSVh0SUdaU2V0NC9vaTN6bFIyOFArc042WGJOVUFOaFF1TisvOEx6?=
 =?utf-8?B?V3RhRFpVQVo5SlV5QVBRQ013YmJzOE54cUVqQ1hlRE9kdnArRGllcnJiRXdv?=
 =?utf-8?B?bHBrSVVzYkdWNFVKbmU3WDd3ek5HTldCcHViaHE0MTFONjlFSkprYWRjUnFU?=
 =?utf-8?B?STdJcXRuSXZQYmJraXdHMHVQRzJSQzhNRmpMYy9PWVg1SW1lRmJvUHhuM1o1?=
 =?utf-8?B?RkNZaktjTUVPMG1UNlc2anE0MHRkMEc0ZS9Nak5ZaHlYUVpRZGR2cHJTRklN?=
 =?utf-8?B?ZEU1ZGpqYmxBNXlrS1lKL1FqTWdUSzE2aHkxQ3A3ZXlFSmhJSWxNK3oyaGpB?=
 =?utf-8?Q?7dj286YJgIlguK+M=3D?=
X-Exchange-RoutingPolicyChecked: VF4yy5HlNEhA16g7Z5/RsfAOwrb3VmJg87MtgL7EEDK6+m7ngDU0/UYXnCE+K6SppLjcwd7+OoMB2WKufU20pRGT3cd52qAnTYwTv/TJPvnZOC630QVJ9EVtere/kYljR4xhZZeadum3Yp6A5bicr2KHR5Z2nHXfFIdLsSTQ9qexZpt76UZeIyjgxViXmODWEtJC4BD0LZ+dH2eQvw+Hg67sCcmxvjCd2LSK4i7P28yObSiBKFI2poexmtJule6TIJ36TLlshiEK5X3zOA8n+BGu6PXMKp7MjsRTasBpBEYMtVV5jSLXY3NJmpXf03xZIDbFCAvFguyPWRWIFQf0dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 878d9275-d514-4f36-0443-08df43c03012
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:01:23.0586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QP2xn9HJFh663OKWXnLiC7rvNsBUa4/P9Y7B+AFBIrd5fpNBJPUsiYiEB92p1NlHR3/YsuOm90b+Gs9yoPBGkrhtnCeDAI5rGdrOKjEyDdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 129 ++++++++++++++++++++++++++---------
 1 file changed, 96 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8bc888f6274cc..3adce6a540135 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -397,9 +397,99 @@ static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
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
+			     ggtt->start + ggtt_shareable_offset(ggtt),
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
@@ -427,43 +517,17 @@ static void dev_fini_ggtt(void *arg)
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
@@ -476,8 +540,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
-			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
+	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
-- 
2.34.1

