Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D33CCD183
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 16:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D4310E949;
	Fri,  3 Oct 2025 16:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTVzAU1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400D110E949
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759508815; x=1791044815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=81MEZgkOhzF1PH5x1wGsHE9hZ1He0PFCzRC1uPl0k/s=;
 b=WTVzAU1D75BpZejnlhiRpjP6GXS663O79+tMjYCFc5QrnIcNVfi0/Dwf
 F2pma9puC9V8ADSae/tLEcPHHjqOEnCbCK9PvckOTaIfcVn6/tuxnh65r
 Nel2mhVRRZI2qZU9LPPEhq4szJHZvPUxZFxciI/MWo1GCqkXqnUf9UNE6
 QE5bOZcdVRPh+PlIuYSdl87o3vfsJe7gIjej1wnysTYbZEw7lDti74h1d
 QN+/P+y7Pb7o3jxCwA/z61Tzh4ArQmmY+JFoiPF4K271Zz6wBXPWdS5/h
 I2TzX7QBq3MnYL9EmcQf5kaoMwcpYfIRXe6bZvyb5mxchdshv8qABDkoC g==;
X-CSE-ConnectionGUID: B8O2+VbRQTGO8gv1C6btvQ==
X-CSE-MsgGUID: S/PF4B6LTiyGG+hjTU40WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61754536"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61754536"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:54 -0700
X-CSE-ConnectionGUID: in1CE65tT++m9AuxqJMVaQ==
X-CSE-MsgGUID: QVFXdlQpTzOBdMRbj5P0xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="183729464"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 09:26:53 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG4ihCstF+V6p2VTMZWpreDQc+sOpGIHNgYc0CjRiZDqyBsPBkY2gZPLVeCPOqwQbt68JhBtLfKRawpYEyK6kgCMdMFGjL//XpYskQebUHEnNb/UpwkGqXEZ+BmFIIi5o3/ds59RgLew+2VQQ/sA96JNwyGy4/ELgC+xnz4i+lH7otVFgB2MPU4z8G0jJU/l7BSGqOgFEhOkkPIRqEKYAlzKiifvESiSCNuYUMRCkEkz2Nq7f8YTLCwaMbcD6+CFukUi581qaxcOBz+hkUdyG9KnAyE8l//qGLcrd18bgwaq4pnljd5y8l5rMXJs+6dpvs6fBLo24R7SsBUu3xea0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRu78GB9+IUGESd3SHqaHHt/RwhF/IyjL3ve+OAoUh0=;
 b=lz2VylZAqI35iX27Nkg1PmMmgL5MSAr4KI01fYfk5jcOLXXR0ZiD2n7RuAW7Xn58tjDshC3ImjXV2WVlA74GOK68kKDWvzgCL5zW0QnCe/ZapgMrxMwMmFE5EHqkQz+0d0Tgq2iFHbgqVJS2onsTbbnSgT1h2UHuNQWQA5AleSQB+1f7b3jSJLJNLntinUvdxpLMztawWmAwQQeEJTXN8H9B+WNgIuJ2BhjUCdk9M+/8m6uldupP/z1HHT66GWhP3wqJK7jM9jWgNfH2hrwUsP2aj3ruA1OSibOeq8uz9BeJGnt0Gli/M7LOuW8tOmOSkjFgsZ9P41Wdg0Rz10PxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 16:26:51 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:26:51 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v5 5/5] drm/xe: Combine userspace context check
