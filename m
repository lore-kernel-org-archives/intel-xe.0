Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3A7606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QAJnNlQs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8FE10F3A0;
	Tue, 27 Oct 2026 10:30:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6042E10F3A4
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793097037; x=1824633037;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Kh61pG8cxmlTpe6XBLN6/PWekonnpYgEtwCio2Al2AY=;
 b=QAJnNlQsRCuI36M7htDSTMdE3Mbg6cRKi1P8KfBwuYABv0kqIxlP6C4Z
 Y+EMFXE0E18xeOV3bZFyYyaHaN1Aw6XC/pV9DjaHQx6JwIotMzCsOsmYN
 0NMmnqgvKBuLUihPfaHvfXtGLdvydZd/6b0g/T7XhGPxyCdaCw0xGbN6P
 jPOIaF+f03S4+MO5g/i2uqHxmMEbWjYfwnI4TXEuSQ7ZyA7FVvM2lYPBP
 oxD7USAA/fYn/7fyHzmmPTb219Pxd4VcdEBgXZs0NpDpjOIGPNlRyVxcK
 niCOJ0i6XREOtj43ItlxQTzurq3lpGdjSn88XLWUMxf7b727oOAwBlchE w==;
X-CSE-ConnectionGUID: BykW25hbSqafoK0WrCoqXw==
X-CSE-MsgGUID: +PPWR7N6RI2uQfjAvbhrJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1780866"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1780866"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:37 -0700
X-CSE-ConnectionGUID: Vbw/1FAmSOuRTw4hFB/pyg==
X-CSE-MsgGUID: lqp7Zjn4S3yeCY3XGf9E3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4508148"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:30:35 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgAnCPM/Xe+hDTVpnV3p7iPi0ByZihtGrdckk0ZPZFdXyYoQ9f+MS+qPmpjIVOEZMT6UdjXqd9WS9kV/oWm5Rsp6CQd+BPxbKFia3lnI+ho0lOSQPCouxi8qdBrssxg/WASD1WXEoU/LCprCIB6LMtwAn2KZRqj29Gapca/2JI7bhAk/XGT0pUuaboCYwWtnyTI/XHYpha8gvMjyfAu4rdw9nllFYYx5MkMxXBAs0BtA3LccM4p9TA1f3J4hraS/vCM7zFo6FRCuTUICUVRMMUwJytrnd6gg2JNV0JXJXpWJGkfiwibXHiL220OiHS/pxBiSmvP9XHQsWSfmd3Q7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHZle5vOf4EmZ6e6jMrt7gKtewA5NCgQac9B11bIdPw=;
 b=wNNu17NiU+5yYH4hJWXpEPJ0fj8hzaILYrgvJrG0tNJZtKDyi5zcjXUHMEIrDRU04qGPRQHJt0Vd9TOJOCXfPtqpv60fPnk3UzPsSBOC34bvKW5Z34HfPzFz54Ivpjiic5vPLE/GS6+AewbydVjsdnzS8EOnEaU0oq+90NsVmVnTL4HTNO0IIXjMooEESH0QubyxOW62Mb3RCSUg9grgT5wcqwI3zeCtfqPd0yfA1rduIokD5l5ZUnRDy3zcxA+XWfwXqoQhgER53ofuZC9RCGAx6qux6l+ZQFIpVqxY5CO0sjvOGTjHo8jZoDtpkSWNnbgKEMZwhjLSJFGxWCDu8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:30:33 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:30:33 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v1 4/5] drm/xe/pf: Provision VFs under mutex
