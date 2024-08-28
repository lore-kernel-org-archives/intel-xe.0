Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3892C636EE
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 18:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EBD10E032;
	Wed, 28 Aug 2024 18:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6G2gH7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A154E10E032
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 18:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724869936; x=1756405936;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1GPQsRORdPiFX5X4Qse2PeW6G7PkWhuzHIm3507TDrA=;
 b=F6G2gH7SB1r34/c70nQUAbfimkdAZT2Gc7Pj7uwBxK5QytsH8UOqW5Jz
 vnXBLt6oU4wgqRVYxVYItMQSRPMKMdct/LEIc7998UxgPe62pc5KW0x/0
 /a0thWyHlIJl8/mFMWLy4SNngvZyr/3KKZJG0AfRDn+lYYrwcDNehwPjc
 9EFr1H+t2O+CoDasTpaz/D/vMmEq0B3o7nm/ShpfA2rZCAIZYUdS9tobl
 BIkT+OzFvca4QVcEokAuB64ovKz9l5C37jtshC94biMZJWQCyus2CCdFO
 +EaanG2BcTzNSgbg+dMS0s1ivc+HsD7xwNk3Nd0ZaLpg3mEEjaOYxeHwy g==;
X-CSE-ConnectionGUID: IErssottQ4m8NZet2Ai9pg==
X-CSE-MsgGUID: JRxlpHtNQ02X1a3CXdcSJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23382244"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23382244"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 11:32:10 -0700
X-CSE-ConnectionGUID: vHvCsjaJR76JHWWJCqcGwg==
X-CSE-MsgGUID: ThZlhSHaQdKhKix1TrOiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="94026062"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 11:32:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 11:32:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 11:31:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 11:31:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 11:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZFCWShyIBcyt8brnOk++9KWNxA1kasSQcA5eUTud/DFWCnvsmOkA9pqfxSEkv12pGg+s9d2M7fEFr31x1LdD3UpksurUCtKj51Um2RR50TEnlvcJSCUFRa0rqIysbVjvO5008j0qmVXJak+SEIazbfb9szv2s22Zt4J6Jn2xuKocWT8cWtuRdfwuM30hjvwSm4MpuW3Cnwigs80suxfpnfQWw0hyhy3plPm4w9YVSyumlSFc8onbgdkCHBCiBvd57f8OqFJ7qbD6AEar50xm141GdCGSkxfKDAb90CTSp40NA3YRJYUVi0rtBMwHJoCDYmoeU4Novm2gcs2rFBxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=985oTTGu00CmUXFw8hlikDfKQGpGwk1JC45oeIocdeM=;
 b=pne05BQ+VjAaFtKhD8zb9Lt2VBPxSBUs1FvLGFmrbs6oORm9IkfYLv53y6ZVp/pplESJb+OsUNI5R408/1DRVB2/+Y2xb6zW+hdTS6dG8QADNErKUDjZfhaas1HgWzdPeYGd1ZgJ7ok2sKEsM5RM8/6G3p/WtVPnOrJ4BRFv03DdkIwkqcuBQ0OI1YEKser/nErOlriAwfTveJlF2Ne8X7C/+rGhhV6BdtrItqEt5W3nIHruF687ghoIq3uReYwOQcPm56n7f2+8l089IfR6X/JoV/B1FznHD+OtDKUCc/AVfPgRKO+ThDkfxkV3jQ4UGVGqf3/6rrQlPjv4zYgX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Wed, 28 Aug
 2024 18:31:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 18:31:08 +0000
