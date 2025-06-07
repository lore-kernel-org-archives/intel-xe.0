Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D028C61CE7
	for <intel-xe@archiver.kernel.org>; Sat,  7 Jun 2025 00:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F9A10E412;
	Sat,  7 Jun 2025 00:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVeiiBwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C9410E448
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Jun 2025 00:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749255012; x=1780791012;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=D3PWSjjbSBt26xc9HSQxDGZKPF841yY7N3iH2xlxla4=;
 b=AVeiiBwuSnFuEraxOwlShZhuqHlUA2C+JYmsZ76himXgIcljGJn2sMwl
 kYNHWJSChMIq5ysU/n8UfmhzYE//zNZfX66rOfm1pt0dChgq4ciQ8yjLB
 f5uSgg4NvIHq9pF/g8eqxstUNiI24wfqRQNYaKebwBOXpRLgxADk0c/3b
 rjV0SJfEsZP3S7ojHyTw6ziFWvVm9RINP9zjdiEDxjW70VibawE4ybtZA
 qrVGBih4sd9YqiIS57MD4N+oamjAGB2r2trR24FMlMkxCMMmnhgD6Cydr
 WNvg4BjbfORn93qr7BsqGQMdN48f9QbdrML9GiOFepGqIKDe7t75SoBSY w==;
X-CSE-ConnectionGUID: Ypmnz7/LSTeIU4Z5DJgYqg==
X-CSE-MsgGUID: /gsX8dyzTUCsN9R9EbFopw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="50643076"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="50643076"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 17:10:11 -0700
X-CSE-ConnectionGUID: Kx2uq2mlRHSy+snCeKNX8Q==
X-CSE-MsgGUID: d8GqPTTCQSasMtzeAD4b7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="149791763"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 17:10:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 17:10:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 17:10:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 17:10:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leBVeH9m/RXcYKl0YVQmxgRCt0/gPxhYOcmBI4J/CtC0BkAPUeg3YgmwtwvmJyco9YmCnTpi/EsBozhx6VLlGvlgNuyK1mUCrPvTGAI8vznvRrVhn8EFymlvCehwXsDVSw5cCLj3EnWGKZo07lqwHZGoLkX+S6FjzVsyx4Gymh2YJ9au8k5QueHeGZYwzm5xF0W/OnHBufzqPyfllfwqiSRShEbCaw/Kjyehug/a2JjddWoXe+cVLD0/iTpYHLXZcZ+vaZbWQrrjdZm/NuC3oXH4B6T4PHzDRxGi2un72hShvnOqClU1/nQfiypM5N/5TqNRraDZOJUHGzQxDvL4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wty8AnZav4/wbMe9Ry5SNGsYrfq7Ib1tpsbzaeRhR4=;
 b=m9eCyMlTPbC/Rd9qJtALDA6mvAdpMtfgNHcmB/IOVYyceJD812kx+OtmBCojJ52G7yW8mPzd3OZpHA0r5HRKqwGDB1vjkyRw0wPPpvkSOpIrk512lGAmC9brZf5vQ+9SfXB2KgSH9wnnbQWrjTYNGbW60saOWWdIazh2nGFdTmqJ/QLKJXAHzOCCAtmp/ktclY+snEqND8xXCEsyMK0fsbQLLXkgxEV7nlE+NZpyE3GbeqwTI7nElWreMaLWLcxekxdTTcS5tvtEtd6Uo24VqrYCiy9ngBSFv7nDWU+cfItAJ5orXoTNgagX+kQXLcZ19+O9nD87rcAJqpPT0Ub1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sat, 7 Jun
 2025 00:09:43 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8792.034; Sat, 7 Jun 2025
 00:09:43 +0000
