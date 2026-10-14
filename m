Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F8CCC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBB610E1CE;
	Wed, 14 Oct 2026 10:09:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA62010E1CE
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 10:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791972564; x=1823508564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1NBN4PaPp+PkeBuEm04/gm7m+7i8O8m/y/itl6WAveM=;
 b=fL+8hUOGNjQuKpkZJwgna/qtiP8tqp5zblIluZMelwP51kEu4wQ4jBvo
 NI/JGVJiS357U3lMIE4fhU7CTGEGs6y8zPuGFJbz9kXAP3EuCgpY+G37K
 513JWe60NFHc3zwafR6x1At9MkU5faLDSmpwSpqvb89yB38vOWflYxcFw
 wURZ4kS0KVM6gRf75ezGxZ0j8pNqQ6X7uovq9bJGrTgzLKOYTZ29Bmin4
 EJ0nxTa1cmVv0KGwbgBt4ODGk7o65CRw8rjny8teyTpVWtOsW/2vfrbNd
 ZSXE8RtHZTDjrnejxIwMHdEi8k8/tHkuRKf7mfR9B0q0VZscYbiYF34/5 A==;
X-CSE-ConnectionGUID: TqTi2w0hTxmOd/fxIf0gBA==
X-CSE-MsgGUID: ZONhBPv6QW2kuNT8r6Cjlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="722000"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="722000"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:24 -0700
X-CSE-ConnectionGUID: IbvXqlOfRg6tMmaRPx5kvw==
X-CSE-MsgGUID: sB8UGgcxQ0isUwGPxVwSCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1473715"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:09:23 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gj5mlRvDG0V3FvIZezlV684jEraazA3xs8q4Jn1G2ecRvBEHrYpcNnwS2L3fDyrMJANDWDndvVn40lIaarELbLgSQvGpqWZfVkGuaQmA5BGtCBORvdoWiLxuCgPVWBu7GMs53Or7F+vioDT65kX9vg8OMVme9dMuF6Az8w6BEDPzBNKCbF4Sa1T9vfjIHf3sZ+frH9qPtTAN9BZBWNrzsgRNppSjE5rqwY2zPDCBosx86gbGeK3CxQqMagdFgQlRMXI0Pymf3h3jiZEPlch7xxKMcwAS6gTYQOD2WH7GT/2nvj2WSSG2F+3uwQcilEJxiVw9KTO1rciP7IFaB8utUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jkfXVLDTKp/GJmRokdtNX8muoxrr/LbgrF/+pvAAPg=;
 b=U6pjIAvrRRFBXEuSQntzSOU2MWDgLEmvxOtdAnaw4n6lHJ+25DGTNQrVMT5HIwmifHJt3w7KDHLETYOdx5mByWxo+vuYiao3DYhz/7drJOhdtxnfl+lbh0wH58XSVA7Ca84oyvicv4r/NjcwGFvASIh9sBcSGcMtsLugHPAWJDIXFwYdMShnZJGLOj6burIJjBuUazi4uhfs+nLKQXsvFLxkYpmsa4azFNYE9rwScPMbwDNJrR/do0NK5+F6du8YvAV42Ipulg5Rr4hkfW0CJr8KCCH8walPBuF+xm65LsY74l0H8T5jj1XDCwbIjZ6syVyqhQuOkccA/RC+ivaRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 10:09:19 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Wed, 14 Oct 2026
 10:09:19 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