Message-ID: <b54629d9-44ed-4bda-8b54-f53eaee85bc4@intel.com>
Date: Thu, 29 Aug 2024 00:01:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add missing runtime reference to wedged upon
 gt_reset
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240828173256.182364-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240828173256.182364-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 58725244-3fd1-4e7c-4083-08dcc78f954c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXpYSEpIT2IvT0hGb1IxbFFoMUhyVFZPTEhjVFNJNFN6aHB0cGlrQ2x6RjZG?=
 =?utf-8?B?V1pCN3NxZG1LVFd1TU1PeWtFRGRkMkEyazdOdWlhVW80aytVeFhZQXNHaFBP?=
 =?utf-8?B?WWFBTG1uTU9iNzRBVzkwNnZGZXRiVWtNcUY0K09LK090d1NRNDdINmJuRGVu?=
 =?utf-8?B?UU5oei95SHNWQXFXckQ5NzFPZEJzZWU5aVA5WS9uaitSVkVKNXFPYnpqWkxQ?=
 =?utf-8?B?cWFYRzc1d3BXelh0SjFhRVN0alNnYVpQVk9rYlJiWURValg2b0tkYWVHYnIr?=
 =?utf-8?B?b1NRa2RjR1BNNnhUdnh5cDhrQ2JsTEdrUEwyVTU1Tm9Tb3RWZjl6TVdNTFpK?=
 =?utf-8?B?Y2V2RXROanhTZkk2REpoTGpmYWc0SzdSbUZFUWhuWVZlNDREaktobGZwbnlM?=
 =?utf-8?B?eWFhVzZ4TWVObWo4bGtpTm91Q1J3UWtzNWJYc2VGRVNDcWw3TVVXUTBEcDdm?=
 =?utf-8?B?Uit5c0hxbTAyTkJZeWVvS3Y3OWdoS293YmFPUUx6VCt5T3dtT25DazRlY1lX?=
 =?utf-8?B?eFlBVHQrOVFLcllYV1ZPWVA2ZVVVbnBJWDNNVVlBRFVMV2dyUmJBSFA0aEFj?=
 =?utf-8?B?dUMxRHJKVGNHc3JQMTVlWmVVRXRoTmRuRTF3aVJlZ3A0VnM0S3lsMitmWTlK?=
 =?utf-8?B?aVByS2pZNFhUelpHcnJ3S2dQK2kyWWZlNHRpanVrVFhuSzhOYUhpVGNTUWhP?=
 =?utf-8?B?S2ZmQms0c2pMbXVNVFNRVmhUdHZqaHlObURTSDdHeFBkd2F1Y0d0Mk9ZUStm?=
 =?utf-8?B?Z3c3aGtBZk8vRnY3Ty9VS2pQalRQbE5IS2x1ZEdBNlRGekZZTDZjU1NUTWo2?=
 =?utf-8?B?Rno0UG5xZ0FrMCtab2kxNjJrMWZyY3JsSndCSDBteE5VaDZqRUZNL0xVb3c0?=
 =?utf-8?B?VFdWa0ZPd2ZmSVFOYXM0UFJwZnU4V0lkZUVyb1RhRlRUay8wNDIzT1NjdkI5?=
 =?utf-8?B?VEpsMWI0YXZ2UjhCbDhBK3dBSEU1YXptdTJYb2kzNEw3cFFmeE84STl1a3BK?=
 =?utf-8?B?clZxTUtpNnhaTXpBMVBIaDR4MUQ1Q2F5MTMrWXRPajRobE5BN0RhWTNVS0M4?=
 =?utf-8?B?TVJ3ZVhwd2YxU1QwK25NRFB2SkFNeVEzTFhXT2x1SStJc1NFZ05YbmNPbjVB?=
 =?utf-8?B?QjZDVHpEc1AxWnhhVkdVR0NnYmJlMDU4eWQwS3BqNk9lVmVRSlpjWmE4alVl?=
 =?utf-8?B?SjZvWHI0RW9QMXl2R1hMNGZNQjZ1WDlWUkRhRkp4Z0wyZk5IQzZNVjJOVWVU?=
 =?utf-8?B?UUlwV2xmRktKamlxOTZoOXVHeVVFRyt4RVJ5eVdzVEpJMjdhcHRBSG1VQld0?=
 =?utf-8?B?bWd3dTYwTnpSYzVwZVpWMUhVUGJoNGl6WU9wQ2M1a0Mrbm91anlrQW1ZQjJK?=
 =?utf-8?B?QUZFS3J4bWx2elVRd2VuYmJLMW9xV2RtTFVZdHZMTTBGc1pidmdPQk1oaytU?=
 =?utf-8?B?eVM4MjlYOXVjbzBUdVBlcDhUYVl2OE5jaytGUVRLbHZid21nMlFLN3NoeG9l?=
 =?utf-8?B?Rk5kOGVhLytxcUYzK0N2OWpxSUlRbENiZ3dEZTI1N1V6UVpLUGVzbkU2THFH?=
 =?utf-8?B?S3RHMVBoR1hlVEhIbmYvOVBRM1ZaUTFTQkRQN3ZkaVM5M0Z4dUt3SmZ4cmJo?=
 =?utf-8?B?UmRQT1ptRWcrMUU0NWNzS2pkRWs3NFd6Z1FkT3crVmllVmtRdW9TMHNaUFJN?=
 =?utf-8?B?aUFBMlp6ODN1V25aRXpWVUUrOW1CeVh0NUVGWnBBa3RzK0dwcFZqRzlJcVE2?=
 =?utf-8?B?MmR5c3hVc1RHQnRqN3B0aGxuc0Yza1J0dEZTVkJ5cmZrcUYrU0JEVElnbjNO?=
 =?utf-8?B?algyakRDYWtqYTJVdkJhUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aENxd3dKK0VNV1JIVXJzblFpdnhxcjdobW1iSzV0a28yWXFIaCtGUFpRRWRj?=
 =?utf-8?B?RktYbnRKNTNhdk5hN3VldU1BcmhwU3NzWVA1U0xZOXM0N0F1ZkF1dHFHMWRp?=
 =?utf-8?B?RXZaYlRJUXU1U1RHQ2VQa0hFWmVaazZBY2NqZ0lTcG1aN3RVa2lHUURiN0ky?=
 =?utf-8?B?OW1PWjcwQnZOVHhIMmljUjJOM1dsZlNiUG85V0RiNG1ncFJqdHpzTGRORWRt?=
 =?utf-8?B?ckszVlpHMld2bGtBbVZFN3k2NU41eEFreGNkWE9TQmF0cTZTK1QvMDg2N092?=
 =?utf-8?B?TEQ2TlNUYzFUMzJiY1JjV01jQThnMm80OTJIUUVORG5vOWVKT0p0Z0FkSzR0?=
 =?utf-8?B?aGxuT0JvQmxNc056NmlLdVFXMnpUVFpXTEZGQlJCMDdkYjdVMkQwcDZiZ1Rh?=
 =?utf-8?B?ZTZyNVNuNUVkQjlkaGF5YmtaSVA1T081djdYc3hpaHpXTXZ2WUY1QzFpWklY?=
 =?utf-8?B?dmxjTy9uYWhLUW5lN3JEUFRnejdIOXBIYVpVSWozcWdYQ0pzcG9OeURLR2Rm?=
 =?utf-8?B?SHZiTkExMHVkY0NwTG9xMFl6V0VvV3NVNngrYTEwTktYNHNDNWN2bjJUK1ZM?=
 =?utf-8?B?Ykw1ZTN3Q0Z3RklGdkdMSThmdWFsWE1kSlBkd3FzR0lWaWhpcm1jZERQMTlH?=
 =?utf-8?B?WW95VXpGNWgrcWFyVnF1MEg2WTJtVDVmaHN1Vmd0Q0RNZkpBTDBDaGtJZGpu?=
 =?utf-8?B?ZjBoR2hTQ3RFWStXY0I2dlFjc1UzTUIwMFBYa2txSmVkeVh3cTZNQXB5VTBC?=
 =?utf-8?B?Vm0wdnRXNUhNdGc0RkxIR2FVMm9COVUxZEFMNHlxUnh6YVFNUjVaUDJlbTZR?=
 =?utf-8?B?ZzdZMG5Mek5xeGZkRWp3OVovS0VBMFNLdnU0ei9iRGF5K1QwQWJvQnBiRTVH?=
 =?utf-8?B?aWM1YXcrRHlwbkZYR24yVkZJT0FTVVloTmpmVk1ETHNGaFJ4QThRdGlRRk81?=
 =?utf-8?B?djZWcHVXc2VEU3hpeHRaa1M5c1RpYXB0ZzVZT25MeXFIcitnajRQNkZvSDdW?=
 =?utf-8?B?TFdnekRoODdHVWRVdkdzQm5HTW81VEo2M0toUW83aHBXQkpIWVgwZFVoUlBy?=
 =?utf-8?B?Y3BRTlJRcHJ1Q0gxZmJNcUR2a1c0S3VLTG1ZN0pPVUVWczBmNnhyZVB6Q0Vj?=
 =?utf-8?B?Qm5YYisvbzBPK3NxTjZLZ1g1VllvSVVQT0IzZXpBUFh1dGJTYzNQQ05WdFBI?=
 =?utf-8?B?bGhUdmpucExjRjNkMjh4UzBveDFOcjlWam1wMzlHZ1dnQU43UFg4OVdIY3ZS?=
 =?utf-8?B?YjRuWVE0OE1YK0MrMWZWQnNJUkhHVHAwUXlBSmFqVi8rYk9WRWNHN1pKQTNy?=
 =?utf-8?B?SFgybm4vbGprUjNNS1Y5NFdHWnBKdHgrYUYvTTg1NEszOVp1SG9YOG82OVJV?=
 =?utf-8?B?ZU41c0U1UjYxMDR1aklTUGhTQjZXNCs3b05wTm9ucHBoVDhyb0trWHNlYVU0?=
 =?utf-8?B?WHFsQ3V1TzMzUHlYU0ZQWTV5bjMwRDQ2VXhSVmFENmxmSHQyVG5VQndMcWJo?=
 =?utf-8?B?VFZTQWo2UGIvcnhCM3U0djkzN3p1MDBKdEV6MlRJR0YyREVHY1ZOZDh1WnU5?=
 =?utf-8?B?UkEzVTMvTlQ3RVlycVBwai9nL2FWcWl2N3N2UTdOZDBQczRRRTlUc21Sd2Nm?=
 =?utf-8?B?K0N3bHArM01VdjNDYkM2VGQ3TGRWazhCUStxVDhqQ2I4UTg4N2hXUEt1ejZM?=
 =?utf-8?B?bktwd0pLZ0UzRVhaNUl3U1JtZnI1RzdhZWl4VHhSM1dLRFI4b3NVcmxJSmtS?=
 =?utf-8?B?bkk5dW9mSkZqWGpmMEFuV2tveUU3SHo3RUlDV3ZTU2Nvdk5XVUQ0VWc5TktJ?=
 =?utf-8?B?WEl6SkIrKzlnQjFMWExCazFUdE5NQ29xY1pidVM3L2lRc3g3WXRidDN3VnlQ?=
 =?utf-8?B?VWZmbG1ISG43RERYSElReVRrc0IrODcxVEVVcE8zVGQwbkxEWE5EajBHRnlE?=
 =?utf-8?B?ZHA3OVV6SHI4WWZQSzRVeHowR1ZsMitvMEQxWVdlN0htWGFWV0o3ZzV3ai9o?=
 =?utf-8?B?UkNQMUMxMCtiOGVlNGhsTXE4cHBDYzlOZkJQc3lCcXlTRUt4RXJwUFZLSVh4?=
 =?utf-8?B?UVVTbWROK25oTUhmYVlHTDJ1MEhoc2dYd001Q0c1cXhCMjhzaXY3WEZpeGNN?=
 =?utf-8?B?QnptRE9mdVFReEVFelhBL2cwMEZBTmU3YWFKTEd3cnNRZWhPb1pDaXhaanN4?=
 =?utf-8?Q?sBSNVigSj/hsp350/8XaLKI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58725244-3fd1-4e7c-4083-08dcc78f954c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 18:31:08.1876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ltg7JJbqXLUKp0zZTPjNZtq0qydUn0CAuj62xmvdCxv9U59kZpatmvyFochmWXfqpHx7xIPYQTCnSIW2aN9hSRYNyeYFdLjCltDYCtKi7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
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



