Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5476BD4694F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 16:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F3410E825;
	Wed, 21 Jan 2026 16:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQriURzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC29410E846
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 16:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769011562; x=1800547562;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GRY+ar2sBRtrL1LKI9P2YUoTyjOFwqtDuFUHvsMzZCs=;
 b=cQriURzVjKsZFXTCq0hwgLx2UZJC3QDmRG72NbcboOichR3JozCXxTPy
 fDE8B0DgLXMIMURMRMZVP6ivl74rJvePIoU8IiT1PVA5se3mDp9PzW26d
 dNb3oDHre3IMbCYrfzJ3QgQqopliSPK/Zi6fGypwukTLy6atuz3PrnJmw
 fWGrpFqjRS9SditYMfi1/e2IUVXVocqswtk5F8EGuY9hh8ZxHUsgwwoU4
 +QA3iJXUrdLJmoLKkRppBjA3BkZvqxwvdr1MtI9R6OuARisNWsGUpkD5U
 LLU6V2AO7hCDACHK7dapKbGFY1U4sjg2yQ3Qz6O004bRRxETXWfV7sqju w==;
X-CSE-ConnectionGUID: YJApQ18qR7C3S5PBLIdJ1w==
X-CSE-MsgGUID: Cm0UoBEsRr2YlBuPcq7kpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="72831137"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="72831137"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 08:06:01 -0800
X-CSE-ConnectionGUID: XhcCOKLvRN6BNx3rS4cZ7g==
X-CSE-MsgGUID: yL2eKoF/ROae4wbYO0tBFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210643627"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 08:06:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 08:06:00 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 08:06:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 08:06:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUKvxnyJFOiQPdZMz/tX7W8778rfNEQS+Y0gU8E4aOKXC5EWnMl7yuzwGsSTKqNKs33TQ++KWzMCaTNQnlIjXrNS+0gj+emK/sUOppisrvi/WeD+AiwGX1R6vagg5fBbMahhxuwnnaj9yajPD2O906mQKmg1bG7Bw24tJENZbDytLDYmB8N8Ur901UzmDvh21fP7EeqkN5NGo6BtNJsoS7JxOHLRm3q8kNW8nJtXFvmhn6ICTpZRgeSGp46I3nrW0KvwLvbohbUuCn9+e2v6hz+1IW1KB6n+b2XAzHiAf6avQu0qyp+NehZ8VoLr6fFqWpcACjcwZZFjVVzwyeqewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRY+ar2sBRtrL1LKI9P2YUoTyjOFwqtDuFUHvsMzZCs=;
 b=G5L5uYp1+TsAA7iljdSD/cO5YoeGH3GDTM2OaVM17NzhHRfF71QzT8Pk7qobX07Rh39d+I/cBXZeuCCWyX+OLOpk6wmNyLWWTu+tlCVBQ8VUPIXbEG3QK+FdupiPrGC4vU1nUeb00Td+XtSDQbCb4CY3qFAbiF3Xao2eIT3wLD2IiBj/yTHcG6dmDZA6dZqeq3pAm/GRMevdZ1rgi1fKFfrf/qljoBFrz0KJ90HHeTQZ4Q6vHGY5/CwO9lLFhYYvgnofBVnWASaB5ZKkhpOrKSqTdT60LoiU9L70o//4NAe1uLYn6lzfWmaQXPpZgkaYjwg2Wp9M9tMdVy8XOzoGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA3PR11MB9157.namprd11.prod.outlook.com (2603:10b6:208:57b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 16:05:56 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.009; Wed, 21 Jan 2026
 16:05:55 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>
Subject: RE: [PATCH v4 3/3] drm/xe/nvm: Defer xe->nvm assignment until init
 succeeds
Thread-Topic: [PATCH v4 3/3] drm/xe/nvm: Defer xe->nvm assignment until init
 succeeds
