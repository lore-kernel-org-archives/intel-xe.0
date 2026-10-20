Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D25606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IjjVpVbS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F2C10F477;
	Tue, 20 Oct 2026 09:55:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16AE10F46E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792490152; x=1824026152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EdZhLBu2Tcj+6Iw8t1uAP74U6PHGX3y/SR8dEWJ+x0s=;
 b=IjjVpVbSlXhKX64cuyvDYItNYQ2o2aRlF17bHoJ1+jvKS6yWalhOobPr
 AQ5oqwx5T6M8fqxjpQZCaAFfmAdHYGeG17P04q66IsbcpUpvZeVx5Cwq+
 bAXI9XXPvr2vB3fMd+RPLrwDvfJQxlbgWoNt1aGchSw+wiO1ucnbKb/H2
 23omp9h/4nRqaGGsovGyse9r6R14QwKpiqSTaUMESFxmAn9/hFVqo0gEl
 IibCoHNsLMwzr0wlm/s+ZMyQ4iiBP0DGcKqsNk+3hbvlBUZOjieuhvcgb
 h1Oi6Tlll7pcz2CzLYhJ795DRZ01sAxwGsLxUfjc0AUj75xm0zzCL1eIQ Q==;
X-CSE-ConnectionGUID: b5J0FIr1Qkm48ElQGqssGg==
X-CSE-MsgGUID: bOZXGB52Rxq0NDbpKJ5tew==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1216431"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1216431"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:55:51 -0700
X-CSE-ConnectionGUID: hpYXOBSVQr2O1bL5DL75jA==
X-CSE-MsgGUID: 1JDo+EeZSoOALc9uiPacmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2667701"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:55:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 02:55:50 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSOvscYMiB/S7Rj8Mmedq4/JyLu9E+1rx0VkwaUrnmDx7f+VesXqz3MwB8ySJJSgS2P28deVYRqYxkTRrL/KU4JJsz2d2N/oESYh9r762iL6rra9aXi+jYAWIFUBdsiwpSZYL/fsDqDQnmyB4A7fUyeIyw2cNuTPvHohz2HV+GOWMw+IU2hmY8iOPXiV6++viWy7j+upyj06IaNNIe6MwYck+uJ/NDAvlLgZUtAvtDXRmKybBLe/ie2xCjiWIVT/qJUP6PD37UM/qcgnvT8ei22AfgpCqjbsgBqjuL9MoEh9W234qUR7YuzhvdTSPkA0cUQ0zMbaYlPOhOl1HasH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nf7phI2QVy9gOyB9RlXNlb5+lAqwymr/JO8ABlP/PlI=;
 b=PGw0u3uNQ+G/6nflTZD/y21EO9fVnCPKxdtJjHIUUl60sPZ/tsZLA6r4cikOTTUg9URHsvlG9MtOYNbaa9K2UCQwDFJJVD5XkcZT10SzXbwYGpFa5mUcLWWYZmlbkztLaw+yQ7lCeUlU1cC9b/1xyeGJWl/5vZtn0VdpZcNbtT+Q2IRTcfOThVK6yJyFseYJfAyk4xFykHKNLg6OyXG4ybmgPF0gXZBr5LJfCUz7UNH++mzguthF6zsTVTRlV7yAhSanU5XcJ0vaGxtisjdB+C1XILMs+HyJLwpwmM4/hwymHW/QlrVQ+b0qMru07t18CuogQG4OqxJFTPJfHilVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 09:55:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 09:55:45 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 1/4] drm/xe/ggtt: Introduce full GGTT range size