Date: Wed, 14 Oct 2026 12:09:04 +0200
Message-ID: <20261014100907.77877-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014100907.77877-1-piotr.piorkowski@intel.com>
References: <20261014100907.77877-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0283.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: a4364f04-212f-4797-5a05-08df29db3646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: CeCEwh0s1q+PrXFL1npQWvYerOli1d+y7XmLNv6t1c4qqD9EMojZMAg3WfpqEDBTiznRusRqYZQR70k7CmVynAbYKMf8Uny3XYyNLwO/Z7NQTlYqP7pTjbvih6dU7a44fPbtTSW/ESEHhdKy40C2Jrguvl3OUFt/trpqC5pw7yGtEL3Cpz0F/4Fy4d3K4qA57AW0z8ccA67lSi0g2NE4sIta0VWxd9ZXIwV7qVEvKECL8n0uQuH7KAe0oKxXO1DNKnIqjtGefs1ez0Z1ggk/gXigHEFnwhNTYwJfcuSBMGLlThm/Sgxq5Xm4aHz42Q91mo+108IeEL8nv8U3nTz4WgmDWGFvVaMH6MF1v+tLU8E994JW3gkRNduA7IVLxjcYDS0T/io4vUrGSIyEnhwXgdnNNZROw7h9/lmS3pMcFq1HMsxbWDa1R56kDyK0FqyKNI5M6Oj61eFAUpd4V/vdmxc26WeQgLp+Ccv+55nNBEhmcRX9MQ4pgHVTEELL3uYJGGfuBGFTN9PUSLXOkmO9aJYJcGHbMf0hvHyc5PeM7xOER2HTIqvzFv1NIy2HY3PEA4RBFzSQSk08PtG6ULYx107sqF+hWPUVpvzsSkoCMA/TjMp58VzeO/OsoRRqSeOtvmCvtBK2BzaH+rrOEpIbHfd45b+DBcsxLWeFdRqLkXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE43L05NZEtDd1Izb1o3ai9EQVduV0hTbGswYnVZMElQZXRzdVhVNWRwdnph?=
 =?utf-8?B?dGw5OHR0bmFadjR1RFhrUURxTEUxMW5KbHdjWEp3L3VPWS96bThmNWlLWWRx?=
 =?utf-8?B?YW1XRExjNkhiN0RaUk5NT2M0TWFYWi90VUF5dm5XMU52NVZjODRLb3dvUWp6?=
 =?utf-8?B?QWZLM3o3aFpCSEFHMUZyTHhHS0M1ZnlHZ0dOVGhCVnZNQ3VzMjdYVEx3RUFK?=
 =?utf-8?B?WkhDNkxuMlF5NC9rQVh4TTJzcHk3MjdKdkpKV1l2UmFzZGZxd1JwYis5dVFr?=
 =?utf-8?B?V3Jnd3g0dmhIbElicTFBN3IrdWJUQ3ZUeVEzSVZwODdEZ2s5TDlpR0JWWUZU?=
 =?utf-8?B?V0krVTJnMHV5anpsN1hOS1B5cVQ0TGJFTnpUZStQcFh2dkpxUnprUWVpUUFQ?=
 =?utf-8?B?MjMxMzNHdVF3THBmTWlxKzI3ZkI1T1pNM1lINmE4bzNOeXp3Y0RtQlBOYnFv?=
 =?utf-8?B?MzA1SlE4WUJRSzhvLy9YSkM2anl0QlZJampHRllYN1NFQ1FQQUtkL0RSSkI4?=
 =?utf-8?B?dFJTemtyYmg0ajhPRGJWT1NabVVDL0tVZW5kQ3d6S2laMHN0bW9oOUZZSUp3?=
 =?utf-8?B?U3dvaUhQbGkyaXBZV2hlT1VnRXZ1QVlJQzgwVzZwL2dGRjU2dWFvNG1vU2xw?=
 =?utf-8?B?ZXZ6MFRjUU9keHROL1p0NkFoLzRsQ3dkTzNDWVFlalVMU3UrWUQ3ZmNma2dF?=
 =?utf-8?B?NENsM1dZdW95TmZHdlZIUE1hYXJndGhJWEJ3eFV0dWpPMSsrY0RZQVlPSzha?=
 =?utf-8?B?ZHJKVzRsd095bUZlUlZySzBPT3Bhbk9xb0l6OWRHd2pqMW1PZUFON0dyOG10?=
 =?utf-8?B?Y0F5a3FTNk1vUG1XMkRQcVJQVlB5SnBOZWNzcmxyKzZnWXFSY0Z6cWZlSVF6?=
 =?utf-8?B?WXlERnd5ZkpQSDdmK1hvVndIRXVZK0d1SXN4bHdtN0FNMzBFNWNDTjdoOCtp?=
 =?utf-8?B?Y2ZiZmVtS2d0M2JnQ0RvSXVaZUlBR3lrTTN3cmpaRGJnb0ZXd1k1b2xqbU83?=
 =?utf-8?B?YVZZdGtHSnBCakJFaExhbW5YV0h0cnBJcWI4WGRVTEFUUWgycHY0TnJFTlA0?=
 =?utf-8?B?cm5XUklYNHk1NklESlRXaWNIc3I4dWVzS0llWFQ5cmVsK1pzU2tUbEYzdTV5?=
 =?utf-8?B?bSt3aTUvMEpnMktlTTZVU29zdGZFY0tyR0M5UDRSUVVCSjVQcXM0WHlmamxO?=
 =?utf-8?B?dC95ejQwbHJlK2tSSlVuOGZMeW9FbjZPOVNkS3pYd09LM1h6RW12UnI4Y1Ix?=
 =?utf-8?B?cENCNTE0a3hZM0RwdWZYUHFZd3UwWEd0WHdCTHU3R0V1Tm1oemlVekhncHNE?=
 =?utf-8?B?R05JMlNBc0dUV0krYmtuWEpidCt4ZUFYTGtTb2J1ZEhrSXIrT3oveUJOS0Qx?=
 =?utf-8?B?c0JjcjlUSDUwYzNTdWxLSm5pQ0djRkxxbHEyODhid2gzUUlLcllKU1RWMXRC?=
 =?utf-8?B?VFRPcDJVWkxMb21kOFEwM1BqbWF6am1xbTlpVEx1N09EU2NyV1c4M2dFdjBs?=
 =?utf-8?B?bVhXWGplQmhLL2JZU05lMXk3VTBSd1M0L21qOWpqMm54NW1uTHBIdGhwSmt4?=
 =?utf-8?B?UkQyYjdvYlR3Ry9XNlBJTlFFUjN2RDdXOFdqeG1tUGJyWXREWmtueGxkWjBM?=
 =?utf-8?B?YjNtNkNsS2xQNlkrek9Bem9CQVhWYjRaQy9zdU50M1UwOWRnOUVMeWZ6ZG1J?=
 =?utf-8?B?dDk3b3NRQjlxWGlGUW5hajRrbzJpNUFCc0cxVmRyRVVoM2IreFVGZ0tNMFBs?=
 =?utf-8?B?NzZFUzR4REwrSzE3Y1psd1NPNkxJSmJMeGlRdEdQZ081WXZxQ2FGV3VoMkNS?=
 =?utf-8?B?akM2UkZHcWF6UGR4dWRnRGNLcXN2NU5wYWVib3hmbEdtZE1qb0NaZEk4L2Zq?=
 =?utf-8?B?Z2xFcHpyNmcrS2pmR1JMR0JSYlNVRjltcmZmTVFORmlyOWNyeW1PRGcvM05O?=
 =?utf-8?B?RFVoV3lCUTlXRmxmMEY0ZzVFUmFHMFMwdWVENWh2WFNNU29rcGtLNW83UFZ5?=
 =?utf-8?B?ekRtQk0xeXp6T2xOKysxYU1RWmFaZzI1NS9zZ2c0QWxuc083MmFoVGwxVmh1?=
 =?utf-8?B?ZUNPRXRMTG5BTW1BTFVQRFJSYlFWU2NMTTBmMW9BOFg2YWtEdXMvZlIrZE5T?=
 =?utf-8?B?WGU4ZGJZOGpPWUh6aTZOcjhpbW1QNkx4TE9aQ081Vk9Ib3ZxWUt6N0QxY21P?=
 =?utf-8?B?Skh1K2VuVkJDRUZZd2Voc25mV0k1QmY1QWxDR1FIR1A5bFVjYUJrbE0rQkph?=
 =?utf-8?B?Vk93RHUrL0RXWVY0MWpLbVZsVmxrQ2c0SVV0Z1pycEVPbW40R251MDl4TmUz?=
 =?utf-8?B?dU5oMzlScWFWT1Nyd3JoNFVsbFh0R3ZGTU9GLzRPajIwSEFRK2hQR0FIeDZi?=
 =?utf-8?Q?Lq0wg0xK9VxZPPto=3D?=