Date: Fri, 6 Jun 2025 19:09:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Message-ID: <c2dg4jybyfkmxgwpydvchso5bdpv46gpqat7zcjdrwcrjwjx7x@zxdu4py4iyki>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
 <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
 <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
 <8afdac13617376dd5c9151e832921b5993443243.camel@intel.com>
 <5f834906-e62e-4a61-8dbc-7bed51904548@intel.com>
 <7094d8f3f850baed86783365bfbf5ffb84663edf.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7094d8f3f850baed86783365bfbf5ffb84663edf.camel@intel.com>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 979b2729-306b-4f46-5d9c-08dda5579aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?v6nBhZ416ldLgh7Wgok9dfAoBBbsF5Yibh5wUEC+priZGJA/TIVmb9zXxQ?=
 =?iso-8859-1?Q?e4Fvs5NfTOR0V0lm5W7F3+5LRIQ21Xj7fxJKWXhnQRSw40NyefmniuRcoh?=
 =?iso-8859-1?Q?JePHmsFjjMqljC7rnOXR+zm9f714D1sYQb+eY+swcgpteiDMqWwjdJlQYX?=
 =?iso-8859-1?Q?FWrXBn7f6xNmFwsX4gR4eP5aNX4WxvBMVuUTbO/2CAX4Qkef+GrhEv7CA5?=
 =?iso-8859-1?Q?WqZJLTA9TM2UmD51OAxg2PR9rpw0FnBSjDcpfuK8OtD1eO7nc94pQFcyrQ?=
 =?iso-8859-1?Q?MTzgCMglIytzJ25ALxrBxt5OfgOK1j6m8xMeOhwo0c88gbcxHG3039Yyao?=
 =?iso-8859-1?Q?/4EZJS7uRhX8VXlrNqJ0FnTXK4Fz+Ql8BTz3FyBk2dg+YJmVRoXh7mGAgX?=
 =?iso-8859-1?Q?Vh6/iy0UOEm6AsEsQlPKnoE2NXvFzxfbjN6WsH5LjuEZw6HOHAoNwfymW5?=
 =?iso-8859-1?Q?vQXsu+rn2Sk4A8LUXnkL6A4v1Dgb1t/M3zWULoOoTt5GJmlDGU1YEpeed/?=
 =?iso-8859-1?Q?JDC1yFUjoUH4zC91q+5lKYRNJ+vSkbfxAkEABVxN9HwUydgu9oxHLnhPz9?=
 =?iso-8859-1?Q?BhblGPyVsGsu8gT8SQ52Hm72lczmfq3XijVtNleAYnnQBDVLNxnayIedAC?=
 =?iso-8859-1?Q?Zjc4qpzPdUgMDepyJLIkzni6DyJAEaRefIdJTO2F1lQcd/gt50jA6DYiB+?=
 =?iso-8859-1?Q?yMaRXIUUbzaUlbOB+xpBBSpuXWhUZyZY9af/r6v+P7HHQRI1SLKREw/WFs?=
 =?iso-8859-1?Q?DPkjWZ9ZZ80zRa7cLFNJRUfcptIWSWIUbVkRIeS23DgsQOYYUSg6Jn7WEh?=
 =?iso-8859-1?Q?47NrwxdgSbTsU+FTNiku/xzHx9W2R52SMlY/ogvLNOiTlL0oqP1U4lvHPt?=
 =?iso-8859-1?Q?fjBZTOEQdoxHsVQFTbgfV57B4rXAPundCNIZzzmCLUpSPsvu64xouwGK4+?=
 =?iso-8859-1?Q?hLliCDViijOWc8rIMR+2cYr5ncy+ZWOOqWc4taIbRLPQ0UYTD4jHwyV6bI?=
 =?iso-8859-1?Q?gQ1k8UpnQYOkqKAFG30kRFh7AKjE0/97sHKw8n6vZOiNiqZyHjILYr1L3J?=
 =?iso-8859-1?Q?eeIqn1lTwyhKGBqgb58do2rQLjHx7l1Rcz9QM/STVfuz0kKi2a2tfaCVVs?=
 =?iso-8859-1?Q?C7apJvBCcKFCZCQ9wgNj/wyRR0K4Vz1tqcax4AxpUuAmWmb3c5Hx47BvBY?=
 =?iso-8859-1?Q?OJp5/wkrV7mrj1VAyJ6I1oJ3t0yroJ/MeL+vF4P0qXIjmIS4D+0eaa0hsq?=
 =?iso-8859-1?Q?u1GoByTmyF+VOUtnm7mCAyPtFtAyQ07+G6933PvOnNdWjMYEcJeb63+SWW?=
 =?iso-8859-1?Q?sW5bD2XdL/3SbvWekhUAtgIaLjqn0fePvGBKggxXgJTXq6fSSwK7TJOt4p?=
 =?iso-8859-1?Q?FGjUT3Q+M1PhCNp4SyQplOk+VtI7RzGm4ckjwOlyP4xC1nKDLk3Cxv1GqA?=
 =?iso-8859-1?Q?/Y51kSaVs/NfqK+xsxGzAzt3TkliaDCU6WjB8z22SBgYr7l3Y9yDJCq/91?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TPQL2K7417KpUpef2UArA6cHdwfNXrBHMypf7Ya7LIxSv6all53HmFusru?=
 =?iso-8859-1?Q?9sHIojVpByJ/Pt9ErusnVcTTHyZQyclcZgX5x6cCYH3Ykhu7EPhKyeYXc/?=
 =?iso-8859-1?Q?9JtL3Zx/+NCukPuztp1ADWFaIgoaDhlqJs2Hhqt8xyGX8HveBkJ+I8Khhn?=
 =?iso-8859-1?Q?hZEUT0OUhZqI3P15fdxXKuaKbIFel1VhJSBCTmmCs1VAGnnMirEPVFcwaN?=
 =?iso-8859-1?Q?9ZCNpxvK3iNMG9ovCwXRswosjiSiNriuThj7jjo6rx6bzOtm2FiNgsuDoV?=
 =?iso-8859-1?Q?9s9343uOQlTywXZ3/IiodbP5Na7O+5dCU5rHYP3CY9RCRJvH1z7drxzTJh?=
 =?iso-8859-1?Q?DtNsZups6wyVBGn96d162ekc5m7CGfjS35u9pitYn0p20E346AI3lEfUjJ?=
 =?iso-8859-1?Q?y1X/D61eQ8DXi4/DkQ28Rfrc2UiB0PZZg0F15o9C6q6bMMzpr8zhYIXEK4?=
 =?iso-8859-1?Q?bh9P+OBiD70LEryr/HChVCZg0dwp7RPggbAd5uw61dFxJp3K9UWMiI7EfK?=
 =?iso-8859-1?Q?sOE0UN75itKDuxuKqDar9v7FUOgQPmhnG6cBHPm2qwKJ3AejZvkN43A8oj?=
 =?iso-8859-1?Q?25ELRouQo3lfuScay8Py7iY0XC9/IAe0pyNaosTV0mp9yZiQrXnkSqPb8t?=
 =?iso-8859-1?Q?07wnWKWKDdKBrHVe3fLXUVthNqHnMvUL2hzIFcUexenY56GcZrHGi349ln?=
 =?iso-8859-1?Q?FHmKCQ9BLNmP7UPtM2370JB3HYws120Hyu23rcAmotHqbrcQc49/fX8U/Z?=
 =?iso-8859-1?Q?NEPD30tC7wZvK+paMguCxzbXeLRx7VlhYle5fgisFDFT84QICR1cDY8IUo?=
 =?iso-8859-1?Q?tLqR3PYgzcD3nkQxEr/S4mNL1B4N1GcmwyCyHj7C9tSDGtBrq8x/DEwBPl?=
 =?iso-8859-1?Q?SvEadioWgZPdU2px1AfbZBcA+GbHn6dVCogSTJXwWuTUOLy6DJ0JJU7E5k?=
 =?iso-8859-1?Q?4pAEqEx6W7zh4MynvJf1hAyBParI3WkH7KFpf4dGP9CA9cEHIEMn0AJhNe?=
 =?iso-8859-1?Q?TceerLfKL57wOdOXNM5QVr6rO7sUEUi7Od0pfeuSTWHBVgKoAiywsYiM7N?=
 =?iso-8859-1?Q?cRxlzOzO+dq8KjBSIwbug9kly+tgp49E6pC+n65U/ARsb3PxkXhgnRqzI6?=
 =?iso-8859-1?Q?zaK+G6JfqskYZuw3uBKeeC9mjCP/Aj0H3gUIZIsPyVTv73RNk5BWiXI2p2?=
 =?iso-8859-1?Q?5m2PhGKHhnW8DkIVXxGg442oING1AUPfxToFVbDHKZO5Y1pSXAV50NkELx?=
 =?iso-8859-1?Q?EzFOOyKOzrhP2Ng9zoEvIY/EleCyBR/rnJPwG0ZKjChM0WQDfp1NDv4f1K?=
 =?iso-8859-1?Q?mT14S+8ZlVUwt6tDXdxY0UpWJlq/M+Ron8gMbZpo2M0Azgib9nwCFwe5Ho?=
 =?iso-8859-1?Q?2yKkqZQCVKkeF6zE9jmJKkh7w1YPx0R7IQTYRX+2EeeQ/4mED2c46QkIK7?=
 =?iso-8859-1?Q?JMzCm5HIBqp596CDbemnfr7SxwTvAMgSdTQnwsbymu+8MKzWGrLJgTM9ho?=
 =?iso-8859-1?Q?Y6VJ/XB2ET7G7yjk2Ko05pWHEjE3NzDSfep6SZ2o2POlD+DPffqPv1E3dc?=
 =?iso-8859-1?Q?CyMhespxSM+QLcAXBc0/Q6YgL+sxeAs6xRZzXoChDBHfl48rjd+3kHrI/w?=
 =?iso-8859-1?Q?Hw2uou6dgn99+28zoe3a8aZ0Dh12SNEMVT9xFtHxHXAFJme3oNPpBbdA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 979b2729-306b-4f46-5d9c-08dda5579aa8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 00:09:43.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FO9ttfCev+44F7XrYamIINcyP6tF+fjNGsbM0O2zWRlPQdVOY7hdXZhNL38dhEnHg/6ZUCMJXTRCPqDgzmxeEQ87iZw/98aioIGXg2siHSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
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

