Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34912C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E951F10E55E;
	Tue, 24 Jun 2025 09:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRi/xtFb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2983D10E55D
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750756961; x=1782292961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H7hpNq8hMc622qJIRRrMPZj7QdAIJZVZhxv0gSrG26I=;
 b=hRi/xtFbi5RFiXKsGtp1lx/jWOfqux6wXJOp1O0a2fWUXIrxAmjjWf1C
 wdS+92fOR/V1AF7AGF0oMenqeiXwqEKaBhHpSh5S4Gp1AVDVGq5rfRfha
 uWCfvWoGSc2BvrUZlJOmGDg29ih6W2r/c13g6Wn6jy+g5Cyw9bjo7B8u/
 BW7oc/sM/GX5f3MP/s6xYuBkx/c1Ih0pXsw/r7fuqq6df/GV5QrJTKmJJ
 IB0kkt+TJCZfCgo9GKb5330aHU9Y7OUxsOuKRPojn4tVLsO7SouhwyrXH
 MPqHNmfcIMHOKw6rvl5aQzmh/4TH/sZisKUVlze/TTdY5Fjnm2kd91rvY Q==;
X-CSE-ConnectionGUID: +nudPT7USBWTK0ePEx2YRw==
X-CSE-MsgGUID: OqKAGAb6QiOXNIZv+S/eeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52860052"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52860052"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:22:41 -0700
X-CSE-ConnectionGUID: ef1NwXOPRrSXW3i3D8YFIw==
X-CSE-MsgGUID: fxBbvC22TWqHlXZGch3Spg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="155890574"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:22:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:22:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:22:38 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rd3r+KvYN3vVhjvCZ5T71yLK2/G2tmqo0uwE1wKesaTSw+qli8DlAx4B9q95zNRazx1+PJ8h9Ll7IzQ9SXf2UMMto8KdcBagobukdH3a6pyt+QpciqMgD0sYKjDccH0fWmu4N1Ij+Vjs0J86zAlA1qqOoXqLwWD8ZGWPTpfot+Ddr1t39R+mvcpEa+t9pfbDqJgqKa62JnAeJUFek4b3uyywot3SfXJBUv5OFyyvJdweAMsymYUoZk9h1laBU8G4/Kq4DLW0P1oIfekMUqeH63cCrV2tRgV6FHH+fQ4J+0IMmXdaSsxh4szNsHnGxde9SLUhoo0S33g+tBmwEyZG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijQFiYxnBeCtNFylDXN5E57F80ThwBlk8S9CcTIwuvA=;
 b=YJj76+Js+tnMSUZ8ZhhFhjAlJcLuLPBMVKGS78BV3LtPmQ7kCRQSoBJn0EZ6pkQYFBg+Gt9InUildAMyVCV+Eg+ApIZOxIm77clIn6Vno59Q1lXOYN0bBlnu6OPpWgjidBEh5yOBSDY90EjAly6G03902n585Pf7m3EBSjVl5Du5nnhmgx/nfovXQpe/515TlcyPDY3w2d6d/cKKM0x4ach4E4LIdY7Bjll8iMg9dlPPY3NzGHCdfB7+wxFkKCBiHqDguO/wOcymBpEntp/n4ufAeOA52PnOKFuqCSP0qj8fupo6Qd705dmfgzu2O9yYAi0HFagA4Ch6jDI3migb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB7690.namprd11.prod.outlook.com (2603:10b6:8:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 09:22:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Tue, 24 Jun 2025
 09:22:31 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 2/2] drm/xe: Unify the initialization of VRAM regions