X-Exchange-RoutingPolicyChecked: 2TAJKfueXoKxqN/KLplWn/1bYIjw0rKfV5QiwralZzBR1/8CxJWpNddIhwPc8e0yCLB525Y7TsBb6MRBFGeINflhgaLMjzcpV3T9xj1IDNkgdhi1TA2mRtVLunJ0fRvxFd85fKUYf4e0Qb6F25ItFBx8Sgz7yA5Miky3+9/6bBff5hSHPRsDlb/d5JrnnYbJegEBgSA0Thtjnpe9HTLeMdaoqBieJN6IeBAXepRWQ6u76SIOokACBeBEmA07Lm4hn6AsrdvGOeJEvczxohR4F6QDoPopsSWdvnlr9NN55+z4bEdtCKGYOdLm+wpJ6Oq62iTouPeQUkHB1WVoKbVOOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4364f04-212f-4797-5a05-08df29db3646
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:09:19.7366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLe/FhIepiCT+oDUpnYVcoMz9145KdnjOHapXJH7FuyH8EVXbrkF2hO5lT5u4RG18xrh+udpID3aoAs/2FEWESinZEg5i6cxMcElLh1+X5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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

Modify the GuC identifier manager so that it distinguishes between
usable GuC IDs allocated for GuC submissions, and shareable those that
can be shared with VFs. Both pools are represented as a single bitmap
and may overlap.
Let's Replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, and update
debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same GuC ID space. This prepares the ID manager for separate
management of submission IDs and VF allocations in following changes.

