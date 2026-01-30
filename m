Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59759E6BF31
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 18:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A4610E1AF;
	Fri, 30 Jan 2026 18:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tu7yLnTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B3D10E1AF
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769796526; x=1801332526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rQtcLSIpXEqBJBxfwZMUdThABrVgFNAnEZrcShnMbok=;
 b=Tu7yLnTXQYLk1k4LSfCBqLQDoQIFq4zcfd8N8q0msY+e1Lb+NZRMd0Lr
 Oym2Ufmz93QCGsWqn5DdIjmoCIl00W3k+xNtbMU5d1zV4mVzX9IXzkOvs
 rjb4i7DEpY1Zcgio902z286z6st8IZgUbBRbExJ4OjkwgHS02LLJzRqh6
 RJKrSH1Y4Gx+LI5n4oNbEx87y5voCFqRbZLKkB9FaxHcfprgFbO3rOqiF
 aiYVFfThBHqSPMyzW1qvP6VLRWnfilFTT6mNVPw8JX52p/MC+GNi/nnzO
 WNjUAxd2c6sL/vmUyxQ96/y55xsHQYLgFjKXZzzUG8lckHAqw9js6OAoS A==;
X-CSE-ConnectionGUID: EqigdNxFTWu2Zl7LBsVKMw==
X-CSE-MsgGUID: oOX3QVzRT1S/cCNFwhPYDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73653425"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="73653425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:08:46 -0800
X-CSE-ConnectionGUID: UUo2hF3qSWuNLpNykV2nfQ==
X-CSE-MsgGUID: Fr+Wn4cISt+3LxCeau8Rdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="209323950"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:08:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:08:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 10:08:45 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:08:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ja8gfy3UgMtZO+1OnHOjOo74LviZhgrverpXfY83VoxXFLOfkahBw25mmIgutQyaDIJkAmeqMOnTQN7XWe5FTKJ4wE6cfOY6CUEFdn5yQKQTb42xwMNpRwX2V5o1t8CLyh2W4eYLBrwI6/C7UqR9Rb5lWnljKPYxxuEvXSS4oP18VIr3uzKMBUvmwEr5ys5Yh6DAAh2VprjGBl8toeZbUNVrVMlbNbVPeyquYqQQRkmoSS4oJ3qcvgyit6pPUoAnNQzbuJJ6rXoKwHCh6hpA+nnrj1qn49jazSO0RMPzUPgQcgmiJtTUo785QE92wLsyOJg52kH+yKth9Hy2cTnGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQtcLSIpXEqBJBxfwZMUdThABrVgFNAnEZrcShnMbok=;
 b=Nj4FidIEPC7xbTJPDUwH2GFOnQ5e5N/9cYUOt22y+VItPeJD1zQbf3wCU5bBDV0zKB9SCaLgpjOAm3FPvVJMT/0JV9026qDB+VIPF1GgGWwhZ70zFsp18V+mNlo8Ce6yznYNYrNdJ2ARHau0UV9YY2gYtNGbka+QVSOg5RLsoIf+Hl9q1ArE/VRJxh7zbjhaN+waGsKnA+VhNUuy0YIjH7KQ4YRRlPXoUEHPYvrtruicQYhUnSfloW8tnCHGOMbV3j8ghth3QBfy8Bar/M4SOGvWVEYVcL9eYAOnz9xANTtUltYhNvXsrhFZs7ygDnAQsz/EA5Ga8M6JlqvKwYWcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 18:08:43 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 18:08:43 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v1] drm/xe/vf: Avoid reading media version when media GT
 is disabled
Thread-Topic: [PATCH v1] drm/xe/vf: Avoid reading media version when media GT
 is disabled
