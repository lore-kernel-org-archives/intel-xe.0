Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F8ECA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA4910E4D9;
	Mon, 22 Sep 2025 17:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmvBqhOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A1710E4D8
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758563928; x=1790099928;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/Q7TpSVZgqnpg3G3RBEtWSlu+WZTE2hupuP+PW6AJOE=;
 b=NmvBqhOBSM3WXdVwzETVL9DSCd9eJNCzIjnHJMHVtrJXygcJVAmq0mmj
 ukv8v9REKXvEjUXwpwGW0WT0e6Gdrxe+WfBwzK2ZVI7B8yQJ6pQBuVum4
 yCjKx1KzjkjRaOg4fUlstdJyy2BJC/xC6O+aDWZIcHLg0yq+Hf9jOd8DZ
 NGWynfRaAoElso3Fahpv1hPHsRznJrc9vW2LSWNBDshh8qFCNuuJtqsOu
 0orLCmUdErVid+8FgcZDFjE9tJIS7UVDk7YpCQeZnGf6HFvCLx+dRzjiI
 HRqt+WANZ1G84rwtkSk6i3M5UfJbye8rKkbu/8pXz/PHx6MDTxSUrrNOE w==;
X-CSE-ConnectionGUID: 5YCE+EqHTAChg5temkRCyg==
X-CSE-MsgGUID: pU7CKaxlQLWA2DeFfAF0KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60888379"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60888379"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:58:47 -0700
X-CSE-ConnectionGUID: oCCLySqeQpSZnNEXHWuEeQ==
X-CSE-MsgGUID: f1uSExeTRMqiLDFNoJv/bQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:58:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:58:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:58:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=of1j+jDM0e7X+PpzlIT00pTzbeBwb3d9nE7eMUq/av/3N3jRBL4f/+St4wDnwMor3G/d1meounFEAPpId2eomg/KJLvCSlToBR9wdVSfiNCNDif8lew/+SZBM+xjv80ETlKnsEh0b9i9HH1AZOuDqNoiqEBa3L4cm5ZfYTohgxi5WaRLe1q0HzwW87A0tvmicbUB/Y8y4p/D4uSYPZ+GlikGbJD/VE1P3HcBxYcUanlA5N453BdOFgWUbirm4bYLvpwrrdMIzyZ2cqNAuiKfr7Bu0c9uhTzRxDLAVor0ZEOfrZNUmDZzJuo5Skc0TgVsjHjfI09Q79t/ee1GxSBKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kbRIRZYvCScyHGceLyNX3NdenIR6jN9LzqbEk6aJOo=;
 b=gVbF6/G89b7iUNUuiJDNzCaY/oMQfzDVp+i9u7RpfjS5O2KDKCNBbhc5W7CId7xc0KWYYS5a648D4lrN9tVUAjv2wjyMdjMQbRknxBgPlzQtannPm0B6GTrEuYuPVACzaDaap6MS0qgfLW1HB5dCrt9nmLImP/ozb3IiVMZXCzRg/GqDGF2YsLvkYRhK9WXYrBo5EFYW9JP7i8cX/+o5OixDXFcYWWU4kZ2aYAFJoE9Exhjv4OdjZOJWa0+hIRrdf3sLHlkzv5gSCSCMkRkCvLZrGF67XBOz66jkVzu/GJyrY5eFceBiyfqjpZPvag1UZtjMCxTaWzX9RH7u+MsI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:58:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:58:39 +0000
Date: Mon, 22 Sep 2025 10:58:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Use PPGTT addresses for TLB invalidation to
 avoid GGTT fixups