v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)

v3: Fix shareable spare quota accounting to include
    PF-exclusive usable IDs.

v4: Do not apply spare quota to VF-exclusive shareable IDs (Sashiko)
    Drop redundant checks and asserts (Satya)

v5: Add quota helper and unify -ENOSPC check in shareable path (Satya)

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 451 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 5 files changed, 410 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0e..78d3de46b7572 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
-	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
 }
 
 static void no_init(struct kunit *test)
@@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
 	__fini_idm(NULL, idm);
 	KUNIT_EXPECT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
 static void check_used(struct kunit *test)
@@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++) {
+	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm->used, n);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
-		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->used);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, idm_total(idm));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -76,25 +76,12 @@ static void check_used(struct kunit *test)
 static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
-	unsigned int n;
-
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
 
-	mutex_lock(idm_mutex(idm));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
-	for (n = 0; n < idm->total - 1; n++) {
-		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
-	}
-	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->total);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
-
-	mutex_unlock(idm_mutex(idm));
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
 }
 
 static void check_all(struct kunit *test)
@@ -102,14 +89,14 @@ static void check_all(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++)
-		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	for (n = 0; n < idm->total; n++)
+	for (n = 0; n < idm_total(idm); n++)
+		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
 
 	mutex_unlock(idm_mutex(idm));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6947aeed458ed..de1ac58e31412 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1182,7 +1182,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (idm->total - spare) / num_vfs;
+	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index e845425d670be..efc134bb8d915 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -34,6 +34,34 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
 
 static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
+static unsigned int idm_total(struct xe_guc_id_mgr *idm)
+{
+	if (idm->usable > GUC_ID_MAX - idm->shareable)
+		return GUC_ID_MAX;
+
+	return idm->usable + idm->shareable;
+}
+
+static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
+{
+	return idm_total(idm) - idm->shareable;
+}
+
+static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm->usable);
+}
+
+static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm)) -
+	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
+}
+
 static void __fini_idm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_id_mgr *idm = arg;
@@ -41,25 +69,56 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 	mutex_lock(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
+		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
 
 		if (weight) {
 			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
 
 			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
-				  weight, idm->total);
+				  weight, idm_total(idm));
 			idm_print_locked(idm, &p, 1);
 		}
 	}
 
 	bitmap_free(idm->bitmap);
 	idm->bitmap = NULL;
-	idm->total = 0;
-	idm->used = 0;
+	idm->usable = 0;
+	idm->shareable = 0;
 
 	mutex_unlock(idm_mutex(idm));
 }
 
+static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
+{
+	bool overlap = usable > GUC_ID_MAX - shareable;
+	unsigned int total;
+	int ret;
+
+	if (!usable)
+		return -EINVAL;
+	if (usable > GUC_ID_MAX || shareable > GUC_ID_MAX)
+		return -ERANGE;
+
+	idm_assert(idm, !idm->bitmap);
+	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
+	total = overlap ? GUC_ID_MAX : usable + shareable;
+
+	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
+	if (!idm->bitmap)
+		return -ENOMEM;
+
+	idm->usable = usable;
+	idm->shareable = shareable;
+
+	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
+	if (ret)
+		return ret;
+
+	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
+		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
+	return 0;
+}
+
 /**
  * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
  * @idm: the &xe_guc_id_mgr to initialize
@@ -68,90 +127,158 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
  * context IDs supported by the GuC firmware are available for use.
  *
- * Only VF drivers will have to provide explicit number of context IDs
- * that they can use.
- *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 {
-	int ret;
-
-	idm_assert(idm, !idm->bitmap);
-	idm_assert(idm, !idm->total);
-	idm_assert(idm, !idm->used);
-
 	if (limit == ~0)
 		limit = GUC_ID_MAX;
-	else if (limit > GUC_ID_MAX)
-		return -ERANGE;
-	else if (!limit)
-		return -EINVAL;
 
-	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
-	if (!idm->bitmap)
-		return -ENOMEM;
-	idm->total = limit;
+	return idm_init(idm, limit, 0);
+}
 
-	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
-	if (ret)
-		return ret;
+/**
+ * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
+ */
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
+{
+	return idm->usable;
+}
 