Thread-Index: AQHckgD3++o9hlVMi02ew0ACiD5r7bVq/4MQ
Date: Fri, 30 Jan 2026 18:08:42 +0000
Message-ID: <DM4PR11MB5456EABC995F7621BE2AEB76EA9FA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260130155522.2738547-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260130155522.2738547-1-piotr.piorkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MW3PR11MB4586:EE_
x-ms-office365-filtering-correlation-id: 2c3fb00f-e986-4bdc-8ff5-08de602a9a97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YTVCQVowcTN3Z0VoVWtWTUYrZ2VSeHFhQmF6Qkh4Y01Wa2N5MmYvaXlQS2Vv?=
 =?utf-8?B?QmJaVUVpdFRIZU1uVVJGZ2oyTFplRmRGbnhsWmNiZEp0bGt5TlhLQzdZd0c2?=
 =?utf-8?B?WFlNZzlzSG9hQjdRRnorbWw5ZGsvUmlJWHVUNTZkandwaXp1N3g2Wm1JTTRx?=
 =?utf-8?B?TVFHWmpCd043RTV6NVNablBoTjhhdlBLK0xXTEJLSmdDS0duY0RNaThnOERN?=
 =?utf-8?B?OVFQTEFabHduN05UODlaZ3BmdEJ1Zkc3NkNiTWdxaXZpZkRGb3pjVG03Y1dI?=
 =?utf-8?B?UUozSU1zaUlib1lXU0t5R1lyR3hlTjNhQXNEK3dNeXUvbTJsWkxYcW83M0NG?=
 =?utf-8?B?NEJ5N0RBdS9acy9EWWxmWkNlWGFMYXNlZFROajdvTXBGd0owY29tT1lLdzV1?=
 =?utf-8?B?aG9tcURGc3FVUFdNS2dzWHlMK0dkL201K056YXF2U2k2a1BIdXRReWpuNGFj?=
 =?utf-8?B?K1h2WW1QZE1GY2doMEZTMUVUcHZyODl5MFFWNTlWTk5Db0lWV2laWWNMc3Ux?=
 =?utf-8?B?UGlIS0dDRmJlZVdVYjI0ZVcvZUVjNTduekJDS2I5OFdxdUh6VTFHMWkzZHVu?=
 =?utf-8?B?U0NwUCtIQ3Z5V0hRcTVtVlB5TEJuc1FxUEQ4ZmQvdytRditSWEwydVJxaVZo?=
 =?utf-8?B?MGp3ZWh3bHJDT2J6b3dYYXJCanJ6OXUwL0g3WDVObUptdlNnM3F2enR4UFJl?=
 =?utf-8?B?K3lTbUthVklmczVwODVoYjlxRkM1TWk0MFlpb3lVNjlQRFRyTnRybFZTNEJY?=
 =?utf-8?B?eHIxdWNCeThJY0dPenBkYXNkRjRSVEJ2cnYrUEpiT05TRDVvbTdZd1hLQlAz?=
 =?utf-8?B?d3pFdENtTHhMb2Q4ZWRjL3I0Nld1VUJVQjk3UnZIOWdYQXFKNUUvQktvNGpz?=
 =?utf-8?B?S0RMVVh1YzNCcWpkTGxvWXJla2RsQ2cyOUlsMEQyS1gzQkxxRUZTeU9Ba1ly?=
 =?utf-8?B?UlhWQmFId0hJN3gvcmxsR0NnUWlDRzNOTEFyZXhzTUR1UGlKQ1RRcFB2Yk1M?=
 =?utf-8?B?eWY0eGRQaEdrM3ZQUnhwWDhydmltNVdnbmZjTUhpWnFnY3FLekN4dHpvSE5F?=
 =?utf-8?B?dkZNbTdUSUdab3VocytYMmtTa3NlTkpXaFJtb3JsYXdDdzVMZTBlK3BPTjhw?=
 =?utf-8?B?Q2x4cTUxbWRiT1hpRUdGeW9NTDdNNVgrVm5CekdwL21xTW9UZS9hVlM3c1p5?=
 =?utf-8?B?UVRyZ2s1MC9zRjlJUy9vSEN2Szl2cEVyeUpoYi9tQ1A0MEJRZHMrZHEyRDdj?=
 =?utf-8?B?dW9JVDVEa2psdzMrOE9lNk5maElIWkJkL0FDWnYxQzdwQk1kOW90bVZqTkxT?=
 =?utf-8?B?YmRCWExlUWw0VDZqc3lIeUlGZzBhTWZobG5ZVDd5b2Y1SXc1d2FYOFVrWEZZ?=
 =?utf-8?B?aDhGV0p1alBhY2tNR3hwTEpwTTRpZTYxSHpXMEp5WHRzRUo1T09tUmN2TkZD?=
 =?utf-8?B?SmJpUlByckFLM2hSdFRWZ05KclFDNFFnZXJJdndzUnRBMGJzSXBMbmFEK29K?=
 =?utf-8?B?TlY0bnJMY3psdXhJajZtL2ZDSFhiMmNySjErZ01LQ2dBOFhjVERuQm4vSm1o?=
 =?utf-8?B?R0pub2JJTEV4SGlnYTVvZGxTa0VJNlpRQWphOC9OSHpIaENpaWZPdE03WlYw?=
 =?utf-8?B?eGZlODRFeDNKWGxHYnBTc2VvQnNlcTJNMVgyZ1htNUpXU3JEVWl2RVBNNFMw?=
 =?utf-8?B?Y3Noa0lrRGRCZWErNVU5eDdJdFZuYURMcWcyREU5R2FVdGxOdlhKTDRNZ05j?=
 =?utf-8?B?bUc2UnpwbmNRQXVpYnA5c1FYMURZV3ZUSlNkazQyaDh4Y21hWFFGQlJaejk3?=
 =?utf-8?B?U1lEd2U3UkRTS1dNZk9rWFcxK1NwZk1pNlVaYVUxcy9qdVlYaHRRU3JYZW9Y?=
 =?utf-8?B?akpNQnNtMTdKaFpaWTB6Rm5iZ2pUK1VzUHFSK1NCN2gzOHFocE10VzJTZU9h?=
 =?utf-8?B?N0dFbXpXeCtwdVd4cDloVFpHUlkya2pScGdIdXVRWkN1RXVnOWErL0l3UURV?=
 =?utf-8?B?OEJhc1QwaDBvM0o0RWM0WGJvU2xZYW1RK0h1elFxU0YxdDdsUy9CbXZCbEpv?=
 =?utf-8?B?Y0F0MzVjeHB1aEFtUEExRXRiZldQTzJEZ1dsWnlvQk4xVlVxSE9TSm5xNzJY?=
 =?utf-8?B?Ty9BWm5KNDZiYkFwd3JxTEY3N0lyRldoY20xaUxrTTQ5dU5NVFVyelRWZmRC?=
 =?utf-8?Q?2DqFxXvy+kK46y4ALmgB7Tg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TktQWVZpVUZ4SFRCUkVXOUtGWUJrcG1LZG9ubnNMNG1YTW5TQ0ZmWWhvSCt3?=
 =?utf-8?B?RFFuU3J6T1c5T3RVZ0ROWm9POG5hOTgvbUphaVdCWmJaRHAwRXNHNjNxL293?=
 =?utf-8?B?YVR4c0poLzJGS05YSDJzcTF0MzZpUFh1WUdaM2tzcXV6L1FnOHJCTm5MZnBx?=
 =?utf-8?B?eWEyTU92akYvdFFpQmE1NkpjNnQxVmhzMG5PbGwxYkhhU0czaXgxcmVEU3k5?=
 =?utf-8?B?NzV0OEF3emx3UUMvb2NyeUUxNWZJcjFnWjFlUWNHd0FMUUhqQVZlVkFCVytl?=
 =?utf-8?B?RmJHWktDV3Y5Y0FPUVF1RUV5a1FUazVzMWNHQVlXSmdFL2dUWDJHUW5NeUJn?=
 =?utf-8?B?TG1HOEJEejlmSlRLRkpsYVBoTENSZURQSnc2TjY4TVNHV2dhRFU5b0F1QWQz?=
 =?utf-8?B?eWxOUWJYZmwxWHhhNjhGNVpkQlJMZitteDJsTjdvbHdtQkVWN0s5RjAwS25q?=
 =?utf-8?B?UjAzbm9RSHBQTlVNQTVkMGhvY00wVjEzYzA4VlBSQWRCbVJrYnB6YkdHbEdB?=
 =?utf-8?B?K2FjNUpiUW9hS1Y3dzdEdkZJS3FtSTlmUXlWUlZmQjFPaW8rbktacHhteUlI?=
 =?utf-8?B?SWFDYWF2M1BSVm5jSERsVU4vRkZoL3RwYVZqMzIwOVVTWmdOeVhrZVBzZDNm?=
 =?utf-8?B?U3BpUEc2YXowMUdqRUN1WGNSMTNRRjNqWS92RFBjVzdTN3lvckl4RUVPOWg3?=
 =?utf-8?B?V2VHd2xiZUNFOVIrRCtBYzNaVTdyN2plamZhUmtPSWlWTzBoU1Fsd29HeHBG?=
 =?utf-8?B?aDZ6dFpqaHFvWDBudGFTcHMrQVRxeFNYb2pKN0hhWlJjcGpCOVpHbThIbDNG?=
 =?utf-8?B?SHhvZkQ0czhwNHZzTHZKUWM5N29LM1M3YVhoOC9WWEZBSlNoVVA2a3QxRUVJ?=
 =?utf-8?B?Z01GeTEwM0N5WUl3eWN1OUhWU1h5bmFOOHhoVVVROXJmbHBXa3B0NEpFU1hv?=
 =?utf-8?B?YjVmUitoeVIxNEk3VGs1MWdCY1F5ZldvcEt6V1RLbStsaWh6Ykw4UkhtTlhq?=
 =?utf-8?B?aHVOZVdtMW5DaTBCVEU1Nkk5QStwZ1U5aWFCTVFpd2pXUm1teFFHaGt4N3V3?=
 =?utf-8?B?WEJYK01BR3pURFlxcnZwWHIyTmRwbW5yZFhmdzFsaUphUTNVNHVkbUpkZTlU?=
 =?utf-8?B?dFZtZmd6b3Ayb3J5ZzdVNWUrb1lOYU1XNG16ejNzKzVMclE1Zm9ubUNvZFFZ?=
 =?utf-8?B?dU5BcGUxcHpCb2lPcUdKeGROZG16UG1jb09YQ3dFWEh3OUhMSEpXOTN2SjdW?=
 =?utf-8?B?RFd6YXVBK28yRWs2akxRRmsxbktGdzhZSmxtLy93SVAvdEwxR1VwR0VvaXNu?=
 =?utf-8?B?ZDlNZzJLQU5zbVFSYUhrUlA1R0VhS0t1c1hZWkE3dkFXK05VV0hhbTlBNERv?=
 =?utf-8?B?L0c1b1B6bHFTOGtKMCtGS290eURnSWJkT3RySnNQWFBES1Jrb0JFK1ZLYmtj?=
 =?utf-8?B?a3RKWXQ1Nm9ENWdzQUUrZUNiL0VyUVpMdnpIMVJuNEhBNjhSRDJxMnFldjV3?=
 =?utf-8?B?RmRCbEh6aDFkekhxN1ViMUU2YVpzNi93Y3A2TFJacHZzN3dxdVFOVEZleFNl?=
 =?utf-8?B?RUJENVlpWEZsWTN2T1N4dnhncTdETFFTQmVxZ2FNUE5sY1YrVzNuUHhIMjZ0?=
 =?utf-8?B?MXl3Wk9WZCswZjExUHp1TStHNEVWaEIvQXZwNUxyNXpNOTZDdDRWRzZ5eVlM?=
 =?utf-8?B?b2dmTXphTnk1OVhjMWI0Sk5mVFlsei9waVZEbFZXSjdzNFJwclRvNUFMNFRu?=
 =?utf-8?B?VTBNcmQ2b0gxUzUyZFZHSG9wcFJ2eUQvUjR0SzUwRXJsNmtYb2FSL29lN3NK?=
 =?utf-8?B?VHNGKy91TzJmZDlWVmZlZHl3S04zbHU3cjdDNzNiWE1ZTllvY1hwSWFhYVVa?=
 =?utf-8?B?Q1Z2QUlaNmVzQjFxa1BSd1dWRjZxY25xbEJrUnhCcTdBeWhIL0JMRmZLVXBs?=
 =?utf-8?B?ZDFZVDY2RUFSOFNuL296cktadnhha2N2UzRYelhnVDdRN3hKayt4VFZTaHVq?=
 =?utf-8?B?dEsrZXJaRFFVKzEza2FMYmVkc0dpSWJDdE1zQXJUck56d3JaaDlFajJxV25w?=
 =?utf-8?B?b0hkUHRkRG1qVjUrd1ZtQlpFRWRPQlk5NzdxTUpqZ0ZZSElGL25Edm1INGRv?=
 =?utf-8?B?dnpyblpTaTArbDYyam9FR1pFeS8wME9QeFp6ZG15RUV5bFg3NFFqd25FMjlm?=
 =?utf-8?B?RERMWk95OG5QNm9TcjBheTJrU2ZiS3pUdEF0T3E4bHJiSERuWXdFbzJ0dERx?=
 =?utf-8?B?ek0vUnArcW1zRkZGUS9SQVp0R3FGeHMxaUFuWmo4MmVkajhPVkowRENMNU9C?=
 =?utf-8?B?eFRIcXBNMllhVDVHUzAyM3RsOEt5eEtuWTgySEFaV1lta0tWZlROZXNiZ0Rs?=
 =?utf-8?Q?GAQvtqiK5+8XFNRUefjemxY6mrq1ZnxpOrO187GHfdCwT?=