Date: Tue, 20 Oct 2026 11:55:29 +0200
Message-ID: <20261020095532.473609-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020095532.473609-1-piotr.piorkowski@intel.com>
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::34) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c9297e-1e81-4371-d902-08df2e904f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Jc3KZsOFJ/u6PL02LyiDFi8qMc9d0u1d+Qzc1vWlZaWWmVsXVNf89N6w1QDp8JQF4WGNqVW3w87BjQOuObpXMGm7jNGMyWQnEzeI/1GmfOX2MknQ+kLEOnCEi91wMsV8I5DJzsn/yAlReM5QoTLL9uPIcPdbJqMls+FKUUFplpOxVmbTjq3xaP/NXshwyX8R3U3Zu5d2f7r2WmqFkZ2W0VR3zQTMCLUR/3RMn6SPmOWbqqz312UqPuup41/PQkcQ58WQJP1m2yNyVAefrUz1HDboKYlYOIzVKnftIJICB9HKHSfLMXVZxpA8cdH/8AqjKA8Az59/OdMcTHZJeAN2fRQMfkguboymctGa+C4irTMyTXfRXeMZohXJufqUAFKyxVcRXxFg/BdRxI/VSWRQO5wnnH1wcMDh0T4wOM1pYxByxGEE1vnIoehGe0q733eqBK6FrVMVPuk29dk4HA88G/rnpZym8MjcM497QocQ8PUxYmItyTqyeFgRaNLHZbhDe6GxJEEtaafKD9rDNAWZql74gnSOwIUhovUnDOp/Wgj4GTvWHRLI1daHtgroGWfLxUdg99ON9h7M1QvmoTDa1Ll2p+n7gK0XmllsggXWEusG6NObU/oBF9GJr7Ta5KcF3+m37T1SEFy9zbviPx0FZBXKjMz9w2JP73LEOR19sIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWxncnpJZC93cDJNVzJXb0lFQXpvZkdqQyt2TGhyWDgvc0V0VDczUzFGdjdD?=
 =?utf-8?B?c1E1cnNaNzVLMlN4ZkE2KzlZeVVpOGtIallFeGpkOEJsbStmcXN3bmNmZnZa?=
 =?utf-8?B?TTNQNCtaMFRFVEwweHp1R3VjWTVXd0dseDdleHJQMzNFZGIrN0o4MUROVFZw?=
 =?utf-8?B?WlVHMDNDcEdTQzV2NURYOEpITW5vVUVTN3luR1UyRy9RMU9RZlVpVmdjVzcz?=
 =?utf-8?B?ZTRJSCszalNLODY5elhPWG1ha2JIdjZvK29aT21ocmFYRUJFS3pONlQ4a0Jr?=
 =?utf-8?B?L3ZRdkw4L0lqZlk3K21TMHl4cXFhYXFobFllSWNHbE5TN240ZkNQSnFkbnVD?=
 =?utf-8?B?NUtlRElHWXV5R2QwTUE5aDJmdFFJR1hZd2haSkRHNzlpYjZ6dEkrVjNyb1pJ?=
 =?utf-8?B?OFczZjFTNE9yQVF2eFMwbFNYbEV6dCtZd2dYRnJzWVFwRkVJdUIrTi8yRkJH?=
 =?utf-8?B?L3huSHFDd0duaFpkMmthbjVoNC9kOE9hc3dyU2FrOXlkR0cxSmE0dFN3Q0tZ?=
 =?utf-8?B?TUE5d1Rpekp5K0dTaTlVUnBMK2RWMHRBSnZwZXJ0QUR4ZzBKNVRDczJGL1Er?=
 =?utf-8?B?RFJ5YzJVc1AyU0pSaUpTc2dyTlBFUjV5cEpxUTh6K0JOK2hZcFlJampoaDlw?=
 =?utf-8?B?eC9ZbGtQek96U2JvQ09objQwbWFONVVCZ2gwVWgvS1Z2c0RYMzgxYW9EMzhu?=
 =?utf-8?B?SC96NXdrNnV6ZVJqMmYwR01BUGE1QzJMbFI1YzB5Y0hGUTlVb1FXWWcxMnVi?=
 =?utf-8?B?bzJOV3REYTJsMnNPMCtYMnd5M0V4L1hySHFPWHdYNng3SmZXbHNySmxjWWd4?=
 =?utf-8?B?YW5ZSzc0YmdVRUJvbnUybVVjVXZGSWpXTFErRktaaldDL1cwMndOelpCbUVa?=
 =?utf-8?B?Nkh1aExGUGZDdlBicS9ZdGZOTkdJdVJQRzcrTkovdVYrQUVkRlltc2IvOU05?=
 =?utf-8?B?VDdZeVB1clFLdXZwRG5zV2VJd3VhaEo4TTRZdnE1OG5NYTlMeVdNTWFYTDZo?=
 =?utf-8?B?eXd3SFFueERnVndsVXE2QnVZL1NxVDNzalFRZjMvNmQ5YllabElRR3gvRm9S?=
 =?utf-8?B?WGNFMkpFT0V0WFgzUlhrakVGZXBvZXJUakhmYVRiSjF1YjRpb3gvUDZsaTlm?=
 =?utf-8?B?dkJjNjRpRDJiaFp1dmpqZ2xUdnBkSWZxam9jekJuUHR4WTF2QlZsMUJkRHBM?=
 =?utf-8?B?VVBlQUltYnNFYnhCdjFZeWYwU3RVRWdmWjE0T0gxdW95aGo5cUdoVGJRRUt0?=
 =?utf-8?B?bmRUWTkzRUV2MVBhZUlRM252VFJMY3ZKWkY0ZS9wTWgwQlo5YVVLNmZqa29Q?=
 =?utf-8?B?ZGVTUk8vZU1xb3lGYlhUbnBnN0JrMzZ3Y0JPNkp6K2FGcXJGYnVzdXRnL093?=
 =?utf-8?B?SEFMN3dWS2lhcVZudHJHcmVrRG1zdGJnOVJpbDBZZVNsazRZbXArcEtTd0Q3?=
 =?utf-8?B?SXpSTjl0dS83UTNHUm9LNmZyOFFjTk5HM1pQUnNpUWRhTy9CTS9tNlczd1pk?=
 =?utf-8?B?Rm9EVGpuY0ZlNENqWGEwbE83cG53OUx0WDdUbnVFRkZOeURRSGg3NWxBQ3R5?=
 =?utf-8?B?M3drMGdBQ28rMk1Jb0JXOGVJbWlnbEhnWmVCZVFSQnF2U0NSK2FUZXphLytI?=
 =?utf-8?B?T1BsQVlxa081KzI5MDNCWUVQTlNRcTFGMUZhNzc1eHpnVktmVGpYaWlua3VY?=
 =?utf-8?B?aDViWWlKYkRIUW5nanBxbC9YOXpCQWUzTTJQTDYyMVhFUDJsRXRjZFdGTHFR?=
 =?utf-8?B?Qnc3NzdRNFZ2SHNuZmFZdGE1eVA4Zk1wN2hUMW5OWFgwbGZwQklYdTUrenFP?=
 =?utf-8?B?aGxjdUZSVXRYZ21MaVIvRFdBcjZkQ0tpL01iMXNWSDBQSXd1anZlRDZzbGhn?=
 =?utf-8?B?MEpQWTVCa1o2UXdzQkxnelNLQUxpSm55Nk9SVWFhR1JWNmFFamZmY25JcGw2?=
 =?utf-8?B?UGNpanFGK09IcGpzTjBHWWowUGZwdDlpVFRuTy80bkdzUGsyU3d5UFJZRzNM?=
 =?utf-8?B?ZVFVQmpQWGhPcHJQOVMza1Awbm4rUHRGRmNjalZtbldOeVY3Mk5ubHo4TXNS?=
 =?utf-8?B?cVpQZDI5VmNRekZlaVlodTh4MEQ5akRZT0FzblMrTUZoTzhwc0ZWbGlDV3lQ?=
 =?utf-8?B?clZCTjh5YUszVmhYY2UvWlk1NzhRYVVPclhrU3Q3Q2w3TzhVYjgyZ1ZXVk5C?=
 =?utf-8?B?Zk9LQWpBSTlLN1RKUURIZ1BHRjNLQjFPeVc3ZElqRnIvNEtPczZrSHE1L1RM?=
 =?utf-8?B?MlMxSzlDWG1TYW83aGFJQ2ZYUXcwZG1iRkhaSm1BekFMcEQ2cnRPeG1tSnIx?=
 =?utf-8?B?dzRsMU1HTm54U2hvK3lnc2JLVVZDTk1vS3J0SytoR3NFOHJVQnlnOGVpQUU2?=
 =?utf-8?Q?c2Lyfhq6L8vFPjPA=3D?=