Date: Tue, 27 Oct 2026 11:30:08 +0100
Message-ID: <20261027103009.1259199-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B93.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::631) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd5546c-d0ab-41fc-4488-08df341554fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|261026140227099003|56012099006|5023799004|11063799006|261021121427099003|261022075727099003|10067099003|261021123027099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: D1ZfwUb2UKanKwAOCkjLjQhVEEbNhdDczXvm+IQy/XUuAuuqTdtaXT87QbrlURNBpMV7K4RK2VQXyWkrQY2FiOEd8d1Db2u0thz2VD8oxF0HJwTIrQNyc7wH8ctof0mvpMKoZGDAO1lGpIfHqc9LlsgpDKE3BssvhzgPlfHt//3Irs2tYRXzNJGmshWl5M8Y9R3NfhEGhTbrSy9c05nRVFJlZ4xLcbqAt5nQmy+PyeFXQU5o66LhnKyI2D2yrvjYOqE4VoKmhWDII9b9fHlfiJYfBcY02ZgDWo1yFbv30IvYlL/LDm+4KyAgw3sEBHWQAJ8HlF8zGsxUbReO69SCjJVWjnmmT/yMie9KGSaxAJ4UR9Uef5hdfmEMwAkJ1JtMUbAwjpNNtZsQDN1tan/zdfib225DTsQDv77sVa2n3pVY8RQoQYiIs0KDNtxeIIxc4fsL0wBn/GJnKJQ082cWdGHNR9Bd6YUb3w2vxR6SuSr5oeOXCuOvhRXOAtOmRNtz3DTZAjWA3U7XR6abLNB0vxQGeinzUetIfzvsFWAVyYYy7betWZFqQKGQcPbUsnC6Her6XME1rxfifPhi+DyjFPb/rSIjkecieq8Qhv+NqyZGhcVsOXpbxm12CFtDyxUsCH0JL042MmUnS98h4AuZEGNXkvLF7+ds3Pw4KU3scRo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(261026140227099003)(56012099006)(5023799004)(11063799006)(261021121427099003)(261022075727099003)(10067099003)(261021123027099003)(261009223027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1NtSWEwOENTQ0FNTEtDSmNJVWVlNkVPRnM5UnJrV2crdmp5VmFBUW02OGk0?=
 =?utf-8?B?cE1raStRdEp6dXc3SmpnTDkyWFA3cFJPWGxiWnZ2Z1RpQlY2cXlhNW0zeEsy?=
 =?utf-8?B?KzBSSU1HcjliWkJoTUpKZGEwakh1bmUyZllFZCt0enI4ZCttWmxvOGk5OVEy?=
 =?utf-8?B?UVVYK0dCa1hiTWJYZU5EUjlkN0NKMmRRQ1JRblRmOGEwdURyQ1RpcHRHV0NM?=
 =?utf-8?B?MUxxU245cUJ6VkZQRzdoQVBEcTg5SlVoQ0pRT2VQaWM1ZlV3Q01KMEROSTZM?=
 =?utf-8?B?R3hrbUhsRTN5RE1hTnB5blJaOUQ4YThha1l3aVphUEZmR3NLcUZkTDdNbHJy?=
 =?utf-8?B?eXZycjJQZjl5MVBUWmlHMmk4eHZvVjlnb1pNdWlqS2o0UGZKV1VSTVAveEF2?=
 =?utf-8?B?QVZSelplWCtHZm5kQTZnOXQ4SGpNU0w5MFp5UnB2Q20zNEtraURSN1VKZUlh?=
 =?utf-8?B?M25qWEVuanFUWVVRSCtlY094NTBzTjh4QjRiSHVuc25sZCs5MmVpWXBRSk96?=
 =?utf-8?B?Z2E0dTBrQnBYZ25vYkdjMjl3SCtFU29vRGNtME0xVVZ1Q2FsTGRYL0g2YWVw?=
 =?utf-8?B?OXdnR01Hbm85alQvcGkwa1ZqUFMrbUxzZDdEeEp2UXJadlJ6czBvT1FRSCtz?=
 =?utf-8?B?L0ZkZ1RSeHRCcWVGbWYyRWNiWms0K2RwUWQ1ZUN5MFBJNmZVRlVWOHVZcXdB?=
 =?utf-8?B?Zm52b1lpaDE0SWQxdmFOanRHRUg3ZDF5UFhPTVl2ZjR2SlQxSTkvTkw1S0pj?=
 =?utf-8?B?amZzTVdLblZRb0RCcTRXM0RQVlhZYVgvTEpacHBqQXUvdk9ibE1HOXBUZUVG?=
 =?utf-8?B?ZlVIQUZnZkdVemRzT1VNaGpNOHBzWUZkRXZEQWc5a0NDK0ZWU0ZQcWdKY2dG?=
 =?utf-8?B?WnBjelNGQlVXVzVqbmtkbVgxd1NwSm5WTmxHRGdvVG9jTkM1c1ZVbytJQ2ZW?=
 =?utf-8?B?UlBoVU5QL0d5QitlN2E0T2xCbmZlZVUwRFhldFJpdnJMZjNKbkU1eHFPMXpF?=
 =?utf-8?B?NkxFNWljU1NBYVVQbXJZeXB5Z0tXUXpteTdrcTFhSTYrT3ZsbHRlTXN4N2oz?=
 =?utf-8?B?eEJMVW1DZXczeWNKSmJIbThIa1cyWTl4RWlPaWJMdDRGSFh1U01PdW5wS21R?=
 =?utf-8?B?QkY4SjBVdUNQQndYLzBnNnNWRjdudUM5TFlXS0o0QlczZGNSUHk2a1hLTS9p?=
 =?utf-8?B?c0k3N2w5dlJvTnBqNEhLNmdURStKT2JJZTBVWGM2ay81YlJKcVUwM3I1ZlQ4?=
 =?utf-8?B?UlI0dGVYWGJVNzk4djFoV1l2b2hYa0hpUlJQL2xwK0pweTJXRWNoQ0swU0oz?=
 =?utf-8?B?enZFRFNjRi9nNzBEY0lhZlZPalo1aWhtZHA4SUZGL3lYMWZhb3V6aE1nbkdq?=
 =?utf-8?B?WlcyWklaUU9DcXIxZG9DQjZocWkyaFhYa09VNmJpbTJXNjJKS3RzYlBQMjd2?=
 =?utf-8?B?OERKeDJCRXVDVUtCbUxJbjBkdW1ZQXdhQm1QU1U0UXU3TjFmdG93R3RZMGQ3?=
 =?utf-8?B?ZjRGM2lHOG1rWkNJUHREODRXYk9sK09NWEs1ODlmMU1LUFRYbklaY05FUmFF?=
 =?utf-8?B?TDFFeXU1N0xSS3NvOGZDR1JzcnZ3TGFWSThCUHhMRGlDV2tWNEk1QlUrQ1M4?=
 =?utf-8?B?YmE0SnMyNXE5Zkt2YkVYTmZmNXJKT1dUQXAxdmlMVDRjRHJ4cG5ZMm1KWVAw?=
 =?utf-8?B?MDMrYlpQSWZ6RHdya1VPTlB0Q0p6SjFITWFlV21hbUhwTmhaT212L3MxUXlI?=
 =?utf-8?B?VTh1Ry8yQmM0OFNiZkVzMHVXUkFVdGQxNm8vSnVzMVl0OFpBUjRnNWtWQnVY?=
 =?utf-8?B?YUpXdDJkOUxDaUhLNEhPZjRhT1IrRHErbkFtZndibXNWZUJvREh4c3gxWEZN?=
 =?utf-8?B?d2VXZEpEKzJVK2pRMEVranBqVFlNUDY5b2p0eU9VVWE4Q1NWTExpd3ViQmlD?=
 =?utf-8?B?V2lBeVpFb0NzVlVydEoyLyt4MnNTbEwrZEFOU3hXdUgyVkJUa1l6ZjZ0eGNG?=
 =?utf-8?B?dWIrV2hNMWJreDhRZXM4aGg3Z3FVUkJTY0I0dEdaTDVXZEFSZmw4K1F1Znpa?=
 =?utf-8?B?U3krU0hid1grVERiaFNzRXl1andrQ2tUUFV2aTMrUktlaW52VjlZWkhmR1dx?=
 =?utf-8?B?bmlkdFgwTVltMGpWNmZycit4NEFmZjhRSzh1ZFh6bkRlVVBJR296K1dBVVcr?=
 =?utf-8?B?NWxwbVEycEd4WEk1SGRUN0cwOGQ2SERnc3gxS2c0clFDNDFNUExpWXZDdmhS?=
 =?utf-8?B?Z3hOVWkzaC9BaENXRzJtQXcrRnE1WjkzZy9aeGFYL1NPOUdNRjFZcHVnQnJ3?=
 =?utf-8?B?MG5QRjRyTEdCeDFjQnZFSTFwYkZLWlFxWEZBcHRXcnBUVzV2NE1XT1VZTnpG?=
 =?utf-8?Q?xs1HHn/+xANaSqcw=3D?=