Message-ID: <aNGOTLAWN3FDXCwK@lstrano-desk.jf.intel.com>
References: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
 <20250918073002.15242-7-satyanarayana.k.v.p@intel.com>
 <aNGLm+8aW+w24xz3@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNGLm+8aW+w24xz3@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0320.namprd03.prod.outlook.com
 (2603:10b6:303:dd::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: ae139f01-0083-4b2a-d6e0-08ddfa01a905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXhoUW95c29nc0dvUXpkQkpHSkRPZ2JNeXhhQVNUMTdrQm5kaUJOTlV4aVFs?=
 =?utf-8?B?OXNHd0lCRENCR3J6a2gwSDNTWlpPYVlsYXRNOFhOWmVuQVcxZWg2c1RlOHAr?=
 =?utf-8?B?dkZCS0pqYjFXRm5wZU0vQUg5ZHNLWkxLKzh1d0VHenZSZkZHZ2lTNVdCN2RI?=
 =?utf-8?B?RHZYTzJIZlMzVGRmMmVyQ2krenIvYVZyenJmc3Fnc25oelNUVkd5MzVIYThp?=
 =?utf-8?B?Z1FkT0pIZkpEY3U5Q2J5V0VyNlRGVU1uQlFVVmlkeE9YRWw3N05MNUtLL0d6?=
 =?utf-8?B?TFJsWmF6d1BEZE13SWVqRDJSYXZLUlc3UVFFNnFpcFMvR2taTjlET1ZzbmF2?=
 =?utf-8?B?MjBhT0JUUW40T0Z1UmNuSzloaUtxTnAxU1JYS0dCeWxMeWtkZFZBMFdNa2hj?=
 =?utf-8?B?bFV3QVJ4YXVzbi9KTGszNk5Qd2l2T1dkQ1ViMnFhc3puSjlpUXVOTWZ3aWhY?=
 =?utf-8?B?QThOWlZDbDdyK1BZeHBZaFk1R2Y3bmN6SUV1bUV4RnFJamVOYUdKM2pxNUdN?=
 =?utf-8?B?citOVVZ2YUF5M09LcFlnV29Id09FUk50Y1NHT2M2K3gySkZYeWxUZzRRT3l6?=
 =?utf-8?B?QjNRdnNPYUhlS082UzJHZDQyalhhTUVDUnliMi9uZnNjVVVCaTY0cnJsZmpn?=
 =?utf-8?B?aTA0ejhlQ0xTaWlUZ2ZYRDhmYmJXbUF6QTNJeGpMNFd2VWZPSFo5OVpKZFRK?=
 =?utf-8?B?bWxDSHNYMTlRdjBmNjU1aXJvc2dLdHVkbTJLVEZFUVBlOHh2Q0ZQejQ2aTFN?=
 =?utf-8?B?VDlVTlA5aUtka0pKMUJOWHRPeks3V0thVUlHRGhBc0dkd3hXQmxnNldlMEE4?=
 =?utf-8?B?WkJEazNmMWozSkMweklZK1V5M3p0bmdWd0FFRjlqQm55eVZLVEZOVDA4bUx4?=
 =?utf-8?B?YStWL01zbGdORWhqMXJCOVhBbHpCR1QzN1lnaTAxTmlnSWxCR0RScExYYjhS?=
 =?utf-8?B?dmNjV0FOOTZDU2VScEgvL1hoc2dMUytOczlSNUp5OGZKc0RzdWZ4ejJZc29w?=
 =?utf-8?B?dWpKK2Q0bER2MXhjREdaOXZhZmp0U2dETUVsSksxT2hJREdscnpDbmRVUzJI?=
 =?utf-8?B?cDBoUUdQcUZuL3NhQnFZYWhXSFg0VDJlYnprWWE2UEdRcVN6b0R2ZUlRVXNT?=
 =?utf-8?B?Nmc1Zm5GWi9qSG5aUDFENlJIZ0cvYXh6QTlzQWVGLzk3cHBzcHFyRmd3Ry9h?=
 =?utf-8?B?TDVvZElDQTF3WmF3bHJyYnlGQTY2YXNFVWJ6Um5sSXRtaGlQamQyQVVRWGk3?=
 =?utf-8?B?UEZtWjBRREVDTmx2ZEdYakVGVVhyMHBlbXZGUUhvMVQ1SlkrUmFabjh0VHRa?=
 =?utf-8?B?Rm1xTWFXUm9pUzBzdzROeUh5WHc4T21UcGl3cldaNTUyTCtJcGJQVjZyT1NK?=
 =?utf-8?B?RmE4a0Y0amRScHZ0clFYZm5mU21ROEZNZ1FoZTZSTlpLM2JaQkt6bkJXWEVt?=
 =?utf-8?B?Q2NJRFB6Umw5b0xWcUlUckZjUElJNjZDenp0NlNoalptTkk5S3F1SnlVdGpC?=
 =?utf-8?B?enlRSncyUm9wYTY0WU9qVnl6T3hQeVdNZ3UvM2F1ZzhLV3Y5UVN4ZG90aVhQ?=
 =?utf-8?B?R091VmM3amhFRmZsRHZLNGNoOGthS1FYYWxuVmJhSXFPZWVJeGlnL3dFODhx?=
 =?utf-8?B?bjVVd1h0TXlWbFZtRE1ub1lmbjc4K2dDdTh4TVBFbXRyOGZVaHJITnRrNHpH?=
 =?utf-8?B?Y25PNitJL1dmdG1xMU15bmZCRVRnOEJYKzR3UUd5bUYrQW1VNHQvd0twVjhk?=
 =?utf-8?B?V1ViZXMyN3JybWd0akJGZEhKVGYyZkRzMlhXSnNObWdWSDMyV2g1bExJc3or?=
 =?utf-8?B?Vm9CSWNzM3ZZZm9WcGx0TE84dVZDY0tQUWZJcnFIakJLSzVLWlJ6dmM2Z2pP?=
 =?utf-8?B?ek5JUVRUa3RRQ3A5YWtsczdnMUZ1SG1hODdLRUZrcTVHSkZQZjBxTmQ4dUdJ?=
 =?utf-8?Q?H5FoSRHj9Jo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am9kZTEva0VnOStiakxic3NLYW93M0ord0hyWnlqOGQyTHJ4d3NJVUFzb3J6?=
 =?utf-8?B?ZlNuL1RYdGJVbkppNGJoS0tFSTRNSXJFR3VZdmFOY0Rvb3gzWUx6ZDl0RmJV?=
 =?utf-8?B?UDZVamkxcHdsVmtOOEZ1b29oZUVIb25uSVl4dWJXeW5aUXltcXUyb1RCSTBi?=
 =?utf-8?B?OHh3V0JuN1d4ZUdDUVBDaXlyRUQ2NUk3RDlpbXpQUTdtM0txRDhLTTYxZkg5?=
 =?utf-8?B?eHVhenRQSE9WMUtRa0hNb1pjWVZXZVg0VDlveFlPRUR6ZGY5VDFUTjlBV0tv?=
 =?utf-8?B?NVoyQWsrRUJkK0szN2F0eXJRYVJwUmlTbmtvSmJlVFVOd2Q1dVRFR3JyVXh4?=
 =?utf-8?B?TWFGSE9YVUdOMVlrbmpMRzJwUDZWdWdLTE5FMlZEUkZDR3MwMmxLdFk5T0lq?=
 =?utf-8?B?K1ZybXNlTWwrVUh5ZTJ4bldnVDZVaFp3NUp5ZjduUHRYK1daZ1Bkd2s3aGVk?=
 =?utf-8?B?dkVhcDdFcjVzZ3pqSy9OdDB5U2Q3elhvUEI3NHl5dkwwK1c3ZFowK1Erc1dP?=
 =?utf-8?B?cUsxT1dvbW94ZnFxdVlUY3hBd1ZxMzRLb0lEOFNQbnJJNnZsTWtTMHpPWmlC?=
 =?utf-8?B?Qk9hYmF6OEZKbXlGdkswWmQxd3dHYU9sRGZZQy81Z2lXMDVXN2VScWFuSm9p?=
 =?utf-8?B?QlZXTkFKWGk4VnowM3AxenQ3OFhNaUNTWEVOdkl1c3BMY2s3QTh1MVFuMGl6?=
 =?utf-8?B?bnVDQW10eDFTWktWcEYvanlqV3RBZ2h6b2dYVjBvYjFFMkk4N3pTWTRaZFha?=
 =?utf-8?B?dmVwUm9PQmRHM2M0aDRqZ1drVDFxWUVQMXVLaDFPTXc0amhqOCtjSnZwbktn?=
 =?utf-8?B?d2NBZFlUYW9sWVArRmxnZG1zcGdVd2dhUmdxYW96TkNWeVBoVktaeTBuUkVE?=
 =?utf-8?B?cVlVbDNhUDg4Ulo0L1kySklmWjU2MXVKTDBrR0U3a3MvRlpwUmFmNGdPYlFx?=
 =?utf-8?B?cFZubWNITWk4K1VhTzRyckZRYy8zdHdSbjBWeWFMbnJPc1BhNFZLY29oa0h1?=
 =?utf-8?B?ZFZXOHRIY0daMzFBWmRpU1FzWVpNNks2cEFpSkMrdFZRNTZjUlhkUjVGZDNS?=
 =?utf-8?B?cDl1WFVnZDdySnhuQWd0R3VpdVRUR2lDSjd0WWZHalltN3BJOVJmVmEwRi9U?=
 =?utf-8?B?RmM1SDJoUlNXVlVGQno4eHJRWndpeGgreWQxYmYwTklSQ2JBNUMyM2ZUeHNN?=
 =?utf-8?B?Z1Qvc2xFZXhxZUVkcFViamtzQ2lKb1g5QzJwcGZvVEtiSlpjeUF4U0l2V2do?=
 =?utf-8?B?LzVBdEN3aDFTSkZER3UwVDQ0UlJlNVpuQkk3bjEzZTR5VnBsaWl6aDd0Rndn?=
 =?utf-8?B?dmFzbmJsa1o4UTk2RlhmQ1Rnc2ZOTGkzTGFMQmc1NkJmVjF5U09Ba1VOM0Q2?=
 =?utf-8?B?Y3pVTk1XUExlZzE3UzlocTB0dTBaK1pRVmMzbysyYXUzM3h5aHBmY2RxZVlj?=
 =?utf-8?B?NVAzdEs0bXlvelNFZnQwcUlxVSs5SUdOODRQZmNvRDdIenhodlQwNVFjVWRB?=
 =?utf-8?B?cEp2UXpTTUJzNkkwdExDQS83WEhjTGo5TXlKTjNYTjdmelErOGFEREZoTzlt?=
 =?utf-8?B?U2VHUDJvL29OMGJ5Y1IvSEpMemhnaVJNVURhUEI5akVMRDYvSUk2NW5McEto?=
 =?utf-8?B?d2J1ajZ2N2RzcmNNTmlIcnJMdnJrd1RZem4vMFZlZHYxWFhSNDBDcGlrRU1a?=
 =?utf-8?B?Q0dscjI1VVRJNWlyeWxmdjdqRmdqZWhYOG9ibnVkK25jWlc1VVoxRUR3bmlI?=
 =?utf-8?B?NXdWYTUvRi95a3RXZm5TS2ZJVm9CVVJ2aExpaXNtUy94aFZMdXl2c2NjMmkz?=
 =?utf-8?B?U3lOSzg5Ui9vNlBvQXczTmlMNzAyWlBDdEVGVmJHUFpSenF2MWROM3RjalpZ?=
 =?utf-8?B?b3FreDhJaFRDNXhKaVpBUDM5SWlyT2I1ditPMXMwaEh0aEJNRXN5OXZuVlVZ?=
 =?utf-8?B?b0FqK2Z6QzhvMWx2V0ltZGxWL3EvblpRTCtwV1Q3OHYyaFpKU0kvTFhldGxp?=
 =?utf-8?B?ejVlVTl0M3VVYXpWdGFyWkw1b29JY3BKczBla1J6MzMxYWl2NytnQ1FDQUNN?=
 =?utf-8?B?NVVrRUNOSkU2Qnl4RDNUTldSV1JOaEwwSDg4T2xHOU9sRkF2d3E4NmFJdjZy?=
 =?utf-8?B?Rnd2WEpqYUNqVG0zbXBBejlpSTluWVY1YUk2d1ZaZXRZVEJ0ejBHVGF0cnN0?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae139f01-0083-4b2a-d6e0-08ddfa01a905
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:58:39.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++hukVVFrlrxqcd95MaeXN5ZzeXDvZdHAYWtXbFwyZeqa0KKdUzwSdchaQU2AAKfe7eXSiEuIuwzG/bmhBXVjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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

On Mon, Sep 22, 2025 at 10:47:07AM -0700, Matthew Brost wrote:
> On Thu, Sep 18, 2025 at 01:00:04PM +0530, Satyanarayana K V P wrote:
> > The migrate VM builds the CCS metadata save/restore batch buffer (BB) in
> > advance and retains it so the GuC can submit it directly when saving a
> > VM’s state.
> > 
> > When a VM migrates between VFs, the GGTT base can change. Any GGTT-based
> > addresses embedded in the BB would then have to be parsed and patched.
> > 
> > Use PPGTT addresses in the BB (including for TLB invalidation) so the BB
> > remains GGTT-agnostic and requires no address fixups during migration.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Longterm we need a bit of cleanup in xe_migrate.c to really make it
> clear how the kernel PTEs are being used + kernel doc but as far as I
> can tell this change should work with the current code base.
> 
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

Also, feel free to send this one out by itself and merge it ahead of the
rest of the series.

Matt

> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 28 ++++++++++++++++++++--------
> >  1 file changed, 20 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 6fad5d469629..d375ebc9323d 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -971,15 +971,27 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
> >  	return migrate->q->lrc[0];
> >  }
> >  
> > -static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
> > -				 u32 flags)
> > +static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> >  {
> > -	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
> > +	/*
> > +	 * The migrate VM is self-referential so it can modify its own PTEs (see
> > +	 * pte_update_size() or emit_pte() functions). We reserve NUM_KERNEL_PDE
> > +	 * entries for kernel operations (copies, clears, CCS migrate), and
> > +	 * suballocate the rest to user operations (binds/unbinds). With
> > +	 * NUM_KERNEL_PDE = 15, NUM_KERNEL_PDE - 1 is already used for PTE updates,
> > +	 * so assign NUM_KERNEL_PDE - 2 for TLB invalidation.
> > +	 */
> > +	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > +}
> > +
> > +static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > +{
> > +	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > +
> >  	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> >  		  MI_FLUSH_IMM_DW | flags;
> > -	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
> > -		  MI_FLUSH_DW_USE_GTT;
> > -	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
> > +	dw[i++] = lower_32_bits(addr);
> > +	dw[i++] = upper_32_bits(addr);
> >  	dw[i++] = MI_NOOP;
> >  	dw[i++] = MI_NOOP;
> >  
> > @@ -1092,11 +1104,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  
> >  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> >  
> > -		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > +		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> >  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> >  						  src_L0_ofs, dst_is_pltt,
> >  						  src_L0, ccs_ofs, true);
> > -		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > +		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> >  
> >  		size -= src_L0;
> >  	}
> > -- 
> > 2.51.0
> > 