X-Exchange-RoutingPolicyChecked: B4MyU4sczWOpfedgfmwI9aQ0xgJLMNJ7Bw5VYEKsI9OfP8CxEkSd8mdNvDAOTtn/6uoYEgr1l5UrsDksd539bY/9K1EoMbX5VZcap3a3mvyjQtHDxSKrTwGVKaJ8RSm0gNC+4xKOzkNZ36prH7sHT5++qz6PTCmPpE1WRjgQBlTGb4ExmGonht2lKcxB1Ig0F9bDsiA0bgxWJbqVRU7Ecsj+pk19bYpqVZ//cJSzvLrByTN6p09tBpfKrNzyCsAdM+DolkkpQn5Buu1MB9uHNTQNGRtMrqzv/625LhY/BIuACj+yNbNIV5IfPhU2oq8nJsV5EYfZYBnSAi8dSksoZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c9297e-1e81-4371-d902-08df2e904f71
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:55:45.4435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wToYrOt+2c1xVE43OMBlwmsVr7DAE5WAF5Rjqt3cWGom2CvKsw2wi/3E2FIYT05WMjIQ+iPMswyxvzdVusy1lqAiWy0qa3wP32C2FBGSyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
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

Separate the full assigned GGTT range size from the size available for
regular allocations.

For now both sizes are identical. A subsequent change will reserve part of
the full range for VF provisioning.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 773777afc68a2..abcc929c08535 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -113,9 +113,11 @@ struct xe_ggtt_pt_ops {
 struct xe_ggtt {
 	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-	/** @start: Start offset of GGTT */
+	/** @start: Start offset of the assigned GGTT range */
 	u64 start;
-	/** @size: Total usable size of this GGTT */
+	/** @full_size: Full size of the assigned GGTT range */
+	u64 full_size;
+	/** @size: Size of the GGTT range for regular use */
 	u64 size;
 	/**
 	 * @flags: Flags for this GGTT.
@@ -240,7 +242,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -254,7 +256,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -359,6 +361,7 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt->start = start;
+	ggtt->full_size = size;
 	ggtt->size = size;
 	drm_mm_init(&ggtt->mm, 0, size);
 }
-- 
2.34.1