Date: Tue, 24 Jun 2025 11:22:13 +0200
Message-ID: <20250624092213.2876711-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624092213.2876711-1-piotr.piorkowski@intel.com>
References: <20250624092213.2876711-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0320.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b66861-1a79-4bca-a840-08ddb300a59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODUydHRkSlJ4aVFnL0JsM2ZYSzkrUlZrKzlaaFZLWGEvMC9pTEdjdGVHVFp1?=
 =?utf-8?B?dVZKcmd2bVc1RnlNKzZ6WjgzRWp5aFNMVkxielFJZ2tyU2RPMnBacGVZQVpn?=
 =?utf-8?B?aXJsWkM5TEx1ckdwMHRlTlhSeHhnTzZmWVlpVnlsMG56clpNMGNHcGZsUWZG?=
 =?utf-8?B?WXMwNjZnOFlvYVR2MWFjbWUwZ2dCekZ1NHIybVNRSmRJS1UrUHpqcmN1Wlor?=
 =?utf-8?B?bldGTHQra2dOMCtoRzJETmlXZ1lWdXYxeE0zclpKRGtsYW85MUZJcDJUWmto?=
 =?utf-8?B?U21yN3NZVzgvN1l4aWpFYkZBUXBDVFJXVUJLRFBDTm1ta3drUU9ENTJlNlc0?=
 =?utf-8?B?Q2lnVG93aWYvSGdtU0hwZ3R1dHRkc0VlWjZOaE1lM0RtRWwzY2tCMEtvcDBX?=
 =?utf-8?B?cjNyMDljZ3FKUzkwNitpTzI1S2NIUmdDeHVmVHlrcDZxbm5nbFR0N1FiVkts?=
 =?utf-8?B?d091VERubWtCUVVrdDZoaHBrdFo3Z3E0R1dOYkJlUmVHRW1EWG5HamFzSmo1?=
 =?utf-8?B?aHBLclFudE9LRW1QcHd0aFpsV1k3SmIrV3Z1VU4xMnNjbjdVWm1wRUZ1NUh4?=
 =?utf-8?B?L0ZTcHhQWWJmNkErRXhocGMvT0JuLy90cWxBeGc5aXZwTVg4MTNKSjY2cWUv?=
 =?utf-8?B?cmJwdmV3b2dnektqUjVRVUt2dnkzTmt0clRkVDdocXBYUml3dkVySUJiVVBX?=
 =?utf-8?B?WGRBUDRCYVFZVEVLVlY2dG5VcUVBWXVlb0t4THJxZGJoY1dNWkFXUmFzS2Jv?=
 =?utf-8?B?Rk5KK0pobU5YbWRmaU1iT044alRzKytPUGZjd0VKbG5MK0gyMjNFM0cwUWNr?=
 =?utf-8?B?OE1IcE1YcW1EazNnek5iSTZrenJQeDEwWG1wWkphMlpDVFJWdHREZ25IWlFO?=
 =?utf-8?B?STNMbUlvY083bDd4K0ROYjhjVUFvS1Jnczh4WVVTUHhGaHlCZHhIVi9NMlJt?=
 =?utf-8?B?aXdMd0VPSWtwendvdEsrSGk5YUwrMncwcWJQb2JFdFZ4QU1ZWGNCZTJtYWlp?=
 =?utf-8?B?RW02OXJSNG53SFhxQXgycnpmSjFWbHJ3Z3JSdlFyRGl2bmVvdm1kYkRRaFN3?=
 =?utf-8?B?NSs1YnlMNEkvNGRwZm50dGVxQzdyZmlwc0Ixa0RHOGhNSEF6dy9SWUZramVa?=
 =?utf-8?B?NVZEcURKL3VWYkg2a3V3QldUbDF4S3lDZStrbjd2dlQyZ2ltZ2RlVjJ6ZnBw?=
 =?utf-8?B?QkNmTS9raFZqcmpHcTBCdkFncjZtSVdCdHh1MEFKVWhTU200UWk5Wnh0alo3?=
 =?utf-8?B?RWxWNkJnbUJyREl5UElRWFB1L1lBTGVVY3NHUGxwd01oSkdzS1lkYTB6SllX?=
 =?utf-8?B?ZHJqS1V3OUNMRjRYTWU1MlJsQmpFUVF6MldwY0l1a0dQVnJucjlxMlNPUFdk?=
 =?utf-8?B?czlMU0FvV1RobE5NaW16WW1YcmhNOTlpam5KNFg3R25SSVB5VlNpZnh2WURH?=
 =?utf-8?B?c2kwSWl2SS8yRGlLQ2l5RE9ldVBCT245cXFpTzRCSm9BRVI1emdiTkhsRUYw?=
 =?utf-8?B?MG0yT0lmNlNRTjZIa3RHN0lvRXJNL0VyK2d5UnVEbjZlWGpyWlYzdmZtMnZw?=
 =?utf-8?B?bXlUb3BWV2E4UFV6SlgyOFB3Q1dyZGxJT29zN202eTNjZHM3SUlaYWZKbUV6?=
 =?utf-8?B?SytuZ1k4a0RBeXZldUZabXp2eEluTE1NRERoV05OeXhkeHNZWUF2QjcvcGlD?=
 =?utf-8?B?UERLTjVGRFhRMHJNZVlGdis1dmlEMm9sTXExVDNKRHZ5TjhUWHVwbGZJKzAx?=
 =?utf-8?B?R3V5QmF2SngxeFNKSEZvd3BwYW5OMG13OGZyNHFKNGJ0ZXJDK1pIS1hBU1R6?=
 =?utf-8?B?MDdrSkw5N1Iwb01ONEpiOGkyTkxUUEdNNy9Yc0tsaVU4YitnK1pPd0FUMzk1?=
 =?utf-8?B?SEh0dFMvS3NGMkwrZFBHRHNza1ppMStsZXBRTTI1MzZIT3IvRUZNd3M3WjNR?=
 =?utf-8?Q?vOL4AmQWv6c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlJyZk5LdUlOM2ZHNDA3anBRTEVYcVF1ekJYWHQzTlV6Y2pia3VhNjR1TTNi?=
 =?utf-8?B?RDdjY1drc3FxZ09Ud2kzcTI5ellBSFkrdWhJR2ltaWpMQjlJcS9pbEdIN3A4?=
 =?utf-8?B?WEt2TytXQ1BmUW9JMUFYY3A1VTdSbWdpNEVWK2xnRGRkeDViYm9qamN2MkVv?=
 =?utf-8?B?bXZpKzQxSTgyZ0lvK2IzSWgyTVFIenA1Q1dkM09NaThUak03VG5tY3VJTS91?=
 =?utf-8?B?am9jZVBaR1hvbDFRbUdDMTcyR21IY2NWQlZiWU1lLzFkd1hXRE9wMG53MkNY?=
 =?utf-8?B?SHJrRkxTR3EvbjFFVVZweTJQNDJCQlEzeVFqeTltU01ldzRFelpZdE0zbUcz?=
 =?utf-8?B?amJCSCtBR1BzN2kxTnIzWEE5NlZYQUhWcjRMQlNaTi9YR3Q4S0ovS29LbFpl?=
 =?utf-8?B?ZlpZYTZEUnorL3BzT0lRa01qQVhQUFVtNHAzMVdOVWV6WllYVW41ak1XNUho?=
 =?utf-8?B?RTZqWDE4a0pvbWRUVHBqVkkyQVhmVUhLZG94VTd3dWp4QlhxVXJtZ1pFZ2pp?=
 =?utf-8?B?OUZ5Y05CQXM0RnJYOXo1VTkyZnpkL0dRT1YrRnNiUUI4Wm1MTFBHWWcwd3Vs?=
 =?utf-8?B?aXJzajBqdWh6QXMzOHNDZ000cWl3YVUrZTRaQkV3TXd4ZmpVWERLa1VsUGg0?=
 =?utf-8?B?OHduMTRQNmFmZzRoRkRHUTA4bmlTaDI2U1Qxa0lCd05uS2M3WHNYYUNRNTVw?=
 =?utf-8?B?amhMeXl6dm5iQlV2RFNIeWlrSFl2V0w5enRFb2tQeVAxWU1aWHRwdlIvZmpI?=
 =?utf-8?B?WkMwRWt6MzZBSHpLZ1JURkhVQ0V6bDVIYjlleXZOSjQySUVaTEh2b3BRY3Yy?=
 =?utf-8?B?dUxzZ3Z0K2h3WmZzZVgxQkFFU2s2L3BhUElaNE41N3ZPNjFwbTlZYU4wb2FD?=
 =?utf-8?B?R1M2dW5sTm5LTXdGQmhZTGRYdHBoWFFGZGJTMEEwelh6ZlpYZmFKaEFQMVBO?=
 =?utf-8?B?bGcvQmc0U1kyQ21OTnJLS1RkNDBTdVJyRTJIUDRkcmo0TmVZVEIvQk5jaGsy?=
 =?utf-8?B?WDViT281bGhrd1U4bEdmUnNadHFlemljWEtXVThBbXE3ZS9yUk9uSnovbVU3?=
 =?utf-8?B?REFFczBuSzJJeTdodys2QVpmelJMN3dIMnpya3NtY3RNdStpL3JsSnpMYWE4?=
 =?utf-8?B?d2NsTUdkd0ozd3hWbHc2WDRONW9ycmVZWjJEbW5pazBtM1d1bzhkb0xOUmVq?=
 =?utf-8?B?a05qaERVZysxOUp0MTdPSjhIdXVOVTBJRWhTR05JYTFwckZXa0h4amJsY1Q0?=
 =?utf-8?B?cUdNblY2bE4wUDVXNlFLdUZHaHNyRkcrQzJnMFkzR2hONTJrdDBDQ2l6RzJ4?=
 =?utf-8?B?RkJIVkpGc3lIRnRsMm5FbXA0WTJwUkdKMDNTYTdheE5mZjJiUHpXMC9oOEFX?=
 =?utf-8?B?TXZzMWMvNngwamlsYnN1a0xIVlp4V1BYYzg5YkhQQ083RWRINFVET2M4cVRL?=
 =?utf-8?B?V1g5YU9YVXVlSU9EVnMzOG1aVkJxRUhPWkdvRVk4Z1cvb0JHSGpKOHJHNXk4?=
 =?utf-8?B?QXJqNTVxUnV3Lzh6TjJTUXVzejdvVjZkQ2tRSVpiZ3d0bHZTWGpJZTVzRXIx?=
 =?utf-8?B?cVZtRlAzbUdrWHY5c2tOQ0wvQXJMbVJjVUxjZ1pqejE5a1NRYnpoSGRKRzlv?=
 =?utf-8?B?WnpVclZBWlFRSkhubFMraHEyR3p0THcrVit2VTFSbE11dVdPZ3FxZDFhV1NW?=
 =?utf-8?B?aG9ITzFCUjlGUUJoZHN5N0t3MXlNS1Y5WlVGUjdYc0VPMERwMzdqYWxpRWNC?=
 =?utf-8?B?WlB1NkptRGJ1c0dnUGhvZ0gxSWl2T3hFVEU1Qy9ST0JKK0kxMzlCSFhYZC9v?=
 =?utf-8?B?R21sV0QvQmdJemJRL2YxbXpmZk82WWtSdXVZb0dUbW9haC9Xa3NZQ3pQd2Y5?=
 =?utf-8?B?SENuZnpidGFIZnJYK1VRRllOK3JuS2drZXk1YmZGcVlMWUkwYmJrT1pqRHps?=
 =?utf-8?B?S1l2T3A0N3BUZUNadjVSVTFXTTh2dVBZM2k3cDlRcXNFVkRGdVBHMHYzMkJX?=
 =?utf-8?B?ZkJlNTNwcnl5ZjlpM3NLTnc1a24xaVRtZlZ4OXYwYWlDKzRqUkFJVDNXMXcy?=
 =?utf-8?B?NEhlM1F5a1BzbzJtajYzSkh0VkFWSnJJZGFBcmFEY3E0ZEF3bXA2RmpPdDlw?=
 =?utf-8?B?RE5aSzF1dGZ1eVpxdjZRM2tWMzMrQ01IaXR6WnhGWTJsSWNNMWxVYWxESHZu?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b66861-1a79-4bca-a840-08ddb300a59f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:22:31.9281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMPYw8gVqlHA/AQDpdHFCNXoQmwaaXGoRTE+MuGRGNHvxET2NEGJAp/LihV3cfdAD2maVMU+LWuZAd7x4N5w3zh++yt+IoOnr1+LOCUT39U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7690
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

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |   8 ++
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  12 ++-
 drivers/gpu/drm/xe/xe_query.c        |   2 +-
 drivers/gpu/drm/xe/xe_tile.c         |  38 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 148 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vram.h         |   4 +
 8 files changed, 135 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a7bcda67d05f..e34a48d1312b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -76,6 +76,12 @@ struct xe_pxp;
 struct xe_vram_region {
 	/** @tile: Backpointer to tile */
 	struct xe_tile *tile;
+	/**
+	 * @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -108,6 +114,8 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3522865c67c9..a20ddab31c96 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -74,7 +74,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, unsigned int id)
+		       bool atomic, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -84,14 +84,16 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (atomic && vram) {
+		xe_assert(vm->xe, IS_DGFX(vm->xe));
+
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, vram->placement);
 		if (err)
 			return err;
 	} else if (bo) {
@@ -138,7 +140,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -572,7 +574,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ba9b7482605c..ffd2efffa7a3 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -409,7 +409,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[id].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index c64a4d1a5bb9..3acd8e359070 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -18,6 +19,7 @@
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Multi-tile Design
@@ -111,11 +113,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -153,21 +153,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram->usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -185,17 +170,20 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
 		xe_devm_add(tile, tile->mem.vram);
 
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+
+		if (err)
+			return err;
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d9afe0e22071..3a9780d39c65 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -337,12 +337,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..87b7fae5edba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -11,11 +11,12 @@
 enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
+struct xe_vram_region;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 18124a5fb291..e35b4dda9172 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -19,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 
 #define BAR_SIZE_SHIFT 20
@@ -136,7 +137,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -147,16 +148,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = ioremap_wc(xe->mem.vram->io_start, xe->mem.vram->io_size);
+	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -287,6 +288,65 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->id = id;
+	vram->placement = placement;
+	vram->tile = &xe->tiles[id];
+
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -298,82 +358,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
-	if (err)
-		return err;
-
-	err = determine_lmem_bar_size(xe);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
+	remain_io_size = lmem_bar.io_size;
 
-	io_size = xe->mem.vram->io_size;
-
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..4fc0bc1df4ce 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,12 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include <linux/types.h>
+
 struct xe_device;
+struct xe_vram_region;
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
 int xe_vram_probe(struct xe_device *xe);
 
 #endif
-- 
2.34.1