On 28-08-2024 23:02, Rodrigo Vivi wrote:
> Fixes this missed case:
> 
> xe 0000:00:02.0: [drm] Missing outer runtime PM protection
> WARNING: CPU: 99 PID: 1455 at drivers/gpu/drm/xe/xe_pm.c:564 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> Call Trace:
> <TASK>
> ? show_regs+0x67/0x70
> ? __warn+0x94/0x1b0
> ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> ? report_bug+0x1b7/0x1d0
> ? handle_bug+0x46/0x80
> ? exc_invalid_op+0x19/0x70
> ? asm_exc_invalid_op+0x1b/0x20
> ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> xe_device_declare_wedged+0x91/0x280 [xe]
> gt_reset_worker+0xa2/0x250 [xe]
> 
> Fixes: da4b21f402c6 ("drm/xe: Add missing runtime reference to wedged upon gt_reset")

Hi Rodrigo,

fixes tag looks wrong, "drm/xe: Add missing runtime reference to wedged 
upon gt_reset" is this patch.


> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 224c137967c3..a895704bf64f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -794,11 +794,11 @@ static int gt_reset(struct xe_gt *gt)
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   err_msg:
>   	XE_WARN_ON(xe_uc_start(&gt->uc));
> -	xe_pm_runtime_put(gt_to_xe(gt));
>   err_fail:
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>   
>   	xe_device_declare_wedged(gt_to_xe(gt));
> +	xe_pm_runtime_put(gt_to_xe(gt));


AFAIU, this looks incomplete, xe_pm_runtime_get() should also move 
before if (xe_fault_inject_gt_reset()).

Thanks

>   
>   	return err;
>   }