On Wed, Jun 04, 2025 at 12:06:52AM +0000, Stuart Summers wrote:
>On Tue, 2025-06-03 at 13:31 -0700, Belgaumkar, Vinay wrote:
>>
>> On 6/3/2025 12:31 PM, Summers, Stuart wrote:
>> > On Tue, 2025-06-03 at 11:41 -0700, Belgaumkar, Vinay wrote:
>> > > On 6/3/2025 10:36 AM, Summers, Stuart wrote:
>> > > > On Mon, 2025-06-02 at 16:44 -0700, Vinay Belgaumkar wrote:
>> > > > > Set GT min frequency to 1200Mhz once driver load is
>> > > > > complete.
>> > > > >
>> > > > > v2: Review comments (Rodrigo)
>> > > > > v3: Apply Wa earlier so user_req_min is not clobbered.
>> > > > >
>> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> > > > > ---
>> > > > >    drivers/gpu/drm/xe/xe_guc_pc.c     | 5 +++++
>> > > > >    drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>> > > > >    2 files changed, 6 insertions(+)
>> > > > >
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > > > b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > > > index 18c623992035..cb0563494fcc 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > > > @@ -51,6 +51,7 @@
>> > > > >   
>> > > > >    #define LNL_MERT_FREQ_CAP      800
>> > > > >    #define BMG_MERT_FREQ_CAP      2133
>> > > > > +#define BMG_MIN_FREQ           1200
>> > > > >   
>> > > > >    #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no
>> > > > > need for
>> > > > > precision */
>> > > > >    #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used
>> > > > > only
>> > > > > at
>> > > > > pc_start */
>> > > > > @@ -843,6 +844,9 @@ static int pc_adjust_freq_bounds(struct
>> > > > > xe_guc_pc
>> > > > > *pc)
>> > > > >           if (pc_get_min_freq(pc) > pc->rp0_freq)
>> > > > >                   ret = pc_set_min_freq(pc, pc->rp0_freq);
>> > > > >   
>> > > > > +       if (XE_WA(pc_to_gt(pc), 14022085890))
>> > > > > +               ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
>> > > > > pc_get_min_freq(pc)));
>> > > > Do we want this above the get_min_freq() call above? Seems like
>> > > > that
>> > > > would further limit which is what we'd want in that case right?
>> > > No, this is during SLPC init, we don't need to read the min freq
>> > > at
>> > > this
>> > > point. We will adjust it later in the flow if there was a user
>> > > request.
>>
>> This ensures min frequency is set to 1200. That is required by the
>> WA.
>> If there was no previous user request (like before a GT reset), the
>> min
>> will be set to 1200 instead of the usual RPe (which is around 500).
>
>Ok makes sense to me. I did confirm the workaround frequency called out
>in bspec matches here:
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>