X-Exchange-RoutingPolicyChecked: prYVUUVuAmCzf1Nh0cfv5k7LqH2LdGaW6jbDh2AL4NNGidDwcJa+T1eP5XHdslxi4zgS1pwClZM6+XA3gpBwPW51qYGv2zB6iN9PtoixaHMZ7KOGXFPJkjGWOs3tOLWfb+DaajUAdzxx6DsWrtQmW8Eb/o2BjA2KkBlyCp7I0d130pBV3XYeA3mv2/lxjRbKecNihP1zSZEIN66ysQtG1EkmbSuJNTtlc/NU3D96GZWTl7NT38QZHQ1wSGRNAEoAOTRKjRUzkkz4r3+IMo97hw2PRQOmVXh9q3YnDDVfFz/Uk327UMA1ggE7XcqOPk/NR9CkMLoiUyXba4bjXzlihQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd5546c-d0ab-41fc-4488-08df341554fa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:30:33.5509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RU5IoIOYQ02ep2ZY6QhvI+lXeN5qgFn1wQx1lTEOaR1C0WMM/Q7z2fFeCgYaq2DP3suocfh7prKYcaKVFVTGQw0NgB97NLbRlVnVhmmaSgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
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

The provisioning mode is now changed under the master mutex, but it
is still checked without any locking when VFs are being provisioned,
so the mode could change between the check and the provisioning.