Thread-Index: AQHcijueXx2aIBv5mUiE9cou7AyXD7VcMzgAgACWkqA=
Date: Wed, 21 Jan 2026 16:05:55 +0000
Message-ID: <DM4PR11MB5456F1FBD23996751E1027EEEA96A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260120183239.2966782-5-shuicheng.lin@intel.com>
 <20260120183239.2966782-8-shuicheng.lin@intel.com>
 <CY5PR11MB6366D0C9D99C229BB80C28C5ED96A@CY5PR11MB6366.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB6366D0C9D99C229BB80C28C5ED96A@CY5PR11MB6366.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA3PR11MB9157:EE_
x-ms-office365-filtering-correlation-id: 56fc3dde-bf77-40bb-38a3-08de5906f5a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?M1h2OFRQMTdsRy9PekRVYWNJTHhDYmdHVmFyNVE2aGZSQ2VEZmhzMTFtclJn?=
 =?utf-8?B?YjV4QkduK3FseU9mc1ZmMmMxeFplTnBZb01xQjNRMDZYbWZIbzZvWVZKYWZp?=
 =?utf-8?B?Tng5NytOUTlGT1RGTzl6eFNQaWRBaDZTUkpTTldvSENFd1dLWUVRT1E3blpN?=
 =?utf-8?B?NzRDV2cxcDhDYnR0V1p3T0FnSkxpRVAvWVV0MlhMRzkwZ3FiZ3VyMGZoTUdq?=
 =?utf-8?B?ai83dkxWbGxsSnF6N3RrSlprQnZ6MjRNY2hZS1VKME9LaVhtQVVNZUMyRTYy?=
 =?utf-8?B?MTdBd1FxM05XM0loNVBRTzVHZlpIWTJoMzRuTDRmSEkraW54OGMvZkFNanRF?=
 =?utf-8?B?Y1huaWU0Nm42OGhjODcwWGNTMDdtSWUwU3ByS0RNbGk2c3YydTRLUmVZVDY1?=
 =?utf-8?B?VVVlRkR5SjE3MkN5TjMwZ0xldm5GMzA0REswTkFZT012RGFrQlVab0Y4RkIx?=
 =?utf-8?B?R25Zc2swSkNZYkFiQjVMVVZJWVZDMXlRcWxpVnVJc05waC8zUm1TUkxmY0R1?=
 =?utf-8?B?Q2x6aWwwb2h2cktQSHVJdkh3S3lBdDhJUnJsZ293WERpczNQSzh5bGx3STF6?=
 =?utf-8?B?YndwQnoyaXBJSzdUN1NET3lQMzRJdFREN2VCRW40bXFkMGJ6VE12amNpL2d3?=
 =?utf-8?B?Z2ZhTERPMGVHSFZweVNXL2NVTGNCbVhabW8reG55QmEwdVVra3JKSVhmV3JP?=
 =?utf-8?B?UFFabVdhWDJHWVJpTDF3VzYyeXNDU1dmVFU2ZEhQN1JaYkp0eTNPL2NDYmVH?=
 =?utf-8?B?cnVCamVWQVI0SWVoNk8wT2xMRTFyNkljNHB1bmVPMWNTUmJpOXY4ekNjcGIz?=
 =?utf-8?B?akRSdS9sQXlwcnZjV3F1d0E0Q2o3bXJCbDZpOFJxcDVzZXY5US9OVHBwNkp3?=
 =?utf-8?B?Tk0vNndWczdHSTlKUG5uamhKTUhWQmFZVUpuNy9seVUySnJaMm52OXJiMVR4?=
 =?utf-8?B?UUhXa3F0S3NXcTZrSG93UG5QclhLeWk3UFV6aFVvMjBnZkk0YVg0MFJudkNU?=
 =?utf-8?B?RXU5S00vekRHTDNEVXVHRFBOWUhqU2YrRjNVRVE1T2VkaWM3Y1BPNzFnKzJs?=
 =?utf-8?B?K2x6ZzRvWGo1eVV3aDg3QVVMUVNnUGx0S2xXNkhvVyszaGxrR2wzQ0ZQM1pL?=
 =?utf-8?B?UHVpYXlaenkzamxXdXFQTTltUC8zMDF4WlFRQWY5dWJScHRIY0N4UnVQbEd2?=
 =?utf-8?B?bTlvNzNabCtJYnRPVWVXZGtHRzk2Vzg3MzFhRXc2RGdVNlJEd01NOFZwbHo0?=
 =?utf-8?B?RHh5MHRuV2hYTk1pc2lidVY0YTNyU0dnOXNGT1U3N0czL0pWc0dkN2UrTjQv?=
 =?utf-8?B?S2ZMQTkyZmxHeEV2aWhLKzllOUVWSEI3T0YvdDR1bVZNeUwwd2ZqRkFPWWtB?=
 =?utf-8?B?L2s4SDRiZVRnRGJGejVNRjZoMDlJZk9XcUZhZVduT2xZbFp2QXUxR2JmRGlq?=
 =?utf-8?B?dlNrWURoaUxPUFlpQ2kyMUh6ZWprVjFmdlplQm5GNy9yWThVQVRRZThxNnl3?=
 =?utf-8?B?K3lTS3FjWHA0TUhGUlhza2Q2SHoyMllSTHZRelA5UEcrOWxCcGl2VzV4cVM3?=
 =?utf-8?B?MGhjeFNpQWo1L1dvZVZGK0lmRkUvR0ZQYWhtckxUcVRUNVQwZGJsVy9LZUFx?=
 =?utf-8?B?VHdrK0xYaitJNFB0UnRKZ2liSG45Ly9wakp6T1hQZDFMUEgyb0VUZks5VlFz?=
 =?utf-8?B?U3pIYzlabEtNQ1U1RVo1TndvS0RLYnB2YTFmMlduQ0dlcjlockl3czM2S0dQ?=
 =?utf-8?B?akh4bFNmWExuTWRSbTFsc0IvNi9kbTlEK1FRajFQOGhzMHNJZnlvQ3VmWGVr?=
 =?utf-8?B?RnVsOVhsOVl4OXZiRjIyK3kzU0pwcU9ONmFsMStEempGdStaamdFemh1WC9F?=
 =?utf-8?B?UUszZy9uYnNZemFzRkdFaFJSd0pzZ0dONnZjZFFtL3ZtNWFzVEJacFNUWnVQ?=
 =?utf-8?B?MHNKeTZuU3ZRS0RXNytxWnBZQjdKWHRTNVpTRWxzbFNJeG13S1ZxTXVha0tF?=
 =?utf-8?B?QjZiQ1hYK2xZK21sd2MyVUhQVVNwMW1welRXM1BObDFpN3JwcDlWZFpXZE40?=
 =?utf-8?B?U201eXNVZndIZm44OGlzakxSZlo1Nnh2MFl6TXZpRXd3U3ZnNEVwNVdFays3?=
 =?utf-8?B?TXpObXVSelpnS3BoZkpRbFRpRlFEVEVCRmFhWnVoakVCall1OFBWRzZTZGQy?=
 =?utf-8?Q?eAyfGjnvbX5dbO4bGTXC+nY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzEzMVVhWHhPVzVPT2pKaFBPdUhWVlppeDd6SWxRcnVNd2R5S0pLNUJwZkpU?=
 =?utf-8?B?RDN2OXdtNEhYOTBkTnZFRVlCZXJxeEpGbmRjNVdBcEFIMGdaOGxJMjJXbEJo?=
 =?utf-8?B?OUdyZmV2V2g3dFAyMzM1Q1VVeHI2S2F5NXpnSUJSUFA4Q1NoY0lvUFdObFRo?=
 =?utf-8?B?bzhyanhuRWQ1SGN1RVRheCtRMy9vWWV3SDNJbEV3Mm42S0hEUFZ4M2FRZmhR?=
 =?utf-8?B?dDE5TWx5NitPVjIzOVE4NVhxMWh0OUQybFhvSTR2Ry9wTzdrRUI3YjRuNEdY?=
 =?utf-8?B?S2hvN0Q0clJxR3poZmpmY2pWSGZBK0k4T3IrZjBOSURoNEgzODdLcFdIMmd5?=
 =?utf-8?B?UVNRWFczQXUvbTZMcWlrenB3enc0Q1ZGSHpiOFRnRkwvNFpnTTlwVnd3TXMv?=
 =?utf-8?B?MEtzTC82T2RJMEJrZk5ZSFkvWkFNSmdGMmhjeGlVUHZlcEozQnR4anNVMHlr?=
 =?utf-8?B?WVVyRlhUN0liUkRQT0N4ZHZ6di84UHpCZlpoOXZmbUt3emNQeWllVGhaVHRn?=
 =?utf-8?B?dlc0OHFmcWd4SnRwVFVwM2VZUDczeWh6cjZITWw4OVRNdThrQkhJMC9CZWlo?=
 =?utf-8?B?SWlTOG1udGpvQ1c3ZXdKM0FrTm9xSWdlcExMTVZsaTNSQ3FlVFVaczZ3UWtF?=
 =?utf-8?B?cW5DKzZrZlRDcm53ZThzTGdCN2ppK1Q2MGdVZlF3TE43VjVYMHA5UEYySXE3?=
 =?utf-8?B?SWUzdEdrdmEyN1JRTURndWlFSjdwdzlyK0NVdTc3VjJTVS9pVWcyT3ZMUjI1?=
 =?utf-8?B?Tk1nakxnUnhZbmVhYzVvTzExWTliRlVxMlVQcXRBVGNqOGh4V05sZDU4emNW?=
 =?utf-8?B?eUhGQnkxa3BuMXVFUnpXeVpLc0hqT0RDMzJSWjVXZ25ia1VEamEzWGlGKzBP?=
 =?utf-8?B?ZmhIZ29TRTNQVnpDZi95Y1BTVHpNYUhGV000ZjdGWmdkTVRZcFQrcE5EaHRn?=
 =?utf-8?B?Q1VGZjJTckpPTkJMcmtCR2hTNGFmbXprODI2MUIraGpGS0xFZ0ZVTVZRZXcw?=
 =?utf-8?B?R1BaVnNwSkZxdlVuT1krdndiOXhXeXkwb2FVUHdFdXBKTk1lSXVFQ0hQb2p1?=
 =?utf-8?B?aTkxZ1dHK3pWVkFaWmNyV0d3YWZkeXF1T1ROakl0VWl3WWxKazJEeUxvSytK?=
 =?utf-8?B?NFJsWTg0M2EwdERqcmV2SHhPQTlIOVl6R1RhWDMzTzZvKzE4eDhJQUZBRkda?=
 =?utf-8?B?WnlYemc3aVlqT0lKQVlLckR3alp1WGFUcnFNWkNMQkREWlU2bWpGb2NjcXlO?=
 =?utf-8?B?ZklOVzIwclBQT3dwbVpXcTdZcXZMUWtQRk8yelpDZHhlVVFYdEhGcms0SkRP?=
 =?utf-8?B?Y0FyMVlrUTd3ZTB6ajJHSitldXJ2cWFDcHJSMjRrQk1NMUwzSnZVbWNndnNp?=
 =?utf-8?B?N29PemY0c0k2RUEwdWFyQW5lQ3ZyamVjenNIWVU0U0E2cGo3WHlHUXM2Q2xl?=
 =?utf-8?B?QkphOHRIK0I1OGFVa2ZuY0wyS3JGQ2tyTU03MitYbmJxeTF5R2NoU1VQa2w0?=
 =?utf-8?B?Ly82Ymk1YUhUTVlFNUdqS01KVEFBZTZLbGVPOVQrTlY2SE92RGxjVzYxbmFY?=
 =?utf-8?B?azl6bVl3OG81ZzVHaEwxcjEyeml1dWpUaWFheDVkRFlrSndwVFNxWERHTnBL?=
 =?utf-8?B?SWJjcmNIdkhQQS91czJnNzZuVndmNVBsZDF5dVNqTE8rajhFTm1Qb0dFNVpy?=
 =?utf-8?B?VlphNjg5cTlGREtJTTRFYVl1VUJ6b1pCV1dLRndneDJJWXQ2bjFuUGVjQnpS?=
 =?utf-8?B?akVSdm5CSFFNSUFJakhhTHJkR0xpUjBMNTRrWGNuOXRsdG1Qd0xRcUFRcHM4?=
 =?utf-8?B?VmxiMEJiOUdMOTRHYkhucFY3NzdQZnZVNUhUSHBpT2llbXRrVjk4RUh5QTBW?=
 =?utf-8?B?Ni9qNno4dzlDTWE5SDJSeFhwMTZLVXdmZ1hRYllNVE9hUTdJSlNyTVpudHRP?=
 =?utf-8?B?WUt0eTh5OWpaQ2xtYXZhVllkZWh2N21YbThNMXhlcVNMeENXbk9FcFladU15?=
 =?utf-8?B?TmprdThHZ3c0MlpDMG9rOXlubWpaeTlOREtoOG1SNUJzZnVwOXBaR3NTTEtC?=
 =?utf-8?B?WDNKOUhEczJoaUZBQnY2R0xSeHQ4d1J5VVBlTkJSV0cyaG11SHgwS1RTaTVz?=
 =?utf-8?B?NDkydTQ5SHFldmFld0lIY1lYZWFscjNML0d0R29qMjduUHJHdmJrclNCWDUx?=
 =?utf-8?B?UFREY3A2ZElrY3JHM0k5WlZ3czhyMllLaHZDbGp3UEpSQ3gySitKL0ZoS2g3?=
 =?utf-8?B?dmFzUklJVFAyMS80OGdGZHpQVlQ3WDNSNlJjOGF2dmFRbnZmbE1RZVA3QVFU?=
 =?utf-8?B?NkdQRXYzbTFqNVBVTFhyek92UFk0OW9odk1QYk9YTFR2SzhMYktmQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fc3dde-bf77-40bb-38a3-08de5906f5a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 16:05:55.8457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LVfdozZwgz3BqiaVtdfaUDkOMQXmZbkz1vMyaSfqZbIa5c6hba1V7dRWi5fKKc/pAo4AIKtolJozMlfosadPiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9157
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgMTE6MDIgUE0gQWxleGFuZGVyIFVzeXNraW4gd3JvdGU6DQo+
ID4gU3ViamVjdDogW1BBVENIIHY0IDMvM10gZHJtL3hlL252bTogRGVmZXIgeGUtPm52bSBhc3Np
Z25tZW50IHVudGlsDQo+ID4gaW5pdCBzdWNjZWVkcw0KPiA+DQo+ID4gQWxsb2NhdGUgYW5kIGlu
aXRpYWxpemUgdGhlIE5WTSBzdHJ1Y3R1cmUgdXNpbmcgYSBsb2NhbCBwb2ludGVyIGFuZA0KPiA+
IGFzc2lnbiBpdCB0byB4ZS0+bnZtIG9ubHkgYWZ0ZXIgYWxsIGluaXRpYWxpemF0aW9uIHN0ZXBz
IHN1Y2NlZWQuDQo+ID4NCj4gPiBUaGlzIGF2b2lkcyBleHBvc2luZyBhIHBhcnRpYWxseSBpbml0
aWFsaXplZCB4ZS0+bnZtIGFuZCByZW1vdmVzIHRoZQ0KPiA+IG5lZWQgdG8gZXhwbGljaXRseSBj
bGVhciB4ZS0+bnZtIG9uIGVycm9yIHBhdGhzLCBzaW1wbGlmeWluZyBlcnJvcg0KPiA+IGhhbmRs
aW5nIGFuZCBtYWtpbmcgdGhlIGxpZmV0aW1lIHJ1bGVzIGNsZWFyZXIuDQo+ID4NCj4gPiBDYzog
QWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4NCj4gPiBDYzog
Um9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IENjOiBCcmlhbiBOZ3V5
ZW4gPGJyaWFuMy5uZ3V5ZW5AaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVu
ZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfbnZtLmMgfCAxMCArKysrLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX252bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX252bS5jDQo+
ID4gaW5kZXggNmY5ZGQ1MTkzNzFjLi5iYzg4ODA0ZGU1MTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX252bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X252bS5jDQo+ID4gQEAgLTEzMywxMiArMTMzLDEwIEBAIGludCB4ZV9udm1faW5pdChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSkNCj4gPiAgCWlmIChXQVJOX09OKHhlLT5udm0pKQ0KPiA+ICAJCXJldHVy
biAtRUZBVUxUOw0KPiA+DQo+ID4gLQl4ZS0+bnZtID0ga3phbGxvYyhzaXplb2YoKm52bSksIEdG
UF9LRVJORUwpOw0KPiA+IC0JaWYgKCF4ZS0+bnZtKQ0KPiA+ICsJbnZtID0ga3phbGxvYyhzaXpl
b2YoKm52bSksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFudm0pDQo+ID4gIAkJcmV0dXJuIC1F
Tk9NRU07DQo+ID4NCj4gPiAtCW52bSA9IHhlLT5udm07DQo+ID4gLQ0KPiA+ICAJbnZtLT53cml0
YWJsZV9vdmVycmlkZSA9IHhlX252bV93cml0YWJsZV9vdmVycmlkZSh4ZSk7DQo+ID4gIAludm0t
Pm5vbl9wb3N0ZWRfZXJhc2UgPSB4ZV9udm1fbm9uX3Bvc3RlZF9lcmFzZSh4ZSk7DQo+ID4gIAlu
dm0tPmJhci5wYXJlbnQgPSAmcGRldi0+cmVzb3VyY2VbMF07IEBAIC0xNjUsNyArMTYzLDYgQEAg
aW50DQo+ID4geGVfbnZtX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gIAlpZiAocmV0
KSB7DQo+ID4gIAkJZHJtX2VycigmeGUtPmRybSwgInhlLW52bSBhdXggaW5pdCBmYWlsZWQgJWRc
biIsIHJldCk7DQo+ID4gIAkJa2ZyZWUobnZtKTsNCj4gPiAtCQl4ZS0+bnZtID0gTlVMTDsNCj4g
PiAgCQlyZXR1cm4gcmV0Ow0KPiA+ICAJfQ0KPiA+DQo+ID4gQEAgLTE3Myw4ICsxNzAsOSBAQCBp
bnQgeGVfbnZtX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gIAlpZiAocmV0KSB7DQo+
ID4gIAkJZHJtX2VycigmeGUtPmRybSwgInhlLW52bSBhdXggYWRkIGZhaWxlZCAlZFxuIiwgcmV0
KTsNCj4gPiAgCQlhdXhpbGlhcnlfZGV2aWNlX3VuaW5pdChhdXhfZGV2KTsNCj4gDQo+IGtmcmVl
KG52bSk7DQo+IGFzIGl0IGlzIHVubWFuYWdlZCBoZXJlDQoNCk5vLiBudm0gd2lsbCBiZSBmcmVl
ZCBieSB4ZV9udm1fcmVsZWFzZV9kZXYoKSwgd2hpY2ggZG9lcyBub3QgcmVseSBvbiB0aGUgeGUt
Pm52bSBzdHJ1Y3R1cmUuDQpJcyBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3Q/DQpUaGFua3MuDQoN
ClNodWljaGVuZw0KDQo+IA0KPiBBbmQgYmV0dGVyIHRvIHVzZSBfX2ZyZWUgY29uc3RydWN0IGZv
ciBhdXRvLWZyZWUgb24gZmFpbHVyZQ0KPiANCj4gLSAtDQo+IFRoYW5rcywNCj4gU2FzaGENCj4g
DQo+IA0KPiANCj4gPiAtCQl4ZS0+bnZtID0gTlVMTDsNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+
ICAJfQ0KPiA+ICsNCj4gPiArCXhlLT5udm0gPSBudm07DQo+ID4gIAlyZXR1cm4gZGV2bV9hZGRf
YWN0aW9uX29yX3Jlc2V0KHhlLT5kcm0uZGV2LCB4ZV9udm1fZmluaSwgeGUpOw0KPiA+ICB9DQo+
ID4gLS0NCj4gPiAyLjUwLjENCg0K