-	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
-		  idm->total, str_plural(idm->total));
-	return 0;
+/**
+ * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be shared with VFs.
+ */
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
+{
+	return idm->shareable;
 }
 
-static unsigned int find_last_zero_area(unsigned long *bitmap,
-					unsigned int total,
-					unsigned int count)
+static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
 {
-	unsigned int found = total;
-	unsigned int rs, re, range;
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->usable)
+		return -ENODATA;
+
+	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
+	if (id >= idm->usable)
+		return -ENOSPC;
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
+						     unsigned int range_start,
+						     unsigned int range_end,
+						     unsigned int count)
+{
+	unsigned int found = range_end;
+	unsigned int rs, re;
 
-	for_each_clear_bitrange(rs, re, bitmap, total) {
-		range = re - rs;
+	for_each_clear_bitrange(rs, re, bitmap, range_end) {
+		unsigned int start = max(rs, range_start);
+		unsigned int end = min(re, range_end);
+		unsigned int range;
+
+		if (start >= end)
+			continue;
+
+		range = end - start;
 		if (range < count)
 			continue;
-		found = rs + (range - count);
+
+		found = start + (range - count);
 	}
+
 	return found;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
-				    unsigned int count, unsigned int retain)
+static int idm_check_quota(unsigned int used, unsigned int count,
+			   unsigned int spare, unsigned int limit)
+{
+	return used + count + spare > limit ? -EDQUOT : 0;
+}
+
+static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					      unsigned int spare)
+{
+	unsigned int shareable_start = idm_shareable_start(idm);
+	unsigned int total = idm_total(idm);
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->shareable)
+		return -ENODATA;
+
+	if (shareable_start < idm->usable)
+		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
+	else
+		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
+
+	if (id >= total)
+		return -ENOSPC;
+
+	/*
+	 * Spare is meaningful only for IDs that are shared between usable and
+	 * shareable pools. Only IDs taken from the overlapping part reduce PF
+	 * usable capacity, so a chunk located entirely in the VF-exclusive part
+	 * (or any chunk from non-overlapping pools) is never limited by the spare.
+	 */
+	if (spare && id < idm->usable) {
+		unsigned int need_overlap = min(id + count, idm->usable) - id;
+		int err;
+
+		err = idm_check_quota(idm_used_usable(idm), need_overlap, spare, idm->usable);
+		if (err)
+			return err;
+	}
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int retain)
 {
+	unsigned int total = idm_total(idm);
 	int id;
 
 	idm_assert(idm, count);
 	lockdep_assert_held(idm_mutex(idm));
 
-	if (!idm->total)
+	if (!total)
 		return -ENODATA;
 
 	if (retain) {
-		/*
-		 * For IDs reservations (used on PF for VFs) we want to make
-		 * sure there will be at least 'retain' available for the PF
-		 */
-		if (idm->used + count + retain > idm->total)
-			return -EDQUOT;
-		/*
-		 * ... and we want to reserve highest IDs close to the end.
-		 */
-		id = find_last_zero_area(idm->bitmap, idm->total, count);
+		int err;
+
+		err = idm_check_quota(bitmap_weight(idm->bitmap, total), count, retain, total);
+		if (err)
+			return err;
+
+		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
 	} else {
-		/*
-		 * For regular IDs reservations (used by submission code)
-		 * we start searching from the lower range of IDs.
-		 */
-		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
+		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
 	}
-	if (id >= idm->total)
+
+	if (id >= total)
 		return -ENOSPC;
 
 	bitmap_set(idm->bitmap, id, count);
-	idm->used += count;
 
 	return id;
 }
@@ -160,9 +287,8 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
 	idm_assert(idm, count);
-	idm_assert(idm, count <= idm->used);
-	idm_assert(idm, start < idm->total);
-	idm_assert(idm, start + count - 1 < idm->total);
+	idm_assert(idm, start < idm_total(idm));
+	idm_assert(idm, start + count - 1 < idm_total(idm));
 	lockdep_assert_held(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
@@ -172,22 +298,61 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 			idm_assert(idm, test_bit(start + n, idm->bitmap));
 	}
 	bitmap_clear(idm->bitmap, start, count);