x-ms-exchange-antispam-messagedata-1: TSf8E/883llspA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3fb00f-e986-4bdc-8ff5-08de602a9a97
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 18:08:43.1616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gfS4COT9HlyVkt5f+YJZzkBN++nK7kFab72Ov+87T7vDX498n6xBLkGYDCFp41zsT8uUlIT56d82d33DHJt+1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
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

T24gRnJpLCBKYW4gMzAsIDIwMjYgNzo1NSBBTSBQaW90ciBQacOzcmtvd3NraSB3cm90ZToNCj4g
U3ViamVjdDogW1BBVENIIHYxXSBkcm0veGUvdmY6IEF2b2lkIHJlYWRpbmcgbWVkaWEgdmVyc2lv
biB3aGVuIG1lZGlhIEdUIGlzDQo+IGRpc2FibGVkDQoNClRoZSBjaGFuZ2UgYWxzbyBhZmZlY3Rz
IHBmLCBtYXliZSBkcm9wIHZmIGluIHRoZSB0aXRsZT8NCg0KPiANCj4gRnJvbTogUGlvdHIgUGnD
s3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29tPg0KPiANCj4gV2hlbiB0aGUgbWVk
aWEgR1QgaXMgbm90IGFsbG93ZWQsIGEgVkYgbXVzdCBub3QgYXR0ZW1wdCB0byByZWFkIHRoZSBt
ZWRpYQ0KPiB2ZXJzaW9uIGZyb20gdGhlIEd1Qy4gVGhlIEd1QyBtYXkgbm90IGJlIGxvYWRlZCwg
YW5kIGFueSBhdHRlbXB0IHRvDQo+IGNvbW11bmljYXRlIHdpdGggaXQgd291bGQgcmVzdWx0IGlu
IGEgdGltZW91dCBhbmQgYSBWRiBwcm9iZSBmYWlsdXJlOg0KPiANCj4gKC4uLikNCj4gWyAxOTEy
LjQwNjA0Nl0geGUgMDAwMDowMTowMC4xOiBbZHJtXSAqRVJST1IqIFRpbGUwOiBHVDE6IEd1QyBt
bWlvDQo+IHJlcXVlc3QgMHg1NTA3OiBubyByZXBseSAweDU1MDcgWyAxOTEyLjQwNzI3N10geGUg
MDAwMDowMTowMC4xOiBbZHJtXQ0KPiAqRVJST1IqIFRpbGUwOiBHVDE6IFtHVUMgQ09NTVVOSUNB
VElPTl0gTU1JTyBzZW5kIGZhaWxlZCAoLQ0KPiBFVElNRURPVVQpIFsgMTkxMi40MDg2ODldIHhl
IDAwMDA6MDE6MDAuMTogW2RybV0gKkVSUk9SKiBWRjogVGlsZTA6DQo+IEdUMTogRmFpbGVkIHRv
IHJlc2V0IEd1QyBzdGF0ZSAoLUVUSU1FRE9VVCkgWyAxOTEyLjQxMzk4Nl0geGUNCj4gMDAwMDow
MTowMC4xOiBwcm9iZSB3aXRoIGRyaXZlciB4ZSBmYWlsZWQgd2l0aCBlcnJvciAtMTEwDQo+IA0K
PiBMZXQncyBza2lwIHJlYWRpbmcgdGhlIG1lZGlhIHZlcnNpb24gZm9yIFZGcyB3aGVuIHRoZSBt
ZWRpYSBHVCBpcyBub3QgYWxsb3dlZC4NCj4gDQo+IEZpeGVzOiA3YWJkNjkyNzhiYjUgKCJkcm0v
eGUvY29uZmlnZnM6IEFkZCBhdHRyaWJ1dGUgdG8gZGlzYWJsZSBHVCB0eXBlcyIpDQo+IFNpZ25l
ZC1vZmYtYnk6IFBpb3RyIFBpw7Nya293c2tpIDxwaW90ci5waW9ya293c2tpQGludGVsLmNvbT4N
Cj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IENjOiBNaWNo
YWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgfCA0ICsrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNp
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgaW5kZXgNCj4gYjVlODkzNWZmZjFkLi42
YWMxYmFhYmFiNGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gQEAgLTY0NCw2ICs2NDQsMTAg
QEAgc3RhdGljIGludCBoYW5kbGVfZ21kaWQoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJCQl2
ZXIgLyAxMDAsIHZlciAlIDEwMCk7DQo+ICAJfQ0KPiANCj4gKwkvKiBEb24ndCB0cnkgcmVhZCBt
ZWRpYSB2ZXIgaWYgbWVkaWEgR1QgaXMgbm90IGFsbG93ZWQgKi8NCg0KTml0OiAidHJ5IHJlYWQi
IHNob3VsZCBiZSAidHJ5IHRvIHJlYWQiLg0KDQo+ICsJaWYgKCF4ZV9jb25maWdmc19tZWRpYV9n
dF9hbGxvd2VkKHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpKSkNCj4gKwkJcmV0dXJuIDA7DQo+ICsN
Cg0KSSBhbSBjdXJpb3VzIGlmIHByaW1hcnkgZ3QgaXMgZGlzYWJsZWQsIHdpbGwgaXQgYWxzbyBo
YXZlIHNpbWlsYXIgaXNzdWU/DQpJZiBub3QsIHdoYXQgY2F1c2UgdGhlIGRpZmZlcmVuY2U/DQpU
aGFua3MuDQoNClNodWljaGVuZw0KDQo+ICAJcmV0ID0gcmVhZF9nbWRpZCh4ZSwgR01ESURfTUVE
SUEsICZ2ZXIsIG1lZGlhX3JldmlkKTsNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0K
PiAtLQ0KPiAyLjM0LjENCg0K
