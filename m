Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F51DC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 16:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D7110E48E;
	Mon, 10 Jun 2024 16:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0OOiH2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5897810E48E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037346; x=1749573346;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KgcdvwlotmK6TRgs+DXb6u6NVEmGMtJ7cWJLKPQf2x0=;
 b=A0OOiH2E/4jCjGLsmlR6fzrHerzj3ll5Bbgg9kkAuJVKWtHrAPt8wD03
 lSeH71JefUakyU1IwN1TytQw8bYpPI4bHLwH5R2dy0BuezWB8J/lUkXnF
 YmH2BSEdNPrbl4VyetDmibQoBZQjX8Pya5sRUvfH7QxstXDsJOdMzgtGn
 wNZuU+RkNkKThu7HtctuqKK0CQrtyumqj8/1l6Q6jw6gyy+LPpa6Zu1/7
 5/XhGtwDhdyAGBtFu/B3fJEgreTOhpfTLEFt4L4BfCBYGpS9j0DWHMpXw
 o1lTeBAWrlyFYPUrXg4KBt6SCjccrQt28prfHa43bukU+zwiO9qhovXP6 Q==;
X-CSE-ConnectionGUID: 8AKo3aMpTaejqZBsf7O7tw==
X-CSE-MsgGUID: 2x3V4dpFRWSm7Ou9npyB1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="12002117"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="12002117"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:35:43 -0700
X-CSE-ConnectionGUID: SB6ZPfw5RzKK1IFcclEg7g==
X-CSE-MsgGUID: h6gRLiyUTAyXFcAOYvohpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39120573"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 09:35:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:35:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:35:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 09:35:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 09:35:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i76EH5aVub1pFCu0bSLIR6rhmq8O6KPfCCjB8w+ocKA8n8I0hgwKhPvwSzIwlZzWs4ZHL7T6SBJkMSE5kaI3sprZq4Zwpc38KgKws71MQog4ojwzFowBO6/8nlo5wNmjXkXai9h3j2ZCDLmSi0V0j1ORRxncf/KDiy8LCi9JWYhkNS8Odo/lTDoFHcW2jE9YGZ6WPxv6eA5R4KxynqL6cfb9il/4FB+pOy0nUatpXkqbR/kn/u+Z43/aLfX5BWt8pHt4nmQem7E41VC13RcFOeVSeMx9NBi1N/EWHyqYuNHAb9o1qmtaJPTTDCIpK78uLZXSy2NAbg20D6+aumdH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9ZxvHaejZr4K9OtIcaRt6VXZVKCHIkow6PcGX0oSAg=;
 b=Pb8JulCq5bLDUhRWneCa+IAMA7d5JY8RELK8uUehuILb8nMQhU8UF479JBkJrwsRPl1oEekAmk9DkUx/FSxGDX3ESTuIwNLnHqM6AeEgdbV9i1DroMkxhFn48p2xhfQcPcx1/csij93dUPiPnQzcvIM9QdYsBs/wmisKTexhCSz321BQNmN6GUZiDZsPaLFBMwvO3fTIK7FZw0vNL14qH1ieq9TW5EwWLjbwWNMSpqphxY5izifaHHl3gpMxhNFeQiyfAqjENEKDFUd40wjChEa/72HYploLYy7cihTxFBTaufdjsAPT8cvpFm0o5czl+J4Tig4nQnO9k5JmoKkw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 16:35:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 16:35:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 09/10] drm/xe: Add killed, banned, or wedged as stick
 bit during GuC reset
Thread-Topic: [PATCH v5 09/10] drm/xe: Add killed, banned, or wedged as stick
 bit during GuC reset
