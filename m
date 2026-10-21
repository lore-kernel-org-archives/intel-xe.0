Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32CB606A32C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F11HmZHM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EF410FCE7;
	Wed, 21 Oct 2026 08:58:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222E710FCE5
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792573090; x=1824109090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lliGCQtUILulzoe5jJ/svF6nBn1Ab3Gny2ZQhJalPvQ=;
 b=F11HmZHMMDeUxZvQpO9tR5g0yG7GYkDQOgNVO5kgGEdA6sHNRLE4y9rx
 LZ8x5KjDvSgR0qeKTMZe+fctRscAbk1PN1AKia/G/UL5zHtlZAdCC5Q/f
 QOssiEVfIJc+udwDlHpZxA/gSX0y2GdGAAUCgPKAnrRDH8+W9Sq7AeOZg
 yAGnSz7WFlM5L94AypaRhdO5jO34zZJ5anNEre5SArukrRkJyeaEttVJN
 EVhbIxhMHz2Md1LJtdoZV2/GgT3mOilxTisWPDHzyNEsxmdQEUC1yhP2M
 Q9kp56tKjf08LNBcRIVTAr0si/qaoyFkyvoJNw87gdIby8+1SorpFgfUw g==;
X-CSE-ConnectionGUID: B2mnEsntSIG5254vE3wNDA==
X-CSE-MsgGUID: Meoz3BtsSTmGPDaZ1NpIpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1180855"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1180855"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:58:10 -0700
X-CSE-ConnectionGUID: SEo01TLWSDq+EWr7xWjBgQ==
X-CSE-MsgGUID: /9ShjsBfRWOc344Feeb8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3370970"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:58:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:58:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 01:58:09 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:58:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7+ruAEzDnf0hRpURo3b3mUa77yMvKLSUFe9vS4nOJlWhS9DC/3137aVvWsQkMT5ZHPKqFqHmWkNgHMS5PJB3bTcsnUAV9joVpR0LWerNF029xzC308hfQm4qWPB7WHzcUt9RECRBRUAQ6zG5KrtPMx6D3jsza09MqI6CieqyOEfM+s2clA+ILF9HIS/vc1vTox1mm6l0Q6LcWghos829M/BYNsggL5fb8lUt7hCiRP6ugzqvZH0Edorf7BZPVbfmViTUXVQrJVPEOQChcWSrXa0CT8J+qq8x/FCBjWJyOMRVDkfJcjoBANIrqEhBr50mVpDEah1Htm4aTPHRAT1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYT1Tve7OgyJvUi566nuyQpJnXg5fIrU6AwJXOi3hgM=;
 b=g96YKgKpNKjPdhRc/9JHz9GuibRVbayt1ptvYXmqa35kSPfNh1HvAZNrMF2+o+PffpxxKaiapVazfbIiNH+55CtzozZ+Btqj8zNCOqrEiIJ2c4ociLgvueK0DqHsK3m9AVJxkRvG0+GIRdHteqigr2qhWNPqnNlmJAhZvtp0zNSpV7l5JLV0FFqZvRJ5CKwt8rz+e5jRzuskXJ99JyogToThkSuCcw0FQdRN18NAc6wBJu3kMaE6v6nxrYG8+2hTVU1LaK4X9NpY9FpR2pXODJBuDsee79TgK6YSEUvvQrDpl/gPqdQQcdiaDYwQ525MVm1/p9ZGTJ0NNVkuEpXiuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA3PR11MB538038.namprd11.prod.outlook.com (2603:10b6:806:589::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 08:58:01 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:58:01 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 4/5] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
