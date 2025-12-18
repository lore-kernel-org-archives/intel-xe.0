Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05E2D711C3
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652B710E070;
	Thu, 18 Dec 2025 21:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mE4mJSLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5415A10E070
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766091602; x=1797627602;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Kg3d93DQfMsFJk7aznrh52QeU13dvEoZ7ljdau9JVoc=;
 b=mE4mJSLn6T4ChfvS6IUFKhOO8w7/XkLuaZk3YJZ9IC/5lUjykGxG7QeS
 BJwUcrphu2TcwKrDwwOKefJQ8vhEM0Hk4XM0D5vnBVI+E46sX5mLVFtcH
 tVOBdqzWkmgTwkNL+4F1RIL9c8UzJJ4E7IUF0HE4b+wSfQfE6EdPzKIqb
 8+WxOUZB4PEu2B9UX1x224PJKZ9UU1sBlVo7H+iDvR5+ndRxxKHVQyWd1
 ttbawf4V2N2hxDWbhUKc5DEBA1mfK6iYdRED24gUyyYp7gZgvo0/kEGJm
 pEsJ0n1XNZeVZkJQdpBaqhGEBw1n3WIj/NsA2iPyDzGwT+/buUbuuE2tz w==;
X-CSE-ConnectionGUID: SIew4AnFQAaxLd65rPfRSw==
X-CSE-MsgGUID: ZhTcJW1ST7WVtrwLEEIvrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67053006"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67053006"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:00:02 -0800
X-CSE-ConnectionGUID: HH2N56+MR7uqHzhCVih5OA==
X-CSE-MsgGUID: dsYyA1OdStqx7eWt6APFeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198694659"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:00:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:00:01 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 13:00:01 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:00:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXq3CkcOU26eBrctITrdEOBYcOJK9VLNnqiqnCinLfjc/C3W0zcuWkdmfUzCAx0iaaX+IjgF2NrsVKQgV7GxDeS1xSIiEc/MTuhR6ynZ7jlLVYQ/AiJ0IaNhi3m5gMJfQUKSyLC1AcQVfiPCVIL9ILaDdyYjgGbV1HqLkfR6bzRcVAMKTbaFIyqYqZvOSGg1HVEI4oG/K3/gliFksZcnBcls46rOIUwCEU+/eEdaYYzY9OG4yd57QQB4sYsMHhsmh8UvdPXaC2Cc86d283TOI0Bl/vLpKq3r31btZiy68D0LsYHYQGG+GqGBhPW24QkHKVqeAeRGAXIa1hPPvya9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kg3d93DQfMsFJk7aznrh52QeU13dvEoZ7ljdau9JVoc=;
 b=yM3IdDQ1QREMfgT1IOt2tCLbJc7oX+LeSBwY58t9tanjePnGVTERaie8jhCIEv8tL17sZDt5baexnhO4fwB3Bpd24/xML2Y+NrTWHbOhEsk/92C2uBQPdoNjcqFw+xkuBqU+v/70FBteiOD559jpjBGnlDuhpDnG7Tmp0bm4Hth5vKi7a07rOwZIYTl0VU7VfRd/WkAhZUMww0kWmmgO++Fh3LnpdLLCmhp9WFcYv8dCROuU+AYr8yw0vkkv9GRNov96UMYFI4F24r7X9k6POKnVeXTxWJ2ifeFVCVufxlf7ykPKHlRHkIBT4byqXGzSemKEJ2Ot7thbLI64lpIUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BY1PR11MB8054.namprd11.prod.outlook.com (2603:10b6:a03:52f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:59:58 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:59:58 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Gupta,
 Saurabhg" <saurabhg.gupta@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>
Subject: Re: [PATCH 0/6] drm/xe/xe_guc_ct: Prevent compiler read/write
 optimization breaks
Thread-Topic: [PATCH 0/6] drm/xe/xe_guc_ct: Prevent compiler read/write
 optimization breaks
Thread-Index: AQHccDQFrxsuFPHA8kebOwufowxQ27Un4h4A
Date: Thu, 18 Dec 2025 20:59:58 +0000
Message-ID: <0a49558774a7158ffa5c111bb237cbc54ce54d8b.camel@intel.com>
References: <20251218153527.6436-8-jonathan.cavitt@intel.com>
In-Reply-To: <20251218153527.6436-8-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BY1PR11MB8054:EE_
x-ms-office365-filtering-correlation-id: 33e073ce-f11c-4fd8-f576-08de3e786778
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N29ZMVc5RUUzSUVEcENseUxhai8zRURKREJpaC9qY3dLMEczLzlGVVp5bDRT?=
 =?utf-8?B?bFRoaUtJMEtWelBCTUlQZXhncWRUeE5WV2pWQVQrL2NUdlBOVy9sZ0RrM0hT?=
 =?utf-8?B?YzBQdjFxcUJrb3BNY2E2WHowUWRxa2ZuVEVZMjBOTnlvTU84WmxndXZ0Y1lx?=
 =?utf-8?B?VkR6dnA0ZHE3VEE2KzFBMFZRUlptaEVjUExNbFN5MnhVZTkzbWdjWWFlOUFq?=
 =?utf-8?B?SDVFWndEclRWaVV0NTBSZG5YWGt5azNlV2VUUEdYeVFjblMrVGw1Rnk2WVlU?=
 =?utf-8?B?WVpha1lEcFB1VlpXaERwY1BTY1IvZ0N3dFdiNzN4Y3NQeWdRK3pyYUFXQW5r?=
 =?utf-8?B?Mm1oY1hic3RtYzQ5Y2MvYUVtYW9RaWNmZkNiUDlYTEhQL1RDMVpEdTZNOVJv?=
 =?utf-8?B?WkYzN0M4K2lrbnBPS3Q2NmxuMjcwTmZIay9Da21ZQUhNTDZ3WDJBLzYrOXVL?=
 =?utf-8?B?cmwvSmNiWlptTW96MEpqTU1WMzh2cWRGRUNMR2NyOWdqVmRyYzZybFFoS1Uy?=
 =?utf-8?B?NUp3WHk0UUdlQlU2ZXE2ZGdwblI0elhIRTN3UHRjazBwM09SMi8yQ2gwbGFa?=
 =?utf-8?B?UWc1eTNvbDkrOTVjWkRaaFd6eDZ2aS9yaDdtMVFrb2FvU09xRm9PeDJmb2tT?=
 =?utf-8?B?R3JrWE1wOTVaTHVpWjVrdEY1YTVkYmtwSXZzdElaUTJBaFBrLyszVm1oSmtH?=
 =?utf-8?B?ZEVrUzNkYlhGR2tENkxsTlQrRkVPMit0b2VyRXRxS2NWcFNFUnNiRTdnZGJa?=
 =?utf-8?B?SWFTdUx1blRSRk9QdmtNWVMvN3N2OEpGWkl0S0xaSEs4eWJUUko1Z0c3MmVr?=
 =?utf-8?B?TXZ5NEhoZldhVkFreHRWZzQxOWNiTE5PU2RCeGxyS05yOVpiTWtnY0N0Qjk3?=
 =?utf-8?B?VmxrUHdHeEdhN2Rpa3lwNlFnN2lQSUVXZ0ZuY0kzcFdTNXozTVM3citjTkZ2?=
 =?utf-8?B?Yk5nMDFHZk9YT3RjOXJSVkNBMEY2dllmOVJnSEJZL3JTcjA3RmFHbVorLy9Z?=
 =?utf-8?B?TnJaVmttbzdiRVBMR1VPVWFDQ2MvZnR2OGJGdlpxcHNpVHlXT2VHdWI4a2g5?=
 =?utf-8?B?eDBPM2h6cjBGODc0ZlV1RFRONlZRSHlwTUVRcmQzQzF0ZzZKaG4zSUJJbFgy?=
 =?utf-8?B?cS85OCtTOWZVWGtiNzlmSkJVNDFWVWVKdlRmdks1T1M2cXRDMTZIQmJJVjNu?=
 =?utf-8?B?T2VnTU1tNHFYZVZzSTdqdm9hYUVodWJnMnE0V2YxY1J2Y3I5clhtTTlWaGk0?=
 =?utf-8?B?RXJFVU5DVzUrWVA0UDAvbkovSDV6dlczSVlpVmJYcS9pNW84NnNwcDBHNFpv?=
 =?utf-8?B?RXlVMTFFQjRQcS9ubThFcHVtN1VKY1FWNW1XTzhFM3RMbmxRMG02azBpYjlS?=
 =?utf-8?B?Y3FkMCtYalpZZk1zNDByOCswaUlodXhaV2tKMTIxMFVSdEZVNFVjeTR2Mk1z?=
 =?utf-8?B?TVZOb0NSNy9BRGFlR2k2aDFOMXhHeGNmMGozNlVNSllkRW9BSkp5c05Mb3pu?=
 =?utf-8?B?MCtsUmcxNTBoSzQvTDkrZFVYWDdYNlBiMXJMRUZyZTZ5NS9BNUI4K3hlaDFv?=
 =?utf-8?B?MlcrbFlkeTZ5NEhjOVZWK2JnTGJuQVJXeExMNllHa1B3QVBZZ2FaR01mMnVU?=
 =?utf-8?B?KzBZU2J0L3JwRHRLSTY1K1c5NjUzSXk0RTNLd096bGFOMUNURitVL29KQjlm?=
 =?utf-8?B?eitiZzhqd01rbnRjM05KMlltSTRTbC9FR09XOTNtL1JERFQ2V09ycmZicnZM?=
 =?utf-8?B?MXMrVTFPOGF5dkxJSUdTVTd3VGZNdzFkUXdhcDI5NkF1ek5pWlNzWWlLMWMx?=
 =?utf-8?B?WHU5a0tDRVBOczZOSjVYdjhiRVplZnJpNHk1QTk2Z0tFOFZGclFIbDlOWC9x?=
 =?utf-8?B?U1QzMnFJYjg0eld6SXJZWXlFZVVQc0czaXl4N3IrVy9wNnlNTU5ybDF2Zm05?=
 =?utf-8?B?aTloQ0JWNTBONUxMTUpWVDZxNUdUT1orQnBRN1U1eGxzWTUyRzhSRk9zcW9p?=
 =?utf-8?B?WDhNVlo3aUtQYnZuM0dFOXI4dlVuK3pmUnFJQVNPdlpwUFpBQ2xYZTZUZ0FD?=
 =?utf-8?Q?/o/dwX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eU8vcTVHVnVkbEMzUnhOTVc4aVgrdnFEUFFETDFrek9CRU85QjI4c2RUZGtH?=
 =?utf-8?B?RDkwZEc2Snp2Y0d0eHkvNGJvajlCT0Y5aGdRU1lLMjhqckpHTWlMZ21ZRFNq?=
 =?utf-8?B?bm93bkNkaHVhZ2RzYTJLY25rS3RzM0VGZk9QbGsrMm82WWliRkFxNnpZUzRG?=
 =?utf-8?B?VkFKVG93ODZ5VkdqRnFMWVBtaEg1ek1mWk5tNC9iQkM3UHpOcGZLNmNBMjJs?=
 =?utf-8?B?YmtRMTRrUFh2UVByM21oKzQvUnVDSGtEK0tWSHJ3OUl6dktYcXUwZTk0QUc2?=
 =?utf-8?B?bWlveDd2S0tQVU1TRWtBVUhDc1hlVi9JM3lUelo4UXBnc0FTMG9uRWxpSmJE?=
 =?utf-8?B?ZXVEYVpQZStQVXBQOURraTZ4bktKVGcxMXlzaVFoU0dJR3BJZncyM1FwZVBo?=
 =?utf-8?B?RFV3MURRZHhxUVNWVHk5ZjFyRnpOeExPVW9xUTVzOEZQbWZHNms2VGJQYU05?=
 =?utf-8?B?ZDhxdWVhKy9kcitWMkdkZTdnZzQvSVFZbEhZWHI2Tm9UUFBLcmhwMWhuMVp0?=
 =?utf-8?B?UUlwbDJkbDg0NlQzeFlQbTBwSjU3VUJ5dlFVVG9HYjhGZGZwY0d0VEJjRWZ1?=
 =?utf-8?B?Y0QzZlM0TEgxajdyT2gxSDRxRzRuOWVWdDA3MlhSaHcwL1d5UlBOU3Y2MnFR?=
 =?utf-8?B?bEVlNXRvRitPTXdJY1FIb2NrQVl6bDRyRWdTdkFOUnFHR2pJcGpqYlpWWlFw?=
 =?utf-8?B?V01QRnNTQ3VKSnVnTkV3RTJZeWwzU1hTdGVvSlE4MG8wYzRHZDZiVXNkWDRS?=
 =?utf-8?B?RDlubENac3I3Sk1WNE51TTBHZVRWTEJENS94eXRKTGkxMHVFMlJ5b3hEU2ZC?=
 =?utf-8?B?azR0KzlkTExHUTh6SEdZaTM1Z0RHYktreUxXWlZmcHVSVEZITjhGbVdncFlJ?=
 =?utf-8?B?MUNSNGFwV1JDZDJnZFg4MTI4YnZ6ZW4zRHFXTFlkOWNwTWtXUFlwUCtXQXdO?=
 =?utf-8?B?dlc5V05CdzBPdVMzeTBYSzRnRkVsK0pPUWhETk4xc2dvS0w0MTJJaEhWdXBK?=
 =?utf-8?B?TUpVTWduM0tpVjZvMDRJb3liWGZidEdoRUpsR25pOVUrakhpWWVHWDJ0VFFW?=
 =?utf-8?B?elNsOXBqTkxIRy9GTy90RVo3VFIyeG5KNlkvYVk3ZURUTXVwWUtteTV4NmVR?=
 =?utf-8?B?MUxGQVNaalFYY2ROQ0pGQ1RyQWRJL1B1TGZtb1FxVlRPTlJJUGY5aXZuYXJ6?=
 =?utf-8?B?Z0hubEptSDBhOVppbWdqUGZrRC9Fb1RUSllObEw5QWkwUTVwWVBlcTlFUXNH?=
 =?utf-8?B?amNscDhlWURNak43bnRyL2JVZjZycXRCL1lFaGZJUVhMVm0zd205cTdMSjAx?=
 =?utf-8?B?SDRKUWF5eTdwNUxnVGRiVDBNeVBzTCtuWmtUVHh0R01xRlk2NUtUenBjY2Fs?=
 =?utf-8?B?ZkxpYVBMY1ltdlArc0dtUWEvRTNmc1BOWGN4ZklyVUtzSmFXc2RibEdVSlIy?=
 =?utf-8?B?NnJ4NFhOTXl2WVdVYkRrMVppeUdnSEdZNnJnUXZvenAvbkJmMThhcllncW9j?=
 =?utf-8?B?cDN2UEl3N3JCcjBvWGJvSDk5N1BiZEFaZmZrb01SRkx6NWZXUmpQV09DTjlM?=
 =?utf-8?B?eDU4MjYxem9WZUxhalpSWnV4am9oK2VmSWhtNW9KT2xmMXB1b2ZGbC95bkNl?=
 =?utf-8?B?b21UL2tLWUZoczJibWRRWmZleElwclM3MGNqTHRnOXRaNDZBaWd2Tjc3UitX?=
 =?utf-8?B?UXdVOFZxUUpBU3FhVzVvWk9rNGdEZXhISytFMFJhb1BNVHJLZnZzOEQrcmpR?=
 =?utf-8?B?MmJXOHdKNzdVcnZPVFZZUkZDS3oyRVJMZDJGQktxV2gzY2FPV0xtWjV6bDE2?=
 =?utf-8?B?MG12MWpBcUk5b3dQUXRXZ3hnTHo4TUcrK1ZkNXFIdzBDZlU2T2JtRFJURTZt?=
 =?utf-8?B?bUwwbTk2VFBubGlqYTFmWGUreDg5SlNwTWpIRGFPUnBIWlRRaWZWMVUwdXYr?=
 =?utf-8?B?NWliWkJSN3pwZGxSMHBuRkx0QjB4YUhWVGFiOFNTVDNVYmZFUHFrYjE2QUhv?=
 =?utf-8?B?YjJJRTgxWEpGR200RndZdk9VL1lzVEpuYUxnTW5RYnhSK281dHhYajBENHU0?=
 =?utf-8?B?Rk9vanpkWHQyejU5ZjRGZkF3RE15UWlJVG5KejNPcy9ZdHVhaXhOVmhGQzFS?=
 =?utf-8?B?SWM5T3ZENElKY3FJcml3MTE3MnNld3lDOUluTmMxTDUwMmQ2VWZkUVgrNXdh?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCDCE5212528A645B4F5FB4409783126@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e073ce-f11c-4fd8-f576-08de3e786778
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 20:59:58.5935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LsQ+a8ePBt7CzLPcAxnBvT3qz+OHd5taOU6LmRRjPZ/2lVvAbS8DcUzA9iB2LdCSCLX08acxnN6/pCiSeiGSQbwk2Uf5hDeiGX2sbFMh7D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8054
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

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDE1OjM1ICswMDAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
DQo+IFVzZSBSRUFEX09OQ0UgYW5kIFdSSVRFX09OQ0Ugd2hlbiBvcGVyYXRpbmcgb24gY3QtPnN0
YXRlIGFuZCB0aGUNCj4gZzJoX2ZlbmNlLT5kb25lIHZhbHVlcyB0byBwcmV2ZW50IHRoZSBjb21w
aWxlciBmcm9tIGlnbm9yaW5nIHRoZXNlDQo+IG5lY2Vzc2FyeSBvcGVyYXRpb25zLg0KPiANCj4g
djI6IChNYXR0IEJyb3N0KQ0KPiAtIEFkZCBGaXhlcyB0YWdzDQo+IC0gQWRkIGNvbW1lbnRzDQo+
IA0KPiB2MzoNCj4gLSBTcGxpdCBpbnRvIG11bHRpcGxlIHBhdGNoZXMgKFJvZHJpZ28gVml2aSkN
Cg0KSXMgdGhlcmUgYSByZWFzb24gd2UgYXJlbid0IGNvbWJpbmluZyB0aGUgbGlrZS1wYXJhbWV0
ZXJzIGF0IGxlYXN0IGludG8NCmEgc2luZ2xlIHBhdGNoPyBJdCBkb2Vzbid0IGxvb2sgcmlnaHQg
c3BsaXR0aW5nIHRoZSBSRUFEUyBhbmQgV1JJVEVTDQppbnRvIHNlcGFyYXRlIG9uZXMuDQoNClRo
YW5rcywNClN0dWFydA0KDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRo
ZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBTdWdnZXN0ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmln
by52aXZpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25h
dGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFu
aWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmln
by52aXZpQGludGVsLmNvbT4NCj4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6
a29AaW50ZWwuY29tPg0KPiANCj4gSm9uYXRoYW4gQ2F2aXR0ICg2KToNCj4gwqAgZHJtL3hlL3hl
X2d1Y19jdDogV1JJVEVfT05DRSBnMmhfZmVuY2UgZG9uZSBpbiBnMmhfZmVuY2VfY2FuY2VsDQo+
IMKgIGRybS94ZS94ZV9ndWNfY3Q6IFdSSVRFX09OQ0UgZzJoX2ZlbmNlIGRvbmUgaW4gcGFyc2Vf
ZzJoX3Jlc3BvbnNlDQo+IMKgIGRybS94ZS94ZV9ndWNfY3Q6IFdSSVRFX09OQ0UgY3Qgc3RhdGUg
aW4gZ3VjX2N0X2NoYW5nZV9zdGF0ZQ0KPiDCoCBkcm0veGUveGVfZ3VjX2N0OiBSRUFEX09OQ0Ug
Y3Qgc3RhdGUgaW4geGVfZ3VjX2N0X2luaXRpYWxpemVkDQo+IMKgIGRybS94ZS94ZV9ndWNfY3Q6
IFJFQURfT05DRSBjdCBzdGF0ZSBpbiB4ZV9ndWNfY3RfZW5hYmxlZA0KPiDCoCBkcm0veGUveGVf
Z3VjX2N0OiBKdXN0aWZ5IFdSSVRFX09OQ0UvUkVBRF9PTkNFIHVzYWdlDQo+IA0KPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYyB8IDE0ICsrKysrKysrKysrLS0tDQo+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5oIHzCoCA2ICsrKystLQ0KPiDCoDIgZmlsZXMgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQoNCg==