Thread-Index: AQHau0EWg8Kdn3hWGEaPi22IT1/yAbHBMc4Q
Date: Mon, 10 Jun 2024 16:35:39 +0000
Message-ID: <CH0PR11MB5444ED403BA3B2A0D63EF701E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-10-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-10-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB5044:EE_
x-ms-office365-filtering-correlation-id: fbb2cd0f-4587-44f7-33a1-08dc896b5cf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?2fLdmh8VSxPFR+jUbraCcyz65L4evTYMMW/tXHHPa5UWLtH1WuJDesQYqaoZ?=
 =?us-ascii?Q?+X5iU9EPfScrlwOf9rEzmoUUkk9TYNEIqCU4ph2kYdYyGh++EtXNcfaI8rJF?=
 =?us-ascii?Q?k+hlKe3shSf6i6G86kXdTQvKtwNSpnhWl+1OvV2rltEUv0tMjdHVTrDXzm+9?=
 =?us-ascii?Q?OvaezAjhWQzUetc7nw0VPKU9Y2eCAKmTev8skjq42ldcobqWOxIg0oQC26Lb?=
 =?us-ascii?Q?N3anMOxy0dO1xhW40Ly147HrBqeEXNKphBcq7URyN11cXIZyh4LZbrwaSZmB?=
 =?us-ascii?Q?CPB1U5bkViQD+Z9WfwpSZDrp+1TNpIakVoIFTGGJyfWYL2Q7LVA3T71A/tXw?=
 =?us-ascii?Q?aUVlSiNsvrp86vzHdFWY8b3NyuAqHbeCAAfn9+XELLsiDb1OiIPmOYA7VTwU?=
 =?us-ascii?Q?CEArsudA9qc5rwRHm8pYXutb6yY1e9os/v5jt9j35upJ74oHWlV4Kddoni3t?=
 =?us-ascii?Q?roGp77igU5Cp99wSDdV7Zp+m+kPzAVPGoN0sctIUd9nLo7H6ZiVlPT01i7rU?=
 =?us-ascii?Q?FIeDa4XGxUcWuKdaFG3LdK5AtD12CcJOZO6iIiDdzJ6l9w1bl26H9sRRrtAr?=
 =?us-ascii?Q?3fUQlMP6Pm4zhbfM2N8qoXH/l8eBM9iCyMvZWPyHCs2t+Z4ZQH1obOzjDVB5?=
 =?us-ascii?Q?5kMXYR6VTtX+A9vXjq7yOFWsCF/dd9QB5NXTMUQiBc/oALt13XzU0eYnnhVI?=
 =?us-ascii?Q?avaDLBzsSqNnbSUfO896FMlji0lC0osXp1Czdfvq5VkjzVnEmlYw4NMLGYxu?=
 =?us-ascii?Q?ZG9HD3ezvFeRjp+Bu/U0gNogEjp1hRT9EkKyMMI/JuaDWP30Ha4o+C5FAvvn?=
 =?us-ascii?Q?2E38mTMHwtXyIErDcgduM3u64ZAv0CWH29+crhHvfNpdXqg2ADPlDIANg211?=
 =?us-ascii?Q?bM0Cnx6tQnlN1xWL4Y4WzFmaxXyucpKmDn3WFKnXhGFwGvTYMtc3h5/nFC7P?=
 =?us-ascii?Q?6KYJkT+c86ybAhMLsm6F9Xbt69MrEtGPcP3pyGfLvzJYpfmCm5Ff9qHxYB76?=
 =?us-ascii?Q?1JBka6WCkF9nT6lJJfyP2gDgf5j8qWy4KLPNZHJpTFczNZrmewXTdI9eZI56?=
 =?us-ascii?Q?uk/slEoKvmRBsZmo+HaanMcyhJnaV6t3Q6bbGHycrcF6EsXQVg/Wh44tsI6i?=
 =?us-ascii?Q?lQIl0dsfRpqcaaGaRCWX6OM+R643uzKg5DcBuJxw0/+BG+zYyLyY9si1GnBW?=
 =?us-ascii?Q?dYY7I5/Y+cc9wZR+A5n6cYq3FJYEsowfDZSu+dlAp2vHN8+l5Y7YLah5EHlU?=
 =?us-ascii?Q?Qcakg9CCGJvHrmct7bo9vxoQfyBwaYKvMcBUIeFOV1ks2JD+HufLfwp1FWBN?=
 =?us-ascii?Q?bqyBzyJDQS5mpvO/mQ6SoTzKMC1cSNjEf2WoI9l3ASLwLphaxm0c7TuvhCGI?=
 =?us-ascii?Q?SmWqg74=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tphWX0Y1tmkrO8voR+tDk9Q3rohhXg7bUd1NqhXf8xhU3RHjy4n920+ULRM0?=
 =?us-ascii?Q?RsBZVOvd3Cxwj5qEE374LB4FYGR6BkYJtS3r8H0GusMhz0QIRNTPwVjw15Np?=
 =?us-ascii?Q?eXXrgIyqCM4wCpYkaGsazL77gI+++ryfzf2sQoFhKz4hSRZ5qHPnLHC4sdRj?=
 =?us-ascii?Q?OeojkjZrqi9YRiE2ugXY6RezdONOdK98j+Ka/Y8y5qD9XStZRy0xGCXDZUIH?=
 =?us-ascii?Q?lypDEHLSW3ymsKY+6PhpZkqW4txGyqtuZ4hAlq2LN42gqQxfo3bwcChmdsDF?=
 =?us-ascii?Q?6aUgq2QcHRmnML5D/HnDqHEGBmAU0swkmKbYhZezHg+ZAYgjRAj2A2RR5cx6?=
 =?us-ascii?Q?GKRMBmCLowjsZfg0I5sy5vJuNsRNlBWLJwo2bwjf5BjhjSHjzqgZWC2b8K17?=
 =?us-ascii?Q?MAJMD0s5CVqKDsMB7Ea/PCqZeY8VKFjXAYhTGrmmTYE5uauwqnyFh9OF9Zsx?=
 =?us-ascii?Q?xAk/mMwRB7tJZ6jw8ix+FV4lwHNyfL2bI6wVP0m4my/5ntTXk/3Wx5PhlKLn?=
 =?us-ascii?Q?1at8idg/YgL0jH3kkf7I10olIhCHAH9ncEvLT9ywBw3J4F4nXlxpAbqBdFDB?=
 =?us-ascii?Q?fpBuNlCxQ2vM/L/KhcIig9xdxuMnpn1wx2cMNk5vbBXrIpbmiLCRKLfZ09Je?=
 =?us-ascii?Q?ldW4HWMwRxxoP8QMlweNlEDmGylXarNB64hcQ/a9lH/QWu1t4WKz5kbVQoLX?=
 =?us-ascii?Q?Iq0FZ7Sh5bJKblrVv2+euzjSNKl1Y5YYZclvzJGR60EMo3KPOh/v/u1i+FBU?=
 =?us-ascii?Q?SoLZCx3fcKm2Gxev92VAJRBfzqBhJGz5ROo1bRKVxCohL1Bhm1tgZuEVtwiz?=
 =?us-ascii?Q?L0nXQ7K8mxctEXFDsFmAUhC4lTJbVDDY0GhDh60ZDbJp/Bhja8YC01/KZCel?=
 =?us-ascii?Q?9PWKgqyMtBKTb/HvpG+mWjqQvu116xjV6uwLo5J4rj+Hyy6IOOx3Qm+AzLfq?=
 =?us-ascii?Q?Xc5Lwg9qIN/g9mFTbbeJYlF5Sad1mxf2l2mLWwFjA175j4YJbNvbLTqZ5ZWe?=
 =?us-ascii?Q?J9A5qnb8XyUbSSs10wbFof11Ola8t37vwvxx28Fq9cnBdkmiK5Vk1LUfdV+E?=
 =?us-ascii?Q?X05mn7PPfgrUkJRR0Nq3eD7ahvd3K4cViUxAqW4i+nCHs0f6ZUQBqP7+SR5L?=
 =?us-ascii?Q?I4m3R13rLXDDtBY0RGaR/uOGMu+Z/Y7g1I8/Mj5V9LrYCdufQeXJW5QWKx1+?=
 =?us-ascii?Q?DL5r6nMeCBIz4+FSw0TQmAvc22zo0KfphGQUv0zCfMRzBpW5cpttsVjmWM28?=
 =?us-ascii?Q?jAfcZsFoGKh69Ud8rrpaFBCasu7Qn7PU7rVVHD9wVeJtjj8dpQT5v3mM2QN6?=
 =?us-ascii?Q?Y9vwZbzglKuZySyS+pQmzBIYZX084yc2HP6uEMGiFIJgbrYzPeB8esmMFIOS?=
 =?us-ascii?Q?Oe9WoZSF5+jLdfYwIH46dBLu7GStJsMKqXjDaKWdLdM0QQC6bO2sKDzwSb85?=
 =?us-ascii?Q?yPaA+ab0zWs6IN8DaCelKkpSmC1mrQqISnqy2+kYCUu4Za5Xf/Jyufav9MuO?=
 =?us-ascii?Q?rwvI/PuDc3ZehDVkCOjrcLXJm085/RaqBYMRylN6FYBEBevCIWQVD63gygcW?=
 =?us-ascii?Q?V0wYYq7LRRCHpEphun4E4Va4jZtrQfTWK9yb0HZJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb2cd0f-4587-44f7-33a1-08dc896b5cf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 16:35:39.3060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iK/PDkKHfX/Fc9F5BUlJJ99O7+jxpTFAkVLLujvTCXeVY68WwOykrqwe3ks1QNE85LFqDeqWBP/E+Pe18itTkV4XDjsFT65ehB44I4i99nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Monday, June 10, 2024 7:18 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 09/10] drm/xe: Add killed, banned, or wedged as stick bi=
t during GuC reset
>=20
> These bits should be persistent across reset, treat them as such.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 9e1535c2d8f3..3db0aa40535d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1444,7 +1444,9 @@ static void guc_exec_queue_stop(struct xe_guc *guc,=
 struct xe_exec_queue *q)
>  		set_exec_queue_suspended(q);
>  		suspend_fence_signal(q);
>  	}
> -	atomic_and(EXEC_QUEUE_STATE_DESTROYED | EXEC_QUEUE_STATE_SUSPENDED,
> +	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
> +		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
> +		   EXEC_QUEUE_STATE_SUSPENDED,
>  		   &q->guc->state);
>  	q->guc->resume_time =3D 0;
>  	trace_xe_exec_queue_stop(q);
> --=20
> 2.34.1
>=20
>=20