Use the locked variants of the fair provisioning functions and hold
the master mutex while checking the mode and provisioning the VFs.

This was the last user of the unlocked fair provisioning functions,
so remove them.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 34 ----------------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 --
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c |  8 +++--
 3 files changed, 6 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c8ab4138f6a8..cca2f837e90b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2142,24 +2142,6 @@ int xe_gt_sriov_pf_config_set_fair_locked(struct xe_gt *gt, unsigned int vfid,
 	return result;
 }
 
-/**
- * xe_gt_sriov_pf_config_set_fair - Provision many VFs with fair resources.
- * @gt: the &xe_gt
- * @vfid: starting VF identifier (can't be 0)
- * @num_vfs: number of VFs to provision (can't be 0)
- *
- * This function can only be called on PF.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
-				   unsigned int num_vfs)
-{
-	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
-
-	return xe_gt_sriov_pf_config_set_fair_locked(gt, vfid, num_vfs);
-}
-
 static const char *exec_quantum_unit(u32 exec_quantum)
 {
 	return exec_quantum ? "ms" : "(infinity)";
@@ -2855,22 +2837,6 @@ int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int n
 	return result;
 }
 
-/**
- * xe_gt_sriov_pf_config_set_fair_sched() - Provision PF and VFs with fair scheduling.
- * @gt: the &xe_gt
- * @num_vfs: number of VFs to provision (can't be 0)
- *
- * This function can only be called on PF.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
-{
-	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
-
-	return xe_gt_sriov_pf_config_set_fair_sched_locked(gt, num_vfs);
-}
-
 static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
 				  enum xe_guc_klv_threshold_index index, u32 value)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 69841b0fcddb..0d45dc9672e7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -89,9 +89,7 @@ u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
 					enum xe_guc_klv_threshold_index index, u32 value);
 
-int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int num_vfs);
-int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_set_fair_locked(struct xe_gt *gt, unsigned int vfid,
 					  unsigned int num_vfs);
 int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index e713a24b8864..6ea2a24fef6e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -40,10 +40,12 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 	int result = 0;
 	int err;
 
+	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
+
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_sriov_pf_config_set_fair_sched(gt, num_vfs);
+		err = xe_gt_sriov_pf_config_set_fair_sched_locked(gt, num_vfs);
 		result = result ?: err;
-		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
+		err = xe_gt_sriov_pf_config_set_fair_locked(gt, VFID(1), num_vfs);
 		result = result ?: err;
 	}
 
@@ -81,6 +83,8 @@ int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
 	if (!pf_auto_provisioning_mode(xe))
 		return 0;
 
-- 
2.34.1