Date: Fri, 3 Oct 2025 18:26:19 +0200
Message-ID: <20251003162619.1984236-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
References: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: e667d110-798f-4728-a1e4-08de0299a81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUEveG9EajVnRWlMU1k4Q3ZhZHVrZEJkNzFEdGdqRjIxSTZBYjVCZDRwOEtK?=
 =?utf-8?B?eWs3RXozd0plU3VrMnU4cUdpNklpRW4vUDZ0S24rWW5MU1V3ME9LQU1tWFNR?=
 =?utf-8?B?L0UzY2JYSGNvTWJkaHFYcTErTE9ONGJDWGpqakJKTXFCRnpCRWQzMnphaHc1?=
 =?utf-8?B?MUJhbEgwQVBFRFNNazc2clFYc3dWUWJ0dkJGWEY2WlZoQ08wZFkzQXRtK0xH?=
 =?utf-8?B?MUFqdzVMMEFxQzh2WXZCSzRzK25PcnFqaHk4VkRESUxCT3ovcjNORCtMalhD?=
 =?utf-8?B?aExkQXlNdnNtV0wyVE5BVEZ3SjZ2REdOeFhtWlRuUUN2MDArdmtmNUlpZFFa?=
 =?utf-8?B?OUFwblFjbFJ5bEhBYTFjQ2VxOWJIRHZpZ3FWSThSTGRsV29hYjhEQzlxVkxO?=
 =?utf-8?B?SWVLOENySHVxSWthYlZCUjVHU2tzZEVnN2JBOHRJbnFoTEpuNDA3SXpEODlS?=
 =?utf-8?B?di85emZ4SG83VnFRam9hLzF3OUVBSlErU3BRR2hMeDVCYnFKdjVuTzlSZm1N?=
 =?utf-8?B?QVkzaFZaR3VhZFBSZWwra3YvN2hsTmNLWEpXNE5TWmVPQThjcUZJekR2MU5F?=
 =?utf-8?B?Mm5kWXdYVFRlc1FuRXRJV2JKbzc5MHpJUU9XTlFnN3FMdE9ycUlsUjV0dE0y?=
 =?utf-8?B?ZzliVUxFZjNsek5yc05LZllxTE41S1l1M0xraXZ5Rkhpc1NNL0pvRFY1bndr?=
 =?utf-8?B?MUZxOGViRnFZcmhIbWx3U01zSzE1dmg5OWhDVU1aQ1I4ekhEZ2t4OURvaUNC?=
 =?utf-8?B?YkJlTmZwOGcvV0VkZFE5N3lRaE5mWXhDUmZlUmVjSEd2eGpqYXlWY3RqK0JX?=
 =?utf-8?B?M0FQUnZRZ3plLys2R0N5OFkrc2hocFpmM2hBN0k0RW5UNjh4S0R2ZFg4TGJ2?=
 =?utf-8?B?WlQ2MjhnTW1TZUEwRFFkZXZPMGZxY1MwMEE2TVRhcmpLSGQ0QysxREllK2x6?=
 =?utf-8?B?MWRxOXNnRW0yR0lPeWRla3kvanBkbFJPRjd0UUZ4cGJsc2p0L0hqN3k0RURw?=
 =?utf-8?B?VFZSYUVEc1R2enMxRlliS1JyYWNRM25HajBSSHIraXlYUmlsNmwxc0lralZp?=
 =?utf-8?B?dlJsQlNhbVc3eWJ0Z0NwSC92aUgxNGlyZS9xZ3lDNmo4dEJTeWF3ZGUreTgx?=
 =?utf-8?B?RllNM2FYNjVpeitwTElzdkhydGE3Y2J6Y3lRRmVrV096VnI1eG1qdmNyVDNj?=
 =?utf-8?B?MUI0OWxDUGxEc0JLc2ZFem13MVNxK1JhVDNkYndSblkxSVRpbzBtVFcyYWtG?=
 =?utf-8?B?cEI2aGY1c3dUd1FJcWtmaUdLV1V1Q3I2M25zN2M5YUxPWnNic09EVnRZSWh2?=
 =?utf-8?B?UGc0MTkyalVQbFlTWlFqeDF3bHlkbHNFbElVdi9TVGtGY2VMclI4WlBkMHU0?=
 =?utf-8?B?WHlxOWJPb3N2OUIzQ0xVdVpaUTRDdnY3R01uM1ZJSE5ncklnOHpTbW40bk9u?=
 =?utf-8?B?TTRVaENpVEVUWnZFU0ZEdms0QWxoeUFETHFQRHNXa1JFUDdsVStmT2daemU0?=
 =?utf-8?B?bWpFQVJxNmxYOEFGTWxzZ2lXWTFaWW9PUk5ESzFGb0FlY0JwZ3FMbUxWL01Q?=
 =?utf-8?B?c2xtU1JzTjUzSE5GZFJXWnU0bXJPWUxwc3ROR2d5Z3lHS0pjcFdudkk1STFR?=
 =?utf-8?B?bjJvZDZWVGRzbnZlWXBXcUlxN2VuU2orSWZNNUFjSU9xMkV6a0I2MkxxMGgr?=
 =?utf-8?B?TTQvMHR5d3QzWDhxOEptOE5RM1M0Y3RybXNnNjhhNDFVelBvNHR0QXpVcVVX?=
 =?utf-8?B?dG93cTB1VFVHOU1LcjA0c1pUTkN3STFIdkIvR0hmU04vSHBzM1NUK0VTeWJ6?=
 =?utf-8?B?V3JDWTZPRGNmMmsvNFJTT2hBUVJQVnpkMVljZzlDbEZIVnVGbm5KUlJXWGlW?=
 =?utf-8?B?NXJOdHRERXp6eGdvRTZTTE9vYmt5dlhaWjl1MHR5bVNMajBabXhmR1Q4NEdE?=
 =?utf-8?Q?PGligrhuRNRxViIuKyKk/5LSe6dZu4sS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXhIbDRGc0pEWHRsWEVXNE1SaWQxMWI2dVBjTTBBT2hHeVY0MGRDem45cnJv?=
 =?utf-8?B?dXJZWGRIUndVVit3R3dtVGJuQVBHVlVtQTQ0dHM5SWxtcHdrUmxKaHljckx1?=
 =?utf-8?B?UXEwRDVuU21CWUtHRUhTRFZLZUJoWVVwOXZVcThaT29ySnlpSy9kSmxycys5?=
 =?utf-8?B?SEE5RlJMOFNURndpMm54M3BzTWtqOU55UVlkV0hkbXZnMkc1em03dWdQdzJM?=
 =?utf-8?B?blBucjJsU2hXRFpDTmN6TFNDYmtQN29IbTNNZ042cm9HMU5ublZXNzM3aVQ3?=
 =?utf-8?B?QUhtbUxpbW1OOWtTaEVoRWZXSkVYdmx2a2MwU0d2b2ozQjFTRk1GU1kwRS9J?=
 =?utf-8?B?UDl6NDdIZmFrMTFTZG5mVlF2THRYRXhYb3ErbXg3UUxaVVhxTmdNVGxvNFl0?=
 =?utf-8?B?MldzZWNwa1c1Zk9md0RRQ0RzK1h5UHlSS0tEbkRjam9pK25wNEk0clRUR3RH?=
 =?utf-8?B?TmMzZWZjSEtSMDdDcys4NTFjTzdid0grR3hsMWgyQkJpOWZNTThTQitmNm5m?=
 =?utf-8?B?ZHpLZEVINVo2NjhhNU1kbEozYWJOMnFrTG5YUG8yblpGVEZGa2xYUytxNExY?=
 =?utf-8?B?VVQ4c2lHT2hEMW5xUnhFdWdmMkR5dWg3QTZmYWNYTHFHSjh3MXVzc3c5OXJK?=
 =?utf-8?B?NGNDb09ESDlEbzJxNW4zQ1Bqem5BZzdjUEJYZStHVUpEVFVVR3ZWT1pGb1hZ?=
 =?utf-8?B?ejhRK2F5V0d5aTkzWEk1TENSMmVqZVVaRndpRXhqM2ZQazZVOU53a3p2QlBR?=
 =?utf-8?B?UDc1UE9vVlZkSGxUMnUrTnNqaC9XTkZta1M4cExMWE5PM3FhM1JselJZeTM2?=
 =?utf-8?B?aEZHN2JtYnlYbWJrN1lrK0dOSkhpQXd1clZLQVc4aXBHZkMyMHQrTFRVZUxW?=
 =?utf-8?B?ME5xNEpTSDdhSmhKVUFPR0cyV1BMdFo4WnhMWis5N0lmUHdKVVp1RlhDVUtx?=
 =?utf-8?B?RlQ2ZFVQSTBmWFE1TDNiOXpKZEpYY2dSdXF2Sld6dmtxNnB3M0FMQy94TStO?=
 =?utf-8?B?djJHMWFET3Z4R1p3Q0JvSER1T3pSUGViZHhXNXN4YUxZZ0p1MmtQSWhwbk5v?=
 =?utf-8?B?ZnVtNTMyWlBJaU9sSEpMRWtHdFI2WmlhNnlzdWFLNXgyY0Nkakd4MVFzeFB6?=
 =?utf-8?B?UENBa3lwM0h5ZG1jTXlDN2swdlFzNzhVY3grRkI1UUd5WkJ5YWlOUnBwdzla?=
 =?utf-8?B?bFlxRVNkTEl1NWI1RHM4NEswWHFaUWJwSVhXaktTUEh3eTEwdU9rcTFFTjJU?=
 =?utf-8?B?ZmZTN1dCblJlanA2N0o5MW9ONEZZcWNtcEttOU96ODRETzdqdndqN0FMYjBN?=
 =?utf-8?B?N0JrYlB5UlM2bkh0T3V6Umg1OEdnV3llcGVyMDhIMUFGSmFlejRJbmVnR2hx?=
 =?utf-8?B?OUdrYnpBR0FXU1FIbWR2bDlOL1pBNDZsUGp0dUJRMkJ1dDFzeTRFUzY1bWl2?=
 =?utf-8?B?M29FNFdYSGcrWTRuY24rc2hIeStLcjB0K0U4ZUtNYXBwV2J5bUY2ekZ2TE8w?=
 =?utf-8?B?M0xJeVZDSjNHakhra20yUzVMRzJPNzlNV05NVjd4ZDhLQzlIdFdPUWtMMTA1?=
 =?utf-8?B?cmUxT25jVU5GZTV4aVo0djNaTFlNNytsTjArMXdRcEt5SVM0SVdQam5TTld1?=
 =?utf-8?B?d1RITGVmWkJGNUp4cUZGVnVobHJuNXg5eDlBL0ZPMmpDNFRUMEhVT0tYWEtS?=
 =?utf-8?B?Mi8xTGdwb1FGczlIRGxWUUFtMzU1dVlCTXl4Wkp3blFLZ3JvcVJEbm1xSEhI?=
 =?utf-8?B?NzJxV0NUeTIrbFA4T1BHZ3F5N2gvWDhjd2dreXpCSlpUTTBnc2VMU3ZDNEc5?=
 =?utf-8?B?TFREV2xuenVwZ3RuTHRXTmx3Yktzclh5bHI0bktiMjZ0TkVsVmtqQWxMQ3Zh?=
 =?utf-8?B?YW1wYUo5ZmRLcXJQcUFxNTNOMG1yUFRKNS80dWFaam50VG5rVC81ekFCQjNH?=
 =?utf-8?B?RzlvYnJiU0Q0SVMxQlVBdmZMKzRZb1VDdU0rRXMwWXg1cHZ4VTY0UXM5RFl1?=
 =?utf-8?B?emtDMC9jSUN4ZzMybXRFajVyU3VCTGZhV08ycUI5cDRmSUl5am53UnRKeWxt?=
 =?utf-8?B?YU0vMmNRSmxRMlFFWHhsTGxkbXlpaC9LckNUd3dQTE5YU1NnOVI3dmVySDJh?=
 =?utf-8?B?cGJ6MmM0MUFZN3ltOTBJLyt6K0xNTDFGMHo0VnRUVi9MbnlmeVFRaGU5OGp0?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e667d110-798f-4728-a1e4-08de0299a81e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:26:51.2036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paG1qMVGWQy/jJ2bsrfTprNOrWl7cYmuDO31/0xyJ2tg0tBT6Hhj5qtilAfrZ1WYqGyEb8lso2FCCXgbkkHZEou3Du8MVq1pLMq9nl1zCrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

Both vm->xef and XE_LRC_CREATE_USER_CTX indicate in xe_lrc_init that
the context originates from userspace. However, XE_LRC_CREATE_USER_CTX
has a broader scope as it may be set even when no vm->xef is present.
The XE_BO_FLAG_PINNED_LATE_RESTORE flag can be extended to both cases,
so there is no point in handling the two cases separately.
Let's combine vm->xef and XE_LRC_CREATE_USER_CTX checks to detect
userspace context.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c88e90175f59..af09f70f6e78 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1412,11 +1412,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
 		   XE_BO_FLAG_GGTT_INVALIDATE;
-	if (vm && vm->xef) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
-	if (init_flags & XE_LRC_CREATE_USER_CTX)
-		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
+	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
 
 	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
 					    bo_size,
-- 
2.34.1