Date: Wed, 21 Oct 2026 10:57:15 +0200
Message-ID: <20261021085716.709503-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021085716.709503-1-piotr.piorkowski@intel.com>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA3PR11MB538038:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e481910-5902-4aec-f233-08df2f516935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: fHE2uzVn1SYAGU/cY890taSOv6bAcM/hp8T4h+VzcQygkKTMzMsB/bXEYk+yKlr2Ssss5omHtzACGX54jsWooCp1g8W0U26xSvYruGPOo/EHpf2CD8mtxEpZzRS1Tu0VvPoC5Ec5tVsUkYX671QiHNkSwufxMruqYXm1CbzLGY+Ym4ooPEP3K35fpMN72a6tm/WK7T9V/kRN1rtskAebRE0YAzInAVqvOiFdVyAfQzEPdii0QziiK2namsZW4PbCr8mEe8cTLJH3spsFlh4hWoDEaMgRhcpxF9Y6dwkez/anzrL7yrCjR3oDbqp/Iu3vJS4fE3wjOTPQcMxIvzwqorSSjqSojePuHGxrMo4d/YqOH67ZSPeN0qKvxsDDD4nua/8PTaiyJNVETiUivOb12opgPp6ghZtIWiGo4U9ASx3YGboI9Q4dL12VdEl+HpsDUNZN5llhWmQMW4c+K40irVLw1yzfvddFXCPUoJ5hatgRNRSjpPQwvIX1ZHA1f3fm57/qGDscMPZqDbMVuphNJpeql7JUM454oCv2D7RewiJjo9ekI9mqSt96uzOxuwcDbdaiOR/Ikmfj5xpG8B5TisyzsAFAiVWRi2jzzvYmI/PQgXatsq88vAOQyMth+EDwBku543JZWG9SBVtwjGVs+I7gtJ0U9IYU4IRMVyWMkoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUlyU1NuMzErbmd3RnNEWS9qSCtlYTlDbWp1djFZdFNoQStzejBTQWY2OVpq?=
 =?utf-8?B?c0ZyWFFBTVZXdHZFeGhZemRkcCtQWm04V2s5ZVhEQnhYVVQrbmFoTXpuZUVZ?=
 =?utf-8?B?Mnh5SjZaRDYxT3pyZ254emlORWFMRkxvWU1Oc0k5cHZpTDNqOXJoZWJBL1RF?=
 =?utf-8?B?NmRtOGQwZXRjNWl4RHBKdW91L0VqaUFKUHpvVGc5REU4N2R0eXRvMUNtZk1K?=
 =?utf-8?B?OG4wVmpMRHoyL0xsdnRBS2l0NXF2Q05ySEI3R0ZuVlpnY0M1OHZUQU0yRTZz?=
 =?utf-8?B?YlVTcTI2MGNKR3lURmpVc0lSaXB2WWVlSE1SMXhRbVpRcWxCc0JmY3QzSkhX?=
 =?utf-8?B?dVZtMERUVmk4TWNVZTFOMzViRnFmTmZ4OHArdGQ3d08rV1d0YnprSnRoa0lP?=
 =?utf-8?B?ZzBCZjIxdnhJcXo0RGUvNjFyZjI5NnR4eGZQeitvVzloMjR0R3g2M3VCaGto?=
 =?utf-8?B?c3RGUEhyOVFCWUNEZWNmekpjdlpUUmdyNUxHSFpRUlVnSWJOU0VFQ2pSWFNE?=
 =?utf-8?B?Q0hRSTduZjBHTEVIU2NHYTBtSk5YVWwydk4ySGZLYXFjQk1wdU92MUVpUHpr?=
 =?utf-8?B?T3FXaDB3N1V5Rm94U1UwRERPdkxFcW5HZmNxVEFSRlJiYnpMOEx4UWZFa2Zm?=
 =?utf-8?B?bjN3Z29rU2UweVFiTSs0aU9tbXJMMFIvZ1hFUnFiMkQ0cjE3cXh3bERyTlBO?=
 =?utf-8?B?UitDM3JNYm5CZ1BLMWhKMG9aUmJXcktRdkZaSXFhQ0V1aG0wdlN5dDNxVHB5?=
 =?utf-8?B?ditRQlZLQ0ZLdVRuUTlXVTRPVE4vZXVGMDNrUEM2RW53RWJjNENoelRaeVND?=
 =?utf-8?B?cnhUV1Z6dksvbDNWVXNlaEFMVmdlRHp1d0NqS2N1NlIyK2dsbnBEWkxQa2FH?=
 =?utf-8?B?S2RaZFUyaGE1SXBydFhEb01QdWVaY3VqRXRVQjJ4NkVpRURNSnlyTjBFK3dV?=
 =?utf-8?B?RE4zUmxHemNvMEJRdGpXK3RqaUJHL2pFVkpsaGVxS2dGWHlUaGI5U2o3SEIr?=
 =?utf-8?B?clIybG5Xd2ZSUFJmYWpkeEhCNnNaeEpFVE1SZmxFYVkzRlB0dTdDTkxXbko1?=
 =?utf-8?B?ZG11NEUrbjFaSzBWUTdvTjlPVDcvZ0ZMQzhwb09LRmYrbzNJNkFCZVh3R2pa?=
 =?utf-8?B?UVNqdG02RktwNS9KOEpLbG5EZU53VVkyYkNvTmpxN1NkS0tPbHVpYWZiU1M2?=
 =?utf-8?B?ZlN4cWhRbW00TmUrLzdJSzNDTDUrVXFrZ0xyS0ZQUlRNbkZmd2szK1BGeUhG?=
 =?utf-8?B?QmxtNUZlWGJMRHd2UjRUZE5PWDljYytqbkNTYVhDdjZtT3FPRnpnNEZwbWpZ?=
 =?utf-8?B?TkkvYVNrVTJwOFcvb2JiSlQzL0x0Ym1teE5DdXBhUGduZDRwQ1RXYkowdThJ?=
 =?utf-8?B?R0hNd3ZUUUJOVEg5MTZXV3UrWEI3OVR3N0hGeHlOQmVNcUFWcmhueDZpdVFF?=
 =?utf-8?B?d29Bb0tyOUxIRExXcDFtVDV3RFR1NXNSMk5IMXdzN1NYV0JVUnp4V3NrWnA1?=
 =?utf-8?B?M1htQ2xoWVJ1OVBoOXAzREhHUTJUYkxTdXNPS1ozSUZQTHRhM0V5bVN5N3ZV?=
 =?utf-8?B?ME9OODNOQUI5MVNVOEVIQnZBTzZSdzdKWUhVQ21VMXQxalVwZFpnMUZxTmlk?=
 =?utf-8?B?cnhiZFIrRCtOWUtaWDZ6VjgzY2JRekdQNUJoUXlob0V4c1ZNbDdzQUQ5TWEz?=
 =?utf-8?B?cXpCM1NSY0VZUnI5dzBEczY4d1ovUGtTOTU3d0FHQ3A0djNMaTUwbXJ0eXBB?=
 =?utf-8?B?LzlPOGR1emJlVXltYWpLRVZBbjN6UTI3RjhRLzBEa1lpRFFzK2w0b1FsOEJr?=
 =?utf-8?B?V0Q3bFVMTmlhcGJZNnVmTHVBQ1c3dGVWdkkxNThwSU1vZlJkWXAwMFQrcHZE?=
 =?utf-8?B?QUVKUkFIVUJyK0dQRDF6RGd5OWZtMUN1S3BpZWJzUXpmR3gxVEVNRmZBcG5y?=
 =?utf-8?B?QnBGdktiSExkZVkzQWZLbGtxVkhBdmpjc1NrbUFGUXlPMktuUWY0dVZONlZX?=
 =?utf-8?B?VktrcmNydFhvbjZLYUdueGIvd3VCY2VMMEt4VDlrNDM1cVg5Vm82WmEyRXcw?=
 =?utf-8?B?UlZlYU95bGc5SDR4eXZrZkt6eitydEQ4RFVGOGtCc2djY0k1L2MzeGxIUFd4?=
 =?utf-8?B?bEJUaUJNQ1R6bkN5M0tFd1NscEcyU1ZjTForcWZkMGJjcm1pUnU2dDhTamRI?=
 =?utf-8?B?SDhRbkp2RnpKRjFNVmlYSm5CV2l3SHZxWG5xVEcvbkNjNXhDQ09ocmlHeEhp?=
 =?utf-8?B?WHBvN3cvbm1wOVI5aHN6TE1NNlRLNUIrSjBsd2htWFRGRGdBM2NXUnA3Qktl?=
 =?utf-8?B?RXRGWnJ4c01oZzNnT1g2WThUVWR5SHZyVlZrKzhYSXYvbEZXVjhzaU90Yzc0?=
 =?utf-8?Q?sW3EUSNQn5DgsWJo=3D?=
X-Exchange-RoutingPolicyChecked: v6q7vw5XH7ubCeb3R7FF5tzbwz6mBYh7MFQejH0Ir908ZEPUA0LpRXbwqn4tJjtwY7LNjVUF6CnhG9fogqRQidCoRE+l8RXQ/4/DkDH1h8BN8liYSb2lxw2FgKAlD5reHwvY/M6Py3C0jCP2pIplk+ORx8T3SLPgKggwzxJB4uXQ6Ktw40UHNfP9A9fzkoAb0suTzoRb40xvxnsCqUG0XeI1V1Xtg4R+bItgkXRdVqOg9kik3viGtlOuiNKDBetUEbvsbrq5HlinZAFBl1bsqWkj7RsLT8RUOPHwx9WNculLipPsqwey2dRiU0wok023ignYtC6VJAkPE4MasGSlNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e481910-5902-4aec-f233-08df2f516935
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:58:01.4898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQ972rTUNCy/XIIeo1oPwrYbwlHgdFSXriOtWtjMxVhZ5YxsDQ67GnVHCVX+lU8ddUgxvaIyWg757zoXDc1Rs588/aMg5oeDLvjGkuZqICA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB538038
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
index ad4180400a8bd..b7e3d626e8cb8 100644
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