but why do we do 2 rmw instead of 1? Something like this

	u32 min_freq;
	...

	/*
	 * Same thing happens for Server platforms where min is listed as
	 * RPMax
	 */
	min_freq = min(pc_get_min_freq(pc), pc->rp0_freq);

	/* But shouldn't go to less than BMG_MIN_FREQ on affected platforms */
	if (XE_WA(pc_to_gt(pc), 14022085890))
		min_freq = max(BMG_MIN_FREQ, min_freq);

	ret = pc_set_min_freq(pc, min_freq);

>
>>
>> Thanks,
>>
>> Vinay.
>>
>> > So then what is the purpose of the code just above this?
>> >
>> > -Stuart
>> >
>> > > Thanks,
>> > >
>> > > Vinay.
>> > >
>> > > > Thanks,
>> > > > Stuart
>> > > >
>> > > > > +
>> > > > >    out:
>> > > > >           return ret;
>> > > > >    }
>> > > > > @@ -879,6 +883,7 @@ static int pc_set_mert_freq_cap(struct
>> > > > > xe_guc_pc
>> > > > > *pc)
>> > > > >                   ret = xe_guc_pc_get_min_freq(pc, &pc-
>> > > > > > stashed_min_freq);
>> > > > >                   if (!ret)
>> > > > >                           ret = xe_guc_pc_get_max_freq(pc,
>> > > > > &pc-
>> > > > > > stashed_max_freq);
>> > > > > +

nit: spurious newline added in unrelated function?

I have the local changes locally and can create a new rev later. Stuart,
since you reviewed this... do you agree?

Lucas De Marchi

>> > > > >                   if (ret)
>> > > > >                           return ret;
>> > > > >   
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > > > > b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > > > > index 9efc5accd43d..75fbdab68d44 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > > > > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > > > > @@ -59,3 +59,4 @@ no_media_l3   MEDIA_VERSION(3000)
>> > > > >                   MEDIA_VERSION_RANGE(1301, 3000)
>> > > > >    16026508708    GRAPHICS_VERSION_RANGE(1200, 3001)
>> > > > >                   MEDIA_VERSION_RANGE(1300, 3000)
>> > > > > +14022085890    GRAPHICS_VERSION(2001)
>
