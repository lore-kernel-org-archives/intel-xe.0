Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120EBCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 21:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C692D10E4F9;
	Mon, 13 Oct 2025 21:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcCiMHl8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AE410E4F9
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 21:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760392164; x=1791928164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G3Eh9oqWpMsuTEr6fTRGX3N5g1KcJzTyPaOLiyLPkF8=;
 b=mcCiMHl8+rLX36NpFwxBd5qICg/oKV2acOF+0MRHVEyUdVISubwGU2d5
 SSFXenTLC3rGnPETTisKLELHGqdnxpaplSDneS8HOx25Eg5aJzeWJ12ZG
 D3lFDc5ESJsyAFALxiaLk+C4YEzJufARvGuZVdkUcfXXlUAgrvIR2+6Tj
 PQFD4Sjmwoovg/wu0vuI0WhyFM7poZPiEOKe6L7iSdYK1b9P3Nudg36Ey
 L5psihLCRVFPEO5/fZ3sXHpG6SYoipQyFz/Uz8TUYAcfPn1WntdSpUHS6
 Tshhr2RUAVPYFSgSPlYCpCix93OB1wvplTYK5+z5rS+wGSwzT1xBTJtGw Q==;
X-CSE-ConnectionGUID: pMXaRyEpRQGQcqzdfuMILg==
X-CSE-MsgGUID: vHm29krCSluJ8x/mzhe5lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80181736"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="80181736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:49:20 -0700
X-CSE-ConnectionGUID: 6poRrBksQxGaHhB1ltPStA==
X-CSE-MsgGUID: BO6Ex9IsQtK+KxB3o8mnsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180862798"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:49:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:49:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 14:49:19 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:49:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5e4hR9uERhz8TO+rqR545adRVROP4yOGHbXNp8k8qWnAqecJfDa9Cv+++gdE/DW6f7BfwD/oC2nAIMUXabp/QC3VSISSjJl+i1gj8JslfHaKIAPaHogWBXkN8XWdnbjDzjW09ACSaGasdjZt7AzMoXyBH6BpcfkQ6yAx7DcRt232RLJXLheZjz+BOkm9tnTLb3/U+QeEShUnsRTxiB6M6Ty5lhx4+M9G6s/hHIfvvjZu/src74iweWAyBtJupOxOc+rjKAbo4I+rU5dU2+zZUU8u34m/rdfOHs66UoltHD9bHDRNBm3klzblXgx0m5pKekZP0DVQhmeH3ihWhYCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3Eh9oqWpMsuTEr6fTRGX3N5g1KcJzTyPaOLiyLPkF8=;
 b=khLXT3gnooyI3KmM3Y4IcGg6DyeRmxxbkQmx7jFqxF3RWuBY5lW1j4gUBvNq7SGsBsS9zcxDUxM6re9YmhQTLQqSKqZTrzPHaQdgpuhsKeZIIRNt4l6EX3aeb7xevB6wmicPXGcCzHYPdtRE4avU8n/locYmGFm/0Nkmu6x9Lp/5LKqfg4e1Ic2+38F0nE7+mwISfdLJl2xmRkFEiXXPi5maUNXCSohKnoDFmGzq47b+ci7mc1QGUvdg7e6dUjSjzFDOzMGQdPcr8X41tCtAKirpbUm3IAAGsfJFgeCLK4UPldOuU6gnTEePpruy1ZNozPJBiF7swFQ7rtx/9B89LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH0PR11MB8215.namprd11.prod.outlook.com (2603:10b6:610:182::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 21:49:17 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 21:49:17 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: Don't block messages to the GPU scheduler
Thread-Topic: [PATCH 6/7] drm/xe: Don't block messages to the GPU scheduler
Thread-Index: AQHcPF371ZmVGh4OnE+kD6NCwCmWbbTAS/GAgAAF9YCAAAO5AIAAAiOAgABF8YA=
Date: Mon, 13 Oct 2025 21:49:17 +0000
Message-ID: <b00e97f7b4fc1ec5bb2d80b07bf7a03f2ce1d9d8.camel@intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
 <20251013162504.7768-7-stuart.summers@intel.com>
 <aO0vRcrh+vYm8JbN@lstrano-desk.jf.intel.com>
 <69295444f047934f6f8a711b939bf1306dce0416.camel@intel.com>
 <aO03ZANSaEfzOo1w@lstrano-desk.jf.intel.com>
 <a31742e0f4246746954e30e513ba4dde0c099741.camel@intel.com>
In-Reply-To: <a31742e0f4246746954e30e513ba4dde0c099741.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH0PR11MB8215:EE_
x-ms-office365-filtering-correlation-id: 657d8a41-e6fe-46f8-47d1-08de0aa25b9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Ym9pcEwwUVhDcXN3bDZYa2hJZENHWDBtMmlYM2NNQmpDbzdNdU9FQzRrakpD?=
 =?utf-8?B?aVhwdkJTRzhoaWMwejNweTg3bXFoa1d1RWNXVGVpUUZManBYaXhXNlBPWnpM?=
 =?utf-8?B?bkpuQ3NOazdRUUk1VnlqaXg4amNOSkZRZnJSZVM3Zm9KcUU4eWYvbGVDcjVZ?=
 =?utf-8?B?aWJjZFUyWGNwS3ZlY0ZhVFpaYm1QQVNQbU8rendGNGpRZDdQN2lqUE4zTTR1?=
 =?utf-8?B?UTBubXVNellBUXVjN2tBNEk1bklrdmw0Z0xHR1h5aTZLbVRvM0ZuY1JJNTc2?=
 =?utf-8?B?MFZ5bkFRZi9FVW5uUUVlMVBvZzRYQkJkb3JackJZOEhpVDNmU0VSczFFV1Y1?=
 =?utf-8?B?TjFXdkZuZmdwY3ZmSDQxMkgxK29zcjNUenFCaWxqa2ZOL3JtcG56a3ZMMXZ1?=
 =?utf-8?B?WStwLytlN3lCQ0FPbE5BSmtCNUFyd29zemxIU2dQS2Z6UHJMN1ZjWVBhTDRS?=
 =?utf-8?B?bzRXNDMyVWtnalR3MkpHRytjd2xzSnphV0tNa1RVZmNPN2ZjYWpTak41ekhz?=
 =?utf-8?B?S21YS2ZPT3dxOFR3V3BHenNjZi8xSHBJWEltY1kwWU5CMkJCWlQ2Q1JlL3RZ?=
 =?utf-8?B?SVBPS3FUV1NvU3RENE1hUCsxTElaQWFCSkV3NmhVVlA5TXd2TUZINmtwVlVk?=
 =?utf-8?B?cXA2TXhGSGkvam94TUpmemFhTkEybHdGMmpzUlY2NVdmSVFMVmJaRTZiVmpy?=
 =?utf-8?B?QlRnWGgySlJPNDM5ZzJvTTdsWXZwWFVvb1lUcjdVZmcraFBJVlBRL0xhb3Jz?=
 =?utf-8?B?UGJLajhacFB0aUt2MnN2VWM0V2llQlZQeUpDdHV4UExzUTJvem5Lblk5Zk0v?=
 =?utf-8?B?ZHE5aHYrWjc0emFpZzlrNTlzdjBNTlRVdU00cTZiNlo5QnZtR1V1NWd4cVNY?=
 =?utf-8?B?WmN2YlA3ZTNENVoxSzhXSkFRKzBKVVRXbXNVcWVxQlQySW4rT1E5N1luT0tD?=
 =?utf-8?B?eU1UcGhLSHc5WUduUXFyYnVvVWE2TXNMb3ZUaWEvMFd1SnB0aEt0ZE9uSXJi?=
 =?utf-8?B?TXdHMmR5Sk9yTU1GbGY1RGxFdk5SMk1VKzB2SDkxWFplVVB2VVBkUmFpeUM3?=
 =?utf-8?B?Q3orOUlmK3pab2lNN3FvOXZrdytRTnpzemswd21oUFpNa25IdXhCR0hzOW4z?=
 =?utf-8?B?elJwSFZhZTREU0lHa2pnZjFONC9VcjB3YmU3UmFLMkZSaERDNUtRQjdNYXVm?=
 =?utf-8?B?ME9UR0orbVJwWjg5OXJMejZObVNPR2xnVjZXZDhFTVdXNjFjd2Y4UlBsT2Vq?=
 =?utf-8?B?dGhHdngzRnNPY00zeG5xV0VmZmsvYnZ1SVgwSmhtL0RMcGgvTnhiU1NsOHNB?=
 =?utf-8?B?Q25uRlhmRTh1ZEs1VmZhNjZGZytrZEZBRVBqUnE5dzVPWXB0T2pwNHlEd1Vw?=
 =?utf-8?B?OE5QN2M3TlB6WTF4REROVDhzK045cXZEbGk0RFIzM0hmcjd3anNmcklHTnJO?=
 =?utf-8?B?Tm9IZDgyKzZ1Wm1LMHpQTHRNMjNEKzNkMFlSM2dtVzUvTWRvcWpudGVIZ0hp?=
 =?utf-8?B?TmlZZUJVVW5TL1VLR0h2NE5ySlR2U3FjUXRGRVdzSUJac1QyaVhRWklPbGVm?=
 =?utf-8?B?MDBEYVNSVHI3TlkwKytYVXhFK2ZianczREI3VWJ1eGRaaGh6cStaMGpxQUpu?=
 =?utf-8?B?blVuTTRyQ3lUVm5yMXBkMlJWYU84VUlDMEZpYXIzczB6YTlvQ1pQVlE2bUtU?=
 =?utf-8?B?ZEV3ZzlSenpUbm1nN21iMXE2bTNrUk9sVlZqUDhIVmV5YjAwd0JsSWx5OHZv?=
 =?utf-8?B?dHJHRUdZbHRWQytuREx4VG4wdnhqUDdjL28rWG1nczE2Nk1Cd0gySlJYNUx3?=
 =?utf-8?B?SEVpM3RqRHBTR2xEQU1wdzJzQUdtREpGWndQaVJYZ1I3ODM3RXRxajloRFpQ?=
 =?utf-8?B?U09ZMER3VW90UnBpTzgyRjNKVDU0Ym5jWkNXck05eEI1V2tBTWF5RitFeWZi?=
 =?utf-8?B?NFowaU1hcWgzOW0yQWdhYWczNzdKVXNlOVhQblVaYTVZMXNGYm9nWUc0V0FB?=
 =?utf-8?B?ZnhUaUZJQ1FnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVFmMWdkUFR5R2IzWC9KRXpvTEFSTHMzd0VlWGxFdHpoRUVGWXZyNEIreUtZ?=
 =?utf-8?B?cVFKbThXNVhoUVIzNDAxc1VIY0pwNnhRMzVhM1ZXcWdpTEdObWhWSUZNRnky?=
 =?utf-8?B?NDRsMmpHQkQ4bDJ0a1dkZ09mUldxbkVpbTFyQ3lIcUJyMlYreVJMV1J2cDRG?=
 =?utf-8?B?MVhnK01FMGx5R2liZGhJM3BBaXkwWmltSExXb0dhY2NESEpXNCtrMnBXWkVh?=
 =?utf-8?B?VFpBWjNmMURRaU5aTTFHd0RMQ09tYVZUeXcrL29rSm5leGdId21lN2Y2czc4?=
 =?utf-8?B?blpkZEF3MHZYQ3QyeUliVnU0TGVCdTVWTnVkWGdyQWpiKzIwcFAzcXQ2V3M5?=
 =?utf-8?B?U2RzcXd6TGc1K2lvSWhER3pTVWJTMHN3ODUrU3laMTlnbUVSeXNndmsweEdH?=
 =?utf-8?B?Z1I0aU5TMmZZTWs2ZVpBOXVLZjU1Rzlzc1RlTmtxOGVOeUNIMnFoL1RGNlBH?=
 =?utf-8?B?Z1V5Ym84UTlKVU5nS2Vnb3huWGFjMzN6QndEZTB4M0lzYjNjUWhlRFhaQ0FJ?=
 =?utf-8?B?dndEZnN0V2xQYXVkbkdQWFJvc2c5K3VNV3JKTGh3anhKZUg1RFNJbjVLa25p?=
 =?utf-8?B?Y0FvYW9oVk1MNUZjMGxZSjM3TW5NeWcvUXBwU0Q0K1ROUkJ5b1B6VlpNNGVV?=
 =?utf-8?B?TlpiRW5GdWo0VHN3UHF5WjFrN3NrZEpsMi9rWlNFV00wRnJESDk2czJKNkRn?=
 =?utf-8?B?WGp6Z2pBTWJRYW93L1luZjdHeStXR1RmN2ZiSG5GdXZ2ZmNVWStPcXlyd2Qz?=
 =?utf-8?B?UGtxL1hyUWxJaDJRbklHaENUdmRubVdXUDlLdStDeXY3VVBrR1dUVVB5T0tu?=
 =?utf-8?B?QzFoL1l3L2Q2MzM3aXhBQW1EY2kzN2p2ek5Oc25SQ0xPRlNIMU9uQlh5OGJN?=
 =?utf-8?B?UkQybmNqbzhmVEtsb3dSd05rbC9rNkw5dXBleDBpcW4xNXBJUEx4TU1JN3JY?=
 =?utf-8?B?YWg2b2l2K0V4K215WTB4SFpBeXBON3lhME1STDRnS0FGd2c5dndGTHAwZ0VP?=
 =?utf-8?B?Kys0Vlg2cE5rbzA5blhUcU92c0ttZzB4NXZPUjN3L3M3UDV0eFVOYmVLRHRF?=
 =?utf-8?B?alljT1BmQjE1aTd5cWFBU3ZsUkcrbk1lODlMd3JnMlBnazh6NUZxUi9aZ2RV?=
 =?utf-8?B?aVgxbUF0VmR6N1BValJYMnArWFFKR2J6RVV3M3NJNFFjeTZ5YUU2RDh4NDhJ?=
 =?utf-8?B?dUpqVmxFVUszaXZjTlI4ZFNyNHIzWlBtaER6K2RxQ0ZVaXpwLzhlODk2QUs1?=
 =?utf-8?B?bEJPVEdnb1dydTc3MGVuVS80NUhHVGo2dWRnVTRvcVlRTjB0Q0Z4SURJZysv?=
 =?utf-8?B?d2E3NmZScjU1UDJjWHhsV3ZTTFZPN25QV3NHblBRclZtbFNxTmRQb3VDZFIw?=
 =?utf-8?B?UE80QVpWc1BUT2h5dXBtbUpScFJvQ3dPZ0pleCtJYzREMUhUa2RNVk9QWlVU?=
 =?utf-8?B?SHYwT0xOSkJtanZCUEtZRVJPMGx1RmNjRCtUclJqQ1VmcGx5S1dDUUZSZDdQ?=
 =?utf-8?B?blJpUGpQZ3NPazcxWUdCd1U0eHhpaDBvcndHRjE1aFUyWDNEelhFZVFISjZM?=
 =?utf-8?B?VGVkV25PT3hVRWlFNlNyK3BXSUd3NzdlUEpBeTlwMzZUV3RpaDIrQWgwTFZO?=
 =?utf-8?B?UDcyb0RVTmM5dCtqcUk0c3o5cyswQ1RielpDNlBYcmM0aDRocytmek8yb2x5?=
 =?utf-8?B?RDdNdGxjb0x4Z1BaKzYzRFN2cWZGMGNkdUdkRVdHc3Bsd0U5TllwQWFyT1lY?=
 =?utf-8?B?bEJSV2NYSDZzaVpnVmxmRSsrS0lucjZKb003ZzI5N0NlS3JkczlwMW9xdDZk?=
 =?utf-8?B?U0hFbU9ZVm1ZUXFqL2ZyRXJiNU9BcFRFME53ZGlRTVF5cmZnU1h1cGZkSWg0?=
 =?utf-8?B?YzFURGppN0NrL0xCOVFTbU14TXovRUR0S2VKYkhpbThtdms2UGVQSlMzUEJK?=
 =?utf-8?B?MFFMS09oYk82OUQ3WkQ0MWZIbExXeWdUaWRXa1Qza3dndUVmSGRTYTFCSm1J?=
 =?utf-8?B?T1AyZnZZakg4MnhUN0NWa2VHZEZjdzhXNDZXRkdEWVhIUXVqTVdSUWpQeUYw?=
 =?utf-8?B?VDdick9JcTM2Q0ZCa3pwRVJIMXBZMUhvcDFWNXY1YzlhNER4ODM1MUI3ZmR6?=
 =?utf-8?B?MFhGVUtycmtDVE5RbHdxUjNNYmtTSXNwVUNkdHNlRndSOUxhN1JDREZPZlpu?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EDCD9766926FA41B9B4AA636A685BD1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657d8a41-e6fe-46f8-47d1-08de0aa25b9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 21:49:17.0726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R0O6Iw73SmAk898v3ojITT9ob84gZ9vKQMA6bfz7jPRglva648wJa+jQeEG6jkU2CX484B/nwws0kv8tZFsUEIS8zRGy8uen0X3xLTrBSso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8215
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDE3OjM4ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIE1vbiwgMjAyNS0xMC0xMyBhdCAxMDozMSAtMDcwMCwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gPiBPbiBNb24sIE9jdCAxMywgMjAyNSBhdCAxMToxNzo1OEFNIC0wNjAwLCBTdW1tZXJz
LCBTdHVhcnQgd3JvdGU6DQo+ID4gPiBPbiBNb24sIDIwMjUtMTAtMTMgYXQgMDk6NTYgLTA3MDAs
IE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgT2N0IDEzLCAyMDI1IGF0IDA0
OjI1OjAzUE0gKzAwMDAsIFN0dWFydCBTdW1tZXJzIHdyb3RlOg0KPiA+ID4gPiA+IFJpZ2h0IG5v
dyB3ZSBhcmUgdXNpbmcgdGhlIHN0YXRlIG9mIHRoZSBHUFUgc2NoZWR1bGVyDQo+ID4gPiA+ID4g
dG8gZGV0ZXJtaW5lIHdoZXRoZXIgd2Ugc2VuZCBhbmQgcmVjZWl2ZSBtZXNzYWdlcy4gVGhlcmUN
Cj4gPiA+ID4gPiBhcmUgc29tZSBzdGF0ZXMsIGhvd2V2ZXIsIHdoZXJlIHdlIG1pZ2h0IGludGVu
dGlvbmFsbHkNCj4gPiA+ID4gPiBwYXVzZSB0aGUgc2NoZWR1bGVyLCBsaWtlIGEgZGV2aWNlIHdl
ZGdlLCBhbmQgZXhwZWN0IHRoYXQNCj4gPiA+ID4gPiBtZXNzYWdlcyBhcmUgcmVzdW1lZCBsYXRl
ciBvbmNlIHRoZSB1c2VyIGhhcyB0YWtlbiB0aGUNCj4gPiA+ID4gPiBoYXJkd2FyZSBzdGF0ZSBh
bmQgaXMgYXR0ZW1wdGluZyB0byByZXNldCwgbGlrZSBhbiB1bmJpbmQuDQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gUmVtb3ZlIHRoZXNlIGNoZWNrcyBpbiB0aGUgWGVLTUQgYW5kIGxldCB0aGUgR1BV
IHNjaGVkdWxlcg0KPiA+ID4gPiA+IGhhbmRsZSBzdGF0ZSBjaGVja3MgaW50ZXJuYWxseS4NCj4g
PiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFdlIGNhbid0IGRvIHRoaXMuIFRoZSBlbnRpcmUg
cXVldWUgc3RvcCAvIHN0YXJ0aW5nIG1lY2hhbmlzbQ0KPiA+ID4gPiByZWxpZXMNCj4gPiA+ID4g
b24NCj4gPiA+ID4gZ2V0dGluZyBleGNsdXNpdmUgYWNjZXNzIHRvIHRoZSBxdWV1ZSBieSBlbnN1
cmluZyB0aGUgc2NoZWR1bGVyDQo+ID4gPiA+IGlzDQo+ID4gPiA+IGZ1bGx5DQo+ID4gPiA+IHN0
b3BwZWQgLSB0aGlzIGluY2x1ZGVzIG1lc3NhZ2VzLiBUaGlzIHdpbGwgYnJlYWsgam9iIHRpbWVv
dXRzLA0KPiA+ID4gPiBHVA0KPiA+ID4gPiByZXNldA0KPiA+ID4gPiBmbG93cywgYW5kIFZGIG1p
Z3JhdGlvbi4NCj4gPiA+IA0KPiA+ID4gSSdtIG5vdCBzdXJlIEkgZnVsbCB1bmRlcnN0YW5kIGhl
cmUuIFRoZSBzY2hlZHVsZXIgc2hvdWxkIGJlDQo+ID4gPiBzdG9wcGVkIGFzDQo+ID4gPiBpdCB3
YXMgYmVmb3JlLCBpdCBqdXN0IG1lYW5zIHdlIGtlZXAgc2VuZGluZyBtZXNzYWdlcyByaWdodD8g
SQ0KPiA+ID4gY2FuDQo+ID4gPiB0ZXN0DQo+ID4gPiB0aGUgam9iIHRpbWVvdXQgcGllY2UgdG8g
bWFrZSBzdXJlLi4uDQo+ID4gPiANCj4gPiANCj4gPiBUaGlzIHdpbGwgc2hvdyB1cCBhcyBhbiBv
YnNjdXJlIHJhY2UgY29uZGl0aW9uIOKAlCA5OSUgb2YgdGhlIHRpbWUgaXQNCj4gPiB3aWxsDQo+
ID4gd29yayBqdXN0IGZpbmUsIGJ1dCBJIGNhbiBhc3N1cmUgeW91IGl0IHdpbGwgYnJlYWsgdGhl
IGVudGlyZQ0KPiA+IGRlc2lnbg0KPiA+IG9mDQo+ID4gc3VibWlzc2lvbi4NCj4gDQo+IE9rDQo+
IA0KPiA+IA0KPiA+ID4gQmFzaWNhbGx5IEknbSBhcmd1aW5nIHRoZSBzdGFydC9zdG9wIG1lY2hh
bmljcyBzaG91bGQgYmUgaW5zaWRlDQo+ID4gPiB0aGUNCj4gPiA+IHNjaGVkdWxlciBhbmQgbm90
IGluIHRoZSBjYWxsaW5nIGRyaXZlci4NCj4gPiA+IA0KPiA+IA0KPiA+IFRoZSBtZXNzYWdlIGlu
dGVyZmFjZSBpcyBidWlsdCBvbiB0b3Agb2YgdGhlIERSTSBzY2hlZHVsZXIsIHJhdGhlcg0KPiA+
IHRoYW4NCj4gPiBpbnRlZ3JhdGVkIGludG8gaXQuIE9yaWdpbmFsbHksIEkgaGFkIGl0IGJ1aWx0
IGludG8gdGhlIHNjaGVkdWxlciwNCj4gPiBidXQNCj4gPiBiYXNlZCBvbiBmZWVkYmFjaywgSSBt
b3ZlZCB0aGUgY2hhbm5lbCB0byB0aGUgZHJpdmVyIHNpZGUuDQo+ID4gVGhlcmVmb3JlLA0KPiA+
IHdlDQo+ID4gbmVlZCB0byBob29rIGludG8gdGhlIHN0b3BwaW5nIG1lY2hhbmlzbSBvbiB0aGUg
ZHJpdmVyIHNpZGUuIFRoZQ0KPiA+IGxheWVyaW5nIGNvdWxkIHVzZSBzb21lIGNsZWFudXAsIGJ1
dCB0aGUgZnVuY3Rpb25hbGl0eSB3aWxsIHJlbWFpbg0KPiA+IG9uDQo+ID4gdGhlIGRyaXZlciBz
aWRlLg0KPiANCj4gQWgsIHRoYW5rcyBmb3IgdGhlIGhpc3RvcnkgdGhlcmUuIEkgd2Fzbid0IGF3
YXJlIG9mIHRoYXQuDQo+IA0KPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gV2hhdCBleGFjdGx5IGlz
IHRoZSBwcm9ibGVtIHlvdSBhcmUgdHJ5aW5nIHRvIHNvbHZlPyBUaGUgZGV2aWNlDQo+ID4gPiA+
IGlzDQo+ID4gPiA+IHdlZGdlZCBhbmQgcXVldWVzIGFyZSBzdG9wcGVkLCB0aGVuIGFuIHVuYmlu
ZCBvY2N1cnM/IFRoYXQgaXMNCj4gPiA+ID4gcHJvYmFibHkgYQ0KPiA+ID4gPiBidWcuIElJUkMg
ZXZlbiB3ZWRnaW5nIGEgZGV2aWNlIC8gdGVhcmluZyBkb3duIGEgcXVldWUgd2UNCj4gPiA+ID4g
c2hvdWxkDQo+ID4gPiA+IGFsd2F5cw0KPiA+ID4gPiBzdGFydCB0aGUgcXVldWUgYWdhaW4uIFdl
IGNvdWxkIGFzc2VydCBpbg0KPiA+ID4gPiBndWNfc3VibWl0X3dlZGdlZF9maW5pDQo+ID4gPiA+
IHRoYXQNCj4gPiA+IA0KPiA+ID4gSSB0aGluayB0aGVyZSdzIGJhc2ljYWxseSBhIHJhY2UgYmV0
d2VlbiBzZW5kaW5nIHRoZSBjbGVhbnVwDQo+ID4gPiBtZXNzYWdlDQo+ID4gPiBhbmQgc3RvcHBp
bmcgdGhlIHNjaGVkdWxlci4gQW5kIG9uY2Ugd2Ugc2VuZCB0aGF0IG1lc3NhZ2UsIHdlDQo+ID4g
PiBkb24ndA0KPiA+ID4gcmVhbGx5IHRyYWNrIGl0IG9uIHRoZSB4ZSBzaWRlLiBTbyBpZiB3ZSBh
cnRpZmljaWFsbHkgcGF1c2UNCj4gPiA+IHRoaW5ncw0KPiA+ID4gb24NCj4gPiA+IHRoZSB4ZSBz
aWRlIChieSBhZGRpbmcgdGhlIGNoZWNrcyBJJ20gcmVtb3ZpbmcgaW4gdGhpcyBwYXRjaCksIHdl
DQo+ID4gPiBjYW4NCj4gPiA+IGdldCBpbnRvIGEgc2NlbmFyaW8gd2hlcmUgdGhlIGNsZWFudXAg
bWVzc2FnZSBpcyBzZW50ICphZnRlciogdGhlDQo+ID4gPiBzY2hlZHVsZXIgaXMgcGF1c2VkIGFu
ZCB0aHVzIHRoYXQgY2xlYW51cCBtZXNzYWdlIGdldHMgZHJvcHBlZCwNCj4gPiA+IGFuZA0KPiA+
ID4gd2UNCj4gPiA+IG5ldmVyIGlzc3VlIHRoZSBkZXJlZ2lzdHJhdGlvbiBmb3IgdGhhdCBwYXJ0
aWN1bGFyIGV4ZWMgcXVldWUuDQo+ID4gPiANCj4gPiANCj4gPiBUaGF0J3Mgbm90IGhvdyBzdG9w
cGluZyB3b3Jrcy4gU3RvcHBpbmcgcHJldmVudHMgZnV0dXJlIHdvcmsgaXRlbXMNCj4gPiBmcm9t
DQo+ID4gYmVpbmcgcXVldWVkIGFuZCBmbHVzaGVzIGFsbCBpbi1mbGlnaHQgd29yayBpdGVtcy4g
VGhlc2Ugd29yayBpdGVtcw0KPiA+IGluY2x1ZGUgcnVubmluZyBqb2JzLCBmcmVlaW5nIGpvYnMs
IG9yIHByb2Nlc3NpbmcgbWVzc2FnZXMuIFdoZW4NCj4gPiBzdG9wcGVkLA0KPiA+IGVhY2ggb2Yg
dGhlc2UgaW50ZXJmYWNlcyBjYW4gc2V0IHVwIHN0YXRlIHNvIHRoYXQgd2hlbiB0aGUNCj4gPiBz
Y2hlZHVsZXINCj4gPiBpcw0KPiA+IHN0YXJ0ZWQgYWdhaW4sIHRoZSB3b3JrIGl0ZW1zIGFyZSBy
ZXF1ZXVlZCBmb3IgcHJvY2Vzc2luZyAoZS5nLiwNCj4gPiBtZXNzYWdlcyBhcmUgc3RvcmVkIGlu
IGEgbGlua2VkIGxpc3QpLiBUaGUga2V5IHBvaW50IGlzIHRoYXQgd2hlbg0KPiA+IHRoZQ0KPiA+
IHNjaGVkdWxlciBpcyBzdG9wcGVkLCB3b3JrIGl0ZW1zIHRoYXQgY291bGQgYmUgbW9kaWZ5aW5n
IHRoZSBxdWV1ZQ0KPiA+IHN0YXRlDQo+ID4gYXJlIG5vdCBydW5uaW5nLCBzbyB0aGUgZW50aXR5
IHRoYXQgc3RvcHBlZCB0aGUgc2NoZWR1bGVyIGhhcw0KPiA+IGV4Y2x1c2l2ZQ0KPiA+IGFjY2Vz
c+KAlHdpdGhvdXQgcmVxdWlyaW5nIGFueSBsb2Nrcy4NCj4gDQo+IE9rIHNvIGJhc2ljYWxseSB3
ZSBzdGlsbCBuZWVkIHRvIGtlZXAgaW50ZXJhY3Rpbmcgd2l0aCB0aGUgc2NoZWR1bGVyDQo+IHdo
ZW4gcGF1c2VkLCB3ZSBqdXN0IGFyZW4ndCBzdGFydGluZyB0aGUgd29yayBxdWV1ZS4gVGhlbiBv
bmNlIHRoZQ0KPiBxdWV1ZSBzdGFydHMgd2UgZXhwZWN0IGFsbCBvZiB0aG9zZSBtZXNzYWdlcyB0
byBiZSBwcm9jZXNzZWQuDQo+IA0KPiBMZXQgbWUgbG9vayBhIGxpdHRsZSBoYXJkZXIgYXQgd2h5
IHRoYXQgaXNuJ3QgaGFwcGVuaW5nIGhlcmUgYW5kIEknbGwNCj4gZ2V0IGJhY2suLi4NCg0KSnVz
dCB0byBhZGQgcXVpY2tseSB0aGF0IEkgc2VlIHRoZSBtZXNzYWdlIHF1ZXVlIHlvdSdyZSB0YWxr
aW5nIGFib3V0DQphbmQgSSBhZ3JlZSB0aGlzIHNob3VsZCBzdGlsbCBiZSB3b3JraW5nLiBJIHN0
aWxsIGhhdmVuJ3QgZmlndXJlZCBvdXQNCndoeSB0aG9zZSBtZXNzYWdlcyBnZXQgbG9zdCBpbiBt
eSBzY2VuYXJpby4gSSdsbCByZXBvcnQgYmFjayBhcyBzb29uIGFzDQpJIGhhdmUgc29tZXRoaW5n
IHRoZXJlLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gVGhhbmtzLA0KPiBTdHVhcnQNCj4g
DQo+ID4gDQo+ID4gTWF0dA0KPiA+IA0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gU3R1YXJ0DQo+ID4g
PiANCj4gPiA+ID4gYWxsIHF1ZXVlcyBhcmUgbm90IHBhdXNlZC4NCj4gPiA+ID4gDQo+ID4gPiA+
IEFsc28gaWYgeW91IGhhdmluZyBpc3N1ZXMgb24gdW5iaW5kIC0gdGhlcmUgaXMgdGhpcyBwYXRj
aCBbMV0NCj4gPiA+ID4gd2hpY2gNCj4gPiA+ID4gZml4ZXMgYW4gaXNzdWUgdG9vLiBJJ20gZ29p
bmcgdG8gbWVyZ2UgWzFdIG5vdy4NCj4gPiA+ID4gDQo+ID4gPiA+IE1hdHQNCj4gPiA+ID4gDQo+
ID4gPiA+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1NTQx
Ny8NCj4gPiA+ID4gDQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0
dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ncHVfc2NoZWR1bGVyLmMgfCA2ICstLS0tLQ0KPiA+ID4gPiA+IMKg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3B1X3NjaGVk
dWxlci5jDQo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3B1X3NjaGVkdWxlci5j
DQo+ID4gPiA+ID4gaW5kZXggZjkxZTA2ZDAzNTExLi5kOWQ2ZmI2NDExODggMTAwNjQ0DQo+ID4g
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dwdV9zY2hlZHVsZXIuYw0KPiA+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ncHVfc2NoZWR1bGVyLmMNCj4gPiA+ID4g
PiBAQCAtNyw4ICs3LDcgQEANCj4gPiA+ID4gPiDCoA0KPiA+ID4gPiA+IMKgc3RhdGljIHZvaWQg
eGVfc2NoZWRfcHJvY2Vzc19tc2dfcXVldWUoc3RydWN0DQo+ID4gPiA+ID4geGVfZ3B1X3NjaGVk
dWxlcg0KPiA+ID4gPiA+ICpzY2hlZCkNCj4gPiA+ID4gPiDCoHsNCj4gPiA+ID4gPiAtwqDCoMKg
wqDCoMKgwqBpZiAoIVJFQURfT05DRShzY2hlZC0+YmFzZS5wYXVzZV9zdWJtaXQpKQ0KPiA+ID4g
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBxdWV1ZV93b3JrKHNjaGVkLT5iYXNl
LnN1Ym1pdF93cSwgJnNjaGVkLQ0KPiA+ID4gPiA+ID4gd29ya19wcm9jZXNzX21zZyk7DQo+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgcXVldWVfd29yayhzY2hlZC0+YmFzZS5zdWJtaXRfd3EsICZz
Y2hlZC0NCj4gPiA+ID4gPiA+IHdvcmtfcHJvY2Vzc19tc2cpOw0KPiA+ID4gPiA+IMKgfQ0KPiA+
ID4gPiA+IMKgDQo+ID4gPiA+ID4gwqBzdGF0aWMgdm9pZCB4ZV9zY2hlZF9wcm9jZXNzX21zZ19x
dWV1ZV9pZl9yZWFkeShzdHJ1Y3QNCj4gPiA+ID4gPiB4ZV9ncHVfc2NoZWR1bGVyICpzY2hlZCkN
Cj4gPiA+ID4gPiBAQCAtNDMsOSArNDIsNiBAQCBzdGF0aWMgdm9pZA0KPiA+ID4gPiA+IHhlX3Nj
aGVkX3Byb2Nlc3NfbXNnX3dvcmsoc3RydWN0DQo+ID4gPiA+ID4gd29ya19zdHJ1Y3QgKncpDQo+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb250YWluZXJfb2Yodywg
c3RydWN0IHhlX2dwdV9zY2hlZHVsZXIsDQo+ID4gPiA+ID4gd29ya19wcm9jZXNzX21zZyk7DQo+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9zY2hlZF9tc2cgKm1zZzsNCj4gPiA+
ID4gPiDCoA0KPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmIChSRUFEX09OQ0Uoc2NoZWQtPmJh
c2UucGF1c2Vfc3VibWl0KSkNCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuOw0KPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgbXNnID0g
eGVfc2NoZWRfZ2V0X21zZyhzY2hlZCk7DQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICht
c2cpIHsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNjaGVkLT5v
cHMtPnByb2Nlc3NfbXNnKG1zZyk7DQo+ID4gPiA+ID4gLS0gDQo+ID4gPiA+ID4gMi4zNC4xDQo+
ID4gPiA+ID4gDQo+ID4gPiANCj4gDQoNCg==