-	idm->used -= count;
+}
+
+static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
+					     unsigned int start,
+					     unsigned int count,
+					     unsigned int range_start,
+					     unsigned int range_end)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!count)
+		return -EINVAL;
+
+	if (start < range_start || start >= range_end)
+		return -ERANGE;
+
+	if (count > range_end - start)
+		return -ERANGE;
+
+	idm_release_chunk_locked(idm, start, count);
+
+	return 0;
 }
 
 /**
- * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
+ * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of IDs to allocate (can't be 0)
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
  *
- * This function is dedicated for the use by the GuC submission code,
- * where submission lock is already taken.
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
  *
  * Return: ID of allocated GuC context or a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
 {
-	return idm_reserve_chunk_locked(idm, count, 0);
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous. The function expects that the
+ * caller has already taken the lock.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare)
+{
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
 /**
@@ -206,60 +371,175 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 }
 
 /**
- * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
+ * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of GuC context IDs to reserve (can't be 0)
- * @retain: number of GuC context IDs to keep available (can't be 0)
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
  *
- * This function is dedicated for the use by the PF driver which expects that
- * reserved range of IDs will be contiguous and that there will be at least
- * &retain IDs still available for the PF after this reservation.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable_locked() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count,
+						 idm_shareable_start(idm), idm_total(idm));
+}
+
+/**
+ * xe_guc_id_mgr_reserve_usable() - Reserve one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable() - Reserve one or more shareable GuC context IDs for VFs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous.
  *
  * Return: starting ID of the allocated GuC context ID range or
  *         a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
-			  unsigned int count, unsigned int retain)
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
+}
+
+int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_reserve_chunk_locked(idm, count, 0);
+}
+
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
+			  unsigned int retain)
 {
 	int ret;
 
 	idm_assert(idm, count);
 	idm_assert(idm, retain);
 
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	ret = idm_reserve_chunk_locked(idm, count, retain);
-	mutex_unlock(idm_mutex(idm));
 
 	return ret;
 }
 
 /**
- * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
+ * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @start: the starting ID of GuC context range to release
+ * @start: the first GuC context ID to release
  * @count: number of GuC context IDs to release
  */
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
 			   unsigned int start, unsigned int count)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
+
 	idm_release_chunk_locked(idm, start, count);
-	mutex_unlock(idm_mutex(idm));
 }
 
-static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+/**
+ * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
+}
+
+static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
+				   struct drm_printer *p,
+				   int indent,
+				   const char *name,
+				   unsigned int range_start,
+				   unsigned int range_end,
+				   unsigned int used)
 {
 	unsigned int rs, re;
 
 	lockdep_assert_held(idm_mutex(idm));
 
-	drm_printf_indent(p, indent, "total %u\n", idm->total);
+	drm_printf_indent(p, indent, "%s used %u\n", name, used);
+	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
+		rs = max(rs, range_start);
+		re = min(re, range_end);
+
+		if (rs < re)
+			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
+					  name, rs, re - 1, re - rs);
+	}
+}
+
+static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
 	if (!idm->bitmap)
 		return;
 
-	drm_printf_indent(p, indent, "used %u\n", idm->used);
-	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
-		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
+			       idm_used_usable(idm));
+	idm_print_range_locked(idm, p, indent, "shareable",
+			       idm_shareable_start(idm), idm_total(idm),
+			       idm_used_shareable(idm));
 }
 
 /**
@@ -270,9 +550,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
  */
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	idm_print_locked(idm, p, indent);
-	mutex_unlock(idm_mutex(idm));
 }
 
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 368f8c80e4c7d..209f99831f1b4 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -9,13 +9,29 @@
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
 
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
+
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare);
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare);
 int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count);
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count);
 
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count);
 
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 3dbcb1331690e..6da43691e54c5 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
 struct xe_guc_id_mgr {
 	/** @bitmap: bitmap to track allocated IDs */
 	unsigned long *bitmap;
-	/** @total: total number of IDs being managed */
-	unsigned int total;
-	/** @used: number of IDs currently in use */
-	unsigned int used;
+	/** @usable: number of IDs being managed for GuC submission */
+	unsigned int usable;
+	/** @shareable: number of IDs that can be shared with VFs */
+	unsigned int shareable;
 };
 
 /**
-- 
2.34.1

